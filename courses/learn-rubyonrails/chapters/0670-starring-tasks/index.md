## Features

Let us introduce a new feature to let users star and unstar tasks. Starred tasks
are of higher importance than unstarred ones. This helps users organize their
important tasks easily.

These are the requirements of the feature.

- Starred tasks should always be displayed at the top. They should be sorted
  based on the time of starring. That is, the last starred task should be shown
  at the very top.

- We need to show a star icon on every task row in the list. Clicking on this
  icon should toggle the starred/unstarred status of the task.

- No success notification should be displayed when a task's status is updated.

- Both the assignee and creator should be able to star/unstar a task.

- Both starred and unstarred tasks will have star-shaped icons attached to them.
  Starred tasks should have a bright yellow filling and the unstarred ones will
  be left transparent with white borders. This will let users identify starred
  tasks quickly.

<image>tasks-starring-feature.png</image>

## Technical design

To implement this feature, we need to introduce the following changes:

**On the backend**

- Add a new column in `tasks` table to store the starred status of the task.

- Add a new enum attribute called `status` in the `Task` model with two possible
  values: `starred` and `unstarred`.

- Permit the `status` parameter when retrieving the Action Controller parameters
  for `task`, such that we can persist latest status to database.

- For pending as well as completed tasks, we will load the starred and unstarred
  tasks separately and sort them, then merge them using the
  [+ operator](https://ruby-doc.org/core-2.5.0/Array.html#method-i-2B) of
  arrays.

- For the purpose of sorting tasks, we will use the `order` method of
  `ActiveRecord` class which accepts one or more than one column names of a
  table along with the order direction. It returns a collection of records which
  are sorted on the basis of the columns passed as argument, in the direction
  specified.

- For ensuring authorization, we do not need to do anything. In the code we
  wrote earlier, no `params` except `title` and `assigned_user_id` are
  restricted. So `status` will be accessible to both creator and assignee.

**On the frontend**

- Add a new column in the list view displaying the starred status icon. CSS
  classes are applied to this icon based on the value of the task's `status`.

- Add a new function in the `Dashboard` component to toggle starred state of a
  task. This function will be using the update API like the
  `handleProgressToggle` function.
- Pass this function as props to the `Row` component and use it as the click
  handler of the star icon.

We are now ready to start coding. Let us dive in.

## Storing starred status in DB

Let's create a migration to add a column called `status` to the `tasks` table:

```bash
bundle exec rails g migration AddStatusToTasks
```

Open `db/migrate/add_status_to_tasks.rb` file and add following lines:

```ruby
class AddStatusToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :status, :string, default: "unstarred", null: false
  end
end
```

Now let's run the migration:

```bash
bundle exec rails db:migrate
```

Now let's define an enum in `models/tasks.rb`. Add the following line:

```ruby {2}
class Task < ApplicationRecord
  enum :status, { unstarred: "unstarred", starred: "starred" }, default: :unstarred

  # previous code

  private

    # previous code
end
```

Let's go ahead and permit a parameter called `status`. Let's update the
`task_params` method as shown below:

```ruby {2}
def task_params
  params.require(:task).permit(:title, :assigned_user_id, :progress, :status)
end
```

Like we did for `progress` in the
[previous chapter](/learn-rubyonrails/marking-a-task-as-complete#storing-progress-in-db),
we also need to add a value for `status` to `task` factory. Add the following
line to `test/factories/task.rb`:

```ruby {9}
# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    association :assigned_user, factory: :user
    association :task_owner, factory: :user
    title { Faker::Lorem.sentence[0..49] }
    progress {'pending'}
    status { 'unstarred' }
  end
end
```

## Update index action to send starred status

Now let us update our index action to retrieve the sorted list of tasks using
the `order` method we have discussed earlier.

```ruby
# previous code...
def index
  tasks = policy_scope(Task)

  pending_starred = tasks.pending.starred.includes(:assigned_user).order('updated_at DESC')
  pending_unstarred = tasks.pending.unstarred.includes(:assigned_user).order('updated_at DESC')
  @pending_tasks = pending_starred + pending_unstarred

  completed_starred = tasks.completed.starred.order('updated_at DESC')
  completed_unstarred = tasks.completed.unstarred.order('updated_at DESC')
  @completed_tasks = completed_starred + completed_unstarred
end
# previous code...
```

Now take a moment, and check if there's something that we can improve in the
above mentioned `index` action.

Our `index` action is starting to get longer. Also, we are now repeating a
similar block of code for both pending and completed tasks.

The Rails ideology is to keep the controllers as skinny as possible. That is why
we often delegate the logic into `concerns`, `helpers` etc.

So let us move the repeating piece of code to the `Task` model:

```ruby {7-13}
class Task < ApplicationRecord

  # previous code

  private

    def self.of_status(progress)
      if progress == :pending
        pending.in_order_of(:status, %w(starred unstarred)).order("updated_at DESC")
      else
        completed.in_order_of(:status, %w(starred unstarred)).order("updated_at DESC")
      end
    end

    # previous code
end
```

Inside the `of_status` method, we are conditionally querying the tasks based on
their `progress`. We can call this method in task controller's index action and
pass the progress as an argument.

The `of_status` method returns the tasks in such a way that the `starred` ones
precede the `unstarred` ones. Also, these tasks are sorted in decreasing order
of their `updated_at` timestamp i.e the last updated task is returned first.
This is achieved with the help of the built-in `in_order_of` method from Rails.
This method allows you to specify an explicit order while fetching an active
record collection. Since the result returned by the method is an
`ActiveRecord::Relation` object, we can chain other scopes or query methods with
it. You can learn more about the `in_order_of` method in this
[PR](https://github.com/rails/rails/pull/42061).

Let's update the `index` action in `tasks_controller` to make use of the class
method that we wrote. Replace the `index` method with the following content:

```ruby
# previous code...
def index
  tasks = policy_scope(Task)
  @pending_tasks = tasks.includes(:assigned_user).of_status(:pending)
  @completed_tasks = tasks.of_status(:completed)
end
# previous code...
```

See, our `index` method is much simpler to read now.

Update the highlighted lines in `app/views/tasks/index.json.jbuilder`:

```ruby {4-6}
json.tasks do
  json.pending @pending_tasks do |pending_task|
    json.partial! "tasks/task", task: pending_task
    json.extract! pending_task,
      :progress,
      :status
  end

  json.completed @completed_tasks
end
```

## Adding a toggle to star/unstar tasks

Now, let's add the method `starTask`. It would use the update API to toggle the
status of the task.

Replace `app/javascript/src/components/Dashboard/index.jsx` with the following
code:

```jsx
import React, { useState, useEffect } from "react";
import { all, isNil, isEmpty, either } from "ramda";

import tasksApi from "apis/tasks";
import Container from "components/Container";
import PageLoader from "components/PageLoader";
import Table from "components/Tasks/Table";

const Dashboard = ({ history }) => {
  const [pendingTasks, setPendingTasks] = useState([]);
  const [completedTasks, setCompletedTasks] = useState([]);
  const [loading, setLoading] = useState(true);

  const fetchTasks = async () => {
    try {
      const {
        data: {
          tasks: { pending, completed },
        },
      } = await tasksApi.list();
      setPendingTasks(pending);
      setCompletedTasks(completed);
    } catch (error) {
      logger.error(error);
    } finally {
      setLoading(false);
    }
  };

  const handleProgressToggle = async ({ slug, progress }) => {
    try {
      await tasksApi.update({
        slug,
        payload: { progress },
        quiet: true,
      });
      await fetchTasks();
    } catch (error) {
      logger.error(error);
    }
  };

  const destroyTask = async slug => {
    try {
      await tasksApi.destroy({ slug, quiet: true });
      await fetchTasks();
    } catch (error) {
      logger.error(error);
    }
  };

  const showTask = slug => {
    history.push(`/tasks/${slug}/show`);
  };

  const starTask = async (slug, status) => {
    try {
      const toggledStatus = status === "starred" ? "unstarred" : "starred";
      await tasksApi.update({
        slug,
        payload: { status: toggledStatus },
        quiet: true,
      });
      await fetchTasks();
    } catch (error) {
      logger.error(error);
    }
  };

  useEffect(() => {
    fetchTasks();
  }, []);

  if (loading) {
    return (
      <div className="w-screen h-screen">
        <PageLoader />
      </div>
    );
  }

  if (all(either(isNil, isEmpty), [pendingTasks, completedTasks])) {
    return (
      <Container>
        <h1 className="my-5 text-xl leading-5 text-center">
          You have not created or been assigned any tasks 🥳
        </h1>
      </Container>
    );
  }

  return (
    <Container>
      {!either(isNil, isEmpty)(pendingTasks) && (
        <Table
          data={pendingTasks}
          destroyTask={destroyTask}
          showTask={showTask}
          handleProgressToggle={handleProgressToggle}
          starTask={starTask}
        />
      )}
      {!either(isNil, isEmpty)(completedTasks) && (
        <Table
          type="completed"
          data={completedTasks}
          destroyTask={destroyTask}
          handleProgressToggle={handleProgressToggle}
        />
      )}
    </Container>
  );
};

export default Dashboard;
```

We do not want to show a success notification when a task is starred/unstarred
hence we have added a `quiet` query param in the API call for updating the task
status like we did for task progress update API in the previous chapter.

We don't need to make any changes to the `update` action in the backend or to
the update tasks API connector.

In `app/javascript/src/components/Tasks/Table/index.jsx`, forward the `starTask`
function to `Row` component.

Replace content of `app/javascript/src/components/Tasks/Table/index.jsx` with
the following code:

```jsx
import React from "react";
import Header from "./Header";
import Row from "./Row";

const Table = ({
  type = "pending",
  data,
  destroyTask,
  showTask,
  handleProgressToggle,
  starTask,
}) => {
  return (
    <div className="flex flex-col mt-10">
      <div className="my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div
          className="inline-block min-w-full py-2
            align-middle sm:px-6 lg:px-8"
        >
          <div
            className="overflow-hidden border-b
              border-gray-200 shadow md:custom-box-shadow"
          >
            <table className="min-w-full divide-y divide-gray-200">
              <Header type={type} />
              <Row
                data={data}
                type={type}
                destroyTask={destroyTask}
                showTask={showTask}
                handleProgressToggle={handleProgressToggle}
                starTask={starTask}
              />
            </table>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Table;
```

Note that, we will only be allowing the user to star/unstar tasks which are not
yet completed. Thus, replace `Row` with the following code:

```jsx
import React from "react";
import classnames from "classnames";
import PropTypes from "prop-types";

import Tooltip from "components/Tooltip";

const Row = ({
  type = "pending",
  data,
  destroyTask,
  showTask,
  handleProgressToggle,
  starTask,
}) => {
  const isCompleted = type === "completed";
  const toggledProgress = isCompleted ? "pending" : "completed";

  return (
    <tbody className="bg-white divide-y divide-gray-200">
      {data.map(rowData => (
        <tr key={rowData.id}>
          <td className="text-center">
            <input
              type="checkbox"
              checked={isCompleted}
              className="ml-6 w-4 h-4 text-bb-purple border-gray-300
                  rounded focus:ring-bb-purple cursor-pointer"
              onChange={() =>
                handleProgressToggle({
                  slug: rowData.slug,
                  progress: toggledProgress,
                })
              }
            />
          </td>
          <td
            className={classnames(
               "block w-64 px-6 py-4 text-sm font-medium leading-8
                text-bb-purple capitalize truncate",
              {
                "cursor-pointer": !isCompleted,
                "text-opacity-50": isCompleted,
              }
            )}
            onClick={() => !isCompleted && showTask(rowData.slug)}
          >
            <Tooltip content={rowData.title} delay={200} direction="top">
              <div className="truncate max-w-64 ">{rowData.title}</div>
            </Tooltip>
          </td>
          {!isCompleted && (
            <>
              <td className="px-6 py-4 text-sm font-medium leading-5
                            text-bb-gray-600 whitespace-no-wrap">
                {rowData.assigned_user.name}
              </td>
              <td className="pl-6 py-4 text-center cursor-pointer">
                <i
                  className={classnames(
                    "transition duration-300 ease-in-out text-2xl hover:text-bb-yellow p-1",
                    {
                      "text-bb-border ri-star-line":
                        rowData.status !== "starred",
                    },
                    {
                      "text-white text-bb-yellow ri-star-fill":
                        rowData.status === "starred",
                    }
                  )}
                  onClick={() => starTask(rowData.slug, rowData.status)}
                ></i>
              </td>
            </>
          )}
          {isCompleted && (
            <>
              <td style={{ width: "164px" }}></td>
              <td className="pl-6 py-4 text-center cursor-pointer">
                <i
                  className="text-2xl text-center text-bb-border
                  transition duration-300 ease-in-out
                  ri-delete-bin-5-line hover:text-bb-red"
                  onClick={() => destroyTask(rowData.slug)}
                ></i>
              </td>
            </>
          )}
        </tr>
      ))}
    </tbody>
  );
};

Row.propTypes = {
  data: PropTypes.array.isRequired,
  type: PropTypes.string,
  destroyTask: PropTypes.func,
  showTask: PropTypes.func,
  handleProgressToggle: PropTypes.func,
  starTask: PropTypes.func,
};

export default Row;
```

Start the Rails server and verify everything is working fine. Now, a user should
be able to star/unstar tasks by clicking on the icon from their dashboard.

Now let's commit these changes:

```bash
git add -A
git commit -m "Added starring feature to tasks"
```
