## Features

We will be adding a feature to mark a task as "complete".

These are the expected changes:

- Tasks will have two possible states: **pending** or **completed**. A task can
  be in any one of these states at a time. Let us call this state the
  **progress** of the task from now on.

- Progress of every task will be pending by default when created.

- Pending and completed tasks should be listed separately. Since completed tasks
  need not require any special attention, they can be listed at bottom of the
  page in dim colors.

- On the tasks list page, there should be a checkbox for every task to switch
  their progress. Checked means the task is completed and unchecked means
  pending.

- When the progress of a task is changed, it should immediately move to its
  designated list. In other words, a completed task should not stay in the
  pending task's list once its checkbox is checked.

- No notification should be displayed if a task's progress is successfully
  updated because from a UI perspective the result of this action will be
  visible and showing a notification is not required.

- The task delete button should only be visible for completed tasks.

- A delete button should be present in the show task page which should allow
  users to delete pending tasks.

- User should be redirected to the dashboard page from the show task page if
  task is successfully deleted.

- The assignee name need not be shown for completed tasks.

- Both task assignee and task owner should be allowed to update the task's
  progress.

Our tasks list page will look like this when the feature implementation is
complete:

<image alt="Tasks progress feature">task-progress-feature.png</image>

## Technical design

Implementation of this feature can be done like this:

- We will add an enum attribute called `progress` in the `Task` model. The value
  of this enum attribute will be a string.

- We will add a new string column named `progress` in the `tasks` table and use
  `ActiveRecord::Enum` to map the enum attributes with the string values stored
  in the `progress` column.

- In the `index` action of the task controller, we will filter `pending` and
  `completed` tasks separately and will return them in the response.

- We will add a `Jbuilder` for `index` action in `TasksController` to declare
  and render a JSON of `completed` and `pending` tasks.

- Since we will reuse `update` action to change the progress of tasks, we need a
  finer control over the authorization now. That is, only the creator should be
  allowed to change the title and assignee of the task. But both creator and
  assignee should be allowed to change its progress.

- For controlling authorization, we will create a `before_action` callback which
  checks who is updating which field and throws an error in case the operation
  is not allowed.

- Towards the bottom of our tasks list page, we will add a new table to display
  the list of completed tasks.

- We will conditionally render the delete button and assignee name based on the
  progress of the task.

- To add more flexibility, we will also add the ability for the user to delete a
  task from the `Show` component too. We will create a `deleteTask` function to
  delete the task even if the task is pending.

Now let us start implementing the feature.

## Storing progress in DB

Let's create a migration to add a column called `progress` to `Tasks` table:

```bash
bundle exec rails g migration AddProgressToTasks
```

Open `db/migrate/add_progress_to_tasks.rb` file and add following lines:

```ruby
class AddProgressToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :progress, :string, default: "pending", null: false
  end
end
```

Now let's run the migration:

```bash
bundle exec rails db:migrate
```

Since the `progress` attribute will always consist of a predefined set of
values, which are `pending` and `completed`, we can make use of an `enum` data
type.

We will be making use of `ActiveRecord::Enum` for the same. It allows us to
declare an enum attribute where the values map to strings in the database, but
can be queried by name.

Now let's define an enum in `models/tasks.rb`. Add the following line:

```ruby {2}
class Task < ApplicationRecord
  enum :progress, { pending: "pending", completed: "completed" }, default: :pending

  # previous code

  private

    # previous code
end
```

As discussed in the previous chapter, `ActiveRecord::Enum` adds a lot of
instances methods to the enum variable, which will help us easily retrieve data.
For example:

```ruby
task.completed? # => true
task.progress   # => "completed"
```

To know more about the usage of enums, you can refer to the
[Using Enums in Rails](/learn-rubyonrails/CH-53-using-enums-in-rails)
chapter and come back.

By default all the tasks will be marked as `pending`, since we have already set
the default value for the `progress` column as `pending` in the migration that
we wrote.

To update the `progress` of a task, we will be making use of the already
existing `update` action in `tasks_controller.rb`. However we need to refactor
the `update` action so that no success message is sent along with the response
if the request is for updating a task's progress. To do so we will attach a
`quiet` query parameter in the request URL for a progress update request. If the
param is present then a success message should be sent.

As we already know, we should first permit the parameter `progress` in
`task_params` method.

Let's update the `task_params` method as shown below:

```ruby {2}
def task_params
  params.require(:task).permit(:title, :assigned_user_id, :progress)
end
```

Now update the `update` action of `TasksController` like this:

```ruby
def update
  authorize @task
  @task.update!(task_params)
  render_notice(t("successfully_updated", entity: "Task")) unless params.key?(:quiet)
end
```

Now let's update the `index` action of `TasksController` to send both pending
and completed tasks separately in the response as shown below:

```ruby {3-4}
def index
  tasks = policy_scope(Task)
  @pending_tasks = tasks.pending.as_json(include: { assigned_user: { only: %i[name id] } })
  @completed_tasks = tasks.completed
end
```

So far we have been using the `as_json` method to load the association data. The
problem with using `as_json` to load `assigned_user` here is that for each
`pending_task` a new query will be sent to the database to load its associated
`assigned_user`.

This is called an `n+1` query issue where n number of additional queries are
made to fetch some data that could be fetched in one query. To learn more about
the `n+1` query issue and how to avoid it you can refer to the in-depth
[n+1 queries and memoization chapter](/learn-rubyonrails/n+1-queries-and-memoization).

We can avoid `n+1` queries by using the `includes` method to fetch the
`assigned_user` like this:

```ruby {3}
def index
  tasks = policy_scope(Task)
  @pending_tasks = tasks.pending.includes(:assigned_user)
  @completed_tasks = tasks.completed
end
```

Specifying the association name in `includes` method will preload the
association data for all pending tasks and no additional queries would be
required to get the `assigned_user` details. To read about the `includes` method
and how it works in-depth refer to the
[n+1 queries and memoization chapter](/learn-rubyonrails/n+1-queries-and-memoization#query-with-includes-method).

Now let's add a `Jbuilder` for `index` action to declare a JSON response
structure for tasks.

Run the following command to create the `index.json.jbuilder` file:

```bash
touch ./app/views/tasks/index.json.jbuilder
```

Add the following lines of code inside the `app/views/tasks/index.json.jbuilder`
file:

```ruby
json.tasks do
  json.pending @pending_tasks do |pending_task|
    json.id pending_task.id
    json.title pending_task.title
    json.slug pending_task.slug
    json.progress pending_task.progress
    json.assigned_user do
      json.extract! pending_task.assigned_user,
        :id,
        :name
    end
  end

  json.completed @completed_tasks
end
```

Finally we need to update our `task` factory to include a value for `progress`.
Add the following line to `test/factories/task.rb`:

```ruby {8}
# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    association :assigned_user, factory: :user
    association :task_owner, factory: :user
    title { Faker::Lorem.sentence[0..49] }
    progress {'pending'}
  end
end
```

## Partials in Jbuilder

Attributes like `id`, `title`, `slug` and `assigned_user` in the `tasks.pending`
JSON are also present in the JSON structure we had declared inside the
`show.json.jbuilder`. Instead of writing the same code again we should declare a
partial JSON structure which will contain the common attributes of a task object
and then we can import that partial JSON in `index.json.jbuilder` and
`show.json.jbuilder`.

`Jbuilder` lets us declare partial JSONs. To declare a partial JSON structure
for task, create a new file called `_task.json.jbuilder` using the following
command:

```bash
touch app/views/tasks/_task.json.jbuilder
```

Name of a partial JSON file is always prefixed with an underscore and it should
match with the model name. In this case, the partial JSON will render a JSON of
`task` attributes hence it is named after the `Task` model.

Add the following lines of code inside the `_task.json.jbuilder` file:

```ruby
json.id task.id
json.title task.title
json.slug task.slug
json.assigned_user do
  json.extract! task.assigned_user,
    :id,
    :name
end
```

We have added the common attributes from `show.json.jbuilder` and
`index.json.jbuilder` in the partial `_task.json.jbuilder` file. Now import the
partial JSON file inside `show.json.jbuilder`. To do so, fully update the
`show.json.jbuilder` with the following lines of code:

```ruby
json.task do
  json.partial! "tasks/task", task: @task

  json.comments @comments do |comment|
    json.extract! comment,
      :id,
      :content,
      :created_at
  end

  json.task_owner do
    json.extract! @task.task_owner,
      :name
  end
end
```

Similarly, fully update the `index.json.jbuilder` like this:

```ruby
json.tasks do
  json.pending @pending_tasks do |pending_task|
    json.partial! "tasks/task", task: pending_task
    json.progress pending_task.progress
  end

  json.completed @completed_tasks
end
```

Jbuilder provides a `partial!` method which accepts the relative path of the
partial Jbuilder file and a variable which contains the object whose attributes
are to be used to build the JSON. This variable can be accessed inside the
partial Jbuilder file.

In this case, the relative path of the partial Jbuilder file is `tasks/task` and
the variable is `task` which contains the `@task` object. `task` can be accessed
inside the partial `_task.json.jbuilder` file. To learn more about the
`partial!` method you can refer to the
[official documentation](https://github.com/rails/jbuilder) for `Jbuilder`.

## Fine tuning authorization

Now, we need to allow both creator and assignee to update the progress of tasks.
More importantly, we need to disallow the assignee from updating any other
fields and permit only the creator.

Here in this case, the `title`, `task_owner_id` and `assigned_user_id` should be
restricted attributes. That is, only the creator of the task should be allowed
to modify their values.

Conversely, `progress` attribute will be unrestricted. Both the creator and
assignee should be able to change its value.

We have two options in this situation:

1. Instead of using `task_params` method to filter the `params`, use pundit's
   [strong parameters](https://github.com/varvet/pundit#strong-parameters)
   style. This way, we will conditionally filter the request data from pundit
   policy class before accessing it from the `update` action. We will remove
   everything except the `:progress` parameter if the request is from the
   assignee.

   - The plus point of this approach is that it delegates all the
     authorization-related tasks to the `pundit` policy itself. The controller
     will remain lean.

   - The problem with this approach is its unpredictability. It silently ignores
     the disallowed `params` and executes the `update` action with the remaining
     ones. It won't throw an error even if all supplied `params` were filtered
     out.

   - So, from the user's point of view, saving changes would seem to be
     successful since no error message is shown. But the task's attributes won't
     change. The user might suspect this as a bug. Ideally, we should send a
     `forbidden` status if user is trying to modify unauthorized parameters.

2. The second way is to add a `before_action` callback for `update` action. From
   there, if the request is from the assignee and if the request `params`
   contains any restricted attributes (`title` or `user_id`), throw
   authorization error.

   - The advantages and disadvantages of this approach are the opposite of the
     first method.

   - Advantage is that we will be able to handle the response based on the task
     params and send back an appropriate message in case of authorization
     errors.

   - Disadvantage is that we need to code the authorization logic in our
     controller itself.

For the first method, its drawbacks overshadow its advantages. Therefore, let us
proceed with the second approach.

First, we need to grant access to update action for both assignee and creator in
our pundit policy. Open `app/policies/task_policy.rb` and update the following
lines:

```ruby {14}
  # ... previous code ...
  def show?
    task.task_owner_id == user.id || task.assigned_user_id == user.id
  end

  # The condition for edit policy is the same as that of the show.
  # Hence, we can simply call `show?` inside the edit? policy here.
  def edit?
    show?
  end

  # Similar in the case for update? policy.
  def update?
    show?
  end
  # ... previous code ...
```

Now, open `app/models/task.rb` and define the attributes that are restricted for
assignee:

```ruby {2}
class Task < ApplicationRecord
  RESTRICTED_ATTRIBUTES = %i[title task_owner_id assigned_user_id]
  # ... previous code ...
end
```

Now, in `app/controllers/tasks_controller.rb`, add the following lines:

```ruby {5, 15-21}
class TasksController < ApplicationController
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  before_action :load_task!, only: %i[show update destroy]
  before_action :ensure_authorized_update_to_restricted_attrs, only: :update

  # ...previous code...

  private

    def task_params
      params.require(:task).permit(:title, :assigned_user_id, :progress)
    end

    def ensure_authorized_update_to_restricted_attrs
      is_editing_restricted_params = Task::RESTRICTED_ATTRIBUTES.any? { |a| task_params.key?(a) }
      is_not_owner = @task.task_owner_id != @current_user.id
      if is_editing_restricted_params && is_not_owner
        handle_authorization_error
      end
    end

  # ...previous code...
```

The beauty of writing clean and fluent code is that there isn't a requirement
for another person to explain what the method does. People will be able to
figure it out on their own because the naming is very accurate. It's almost like
reading an English sentence!

The overall gist of the above method is that if the request is not from the
owner of the task and if it is trying to edit the restricted attributes, then we
will raise `handle_authorization_error` before the action `update` is even
executed.

Since the request encounters an error in the `before_action` callback, the
`update` action won't run. The error message will be returned as the response.

## Adding toggle for pending/completed tasks

Let us now move on to the frontend. We need to make a new list to show completed
tasks and we need to create a toggle mechanism in the UI to let a user toggle
the progress of a task as completed or pending.

Fully replace the content of
`app/javascript/src/components/Dashboard/index.jsx`, with the following code:

```jsx
import React, { useState, useEffect } from "react";

import { all, isNil, isEmpty, either } from "ramda";

import tasksApi from "apis/tasks";
import { Container, PageLoader, PageTitle } from "components/commons";
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
      } = await tasksApi.fetch();
      setPendingTasks(pending);
      setCompletedTasks(completed);
    } catch (error) {
      logger.error(error);
    } finally {
      setLoading(false);
    }
  };

  const destroyTask = async slug => {
    try {
      await tasksApi.destroy(slug);
      await fetchTasks();
    } catch (error) {
      logger.error(error);
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
    } finally {
      setLoading(false);
    }
  };

  const showTask = slug => {
    history.push(`/tasks/${slug}/show`);
  };

  useEffect(() => {
    fetchTasks();
  }, []);

  if (loading) {
    return (
      <div className="h-screen w-screen">
        <PageLoader />
      </div>
    );
  }

  if (all(either(isNil, isEmpty), [pendingTasks, completedTasks])) {
    return (
      <Container>
        <h1 className="my-5 text-center text-xl leading-5">
          You have not created or been assigned any tasks 🥳
        </h1>
      </Container>
    );
  }

  return (
    <Container>
      <div className="flex flex-col gap-y-8">
        <PageTitle title="Todo list" />
        {!either(isNil, isEmpty)(pendingTasks) && (
          <Table
            data={pendingTasks}
            destroyTask={destroyTask}
            handleProgressToggle={handleProgressToggle}
            showTask={showTask}
          />
        )}
        {!either(isNil, isEmpty)(completedTasks) && (
          <Table
            data={completedTasks}
            destroyTask={destroyTask}
            handleProgressToggle={handleProgressToggle}
            type="completed"
          />
        )}
      </div>
    </Container>
  );
};

export default Dashboard;
```

Now update the `apis/tasks.js` API connector file with the `quiet` argument like
so:

```javascript {4-7}
// previous code

const update = ({ slug, payload, quiet = false }) => {
  const path = quiet ? `/tasks/${slug}?quiet` : `/tasks/${slug}`;
  return axios.put(path, {
    task: payload,
  });
};
```

If you recall earlier in this chapter we discussed about attaching a `quiet`
query param to the URL in case we don't want the response to contain a success
message.

We haven't passed a value to the `quiet` query parameter because logically it
can be either true or false. Passing a boolean will be redundant in this case.
We can infer the value in backend by checking for the presence of the `quiet`
key in the params hash. If the key is present then the value should be true
otherwise false.

Moreover, URLs are strings so a boolean query param would be typecasted to a
string value i.e. `true` would be typecasted to `"true"`. In the server side, we
would have had to add additional logic to convert the value of the `quiet` param
to a boolean.

When a task is updated from the `Edit` page, a success message will be sent from
the backend and it will be displayed as a notification. The API call for
updating a task from the `Edit` component doesn't contain a `quiet` argument as
shown in the following code snippet:

```jsx
const handleSubmit = async event => {
  event.preventDefault();
  try {
    await tasksApi.update({
      slug,
      payload: { title, assigned_user_id: userId },
    });
    setLoading(false);
    history.push("/");
  } catch (error) {
    setLoading(false);
    logger.error(error);
  }
};
```

The URL in this case would be `/tasks/${slug}`. It doesn't contain a `quiet`
param therefore a success message will be sent in the response.

Fully replace the content of `Table/index.jsx`with the following lines of code:

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
}) => (
  <div className="inline-block min-w-full">
    <table className="min-w-full border-collapse border border-gray-300">
      <Header type={type} />
      <Row
        data={data}
        destroyTask={destroyTask}
        handleProgressToggle={handleProgressToggle}
        showTask={showTask}
        type={type}
      />
    </table>
  </div>
);

export default Table;
```

Here, we are passing `type` and `handleProgressToggle` as props to `Row`. The
`type` denotes the current `progress`, that is `pending` or `completed`.

Now, inside `Header.jsx`, fully replace with the following content:

```jsx
import React from "react";

import { compose, head, join, juxt, tail, toUpper } from "ramda";

const Header = ({ type }) => {
  const getTitleCase = compose(join(""), juxt([compose(toUpper, head), tail]));

  const title = `${getTitleCase(type)} Tasks`;

  return (
    <thead>
      <tr>
        <th className="w-1 border-b border-r border-gray-300 bg-gray-100" />
        <th className="border-b border-r border-gray-300 bg-gray-100 px-4 py-2.5 text-left text-xs font-bold uppercase leading-4 text-gray-800">
          {title}
        </th>
        {type === "pending" && (
          <th className="border-b border-r border-gray-300 bg-gray-100 px-4 py-2.5 text-left text-xs font-bold uppercase leading-4 text-gray-800">
            Assigned To
          </th>
        )}
        {type === "completed" && (
          <th className="border-b border-gray-300 bg-gray-100 px-4 py-2.5 text-center text-xs font-bold uppercase leading-4 text-gray-800">
            Actions
          </th>
        )}
        {type === "pending" && (
          <th className="border-b border-gray-300 bg-gray-100 px-4 py-2.5 text-center text-xs font-bold uppercase leading-4 text-gray-800">
            Starred
          </th>
        )}
      </tr>
    </thead>
  );
};

export default Header;
```

In the `Header`, we are conditionally rendering table headers using the `&&`
operator. Such blocks will be rendered only if the condition preceding it is
truthy.

But that approach has an edge case. If the condition preceding the JSX evaluates
to `0`, which is falsy, the JSX won't be rendered. But react will display `0` in
the UI where we expected no JSX or block to be rendered.

Therefore be careful when using `&&` to render conditional blocks when the
condition statement is a function/variable that may not strictly be of type
`boolean`.

Also, if the grouped statements are too long or too complex, then it ought to be
moved out into a separate component within that file, so as to improve
readability.

Now, inside `Row.jsx`, fully replace with the following content:

```jsx
import React from "react";

import classnames from "classnames";
import PropTypes from "prop-types";

import { Tooltip } from "components/commons";

const Row = ({
  type = "pending",
  data,
  destroyTask,
  showTask,
  handleProgressToggle,
}) => {
  const isCompleted = type === "completed";
  const toggledProgress = isCompleted ? "pending" : "completed";

  return (
    <tbody className="divide-y divide-gray-200 bg-white">
      {data.map(rowData => (
        <tr key={rowData.id}>
          <td className="border-r border-gray-300 px-4 py-2.5 text-center">
            <Tooltip
              tooltipContent={
                isCompleted ? "Mark as incomplete" : "Mark as completed"
              }
            >
              <input
                checked={isCompleted}
                className="form-checkbox h-4 w-4 cursor-pointer rounded border-gray-300 text-indigo-600 focus:text-indigo-600"
                type="checkbox"
                onChange={() =>
                  handleProgressToggle({
                    slug: rowData.slug,
                    progress: toggledProgress,
                  })
                }
              />
            </Tooltip>
          </td>
          <td
            className={classnames(
              "border-r border-gray-300 px-4 py-2.5 text-sm font-medium capitalize text-indigo-600",
              {
                "cursor-pointer": !isCompleted,
                "cursor-not-allowed line-through": isCompleted,
              }
            )}
            onClick={() => !isCompleted && showTask(rowData.slug)}
          >
            <Tooltip tooltipContent={rowData.title}>
              <span>{rowData.title}</span>
            </Tooltip>
          </td>
          {!isCompleted && (
            <td className="whitespace-no-wrap border-r border-gray-300 px-4 py-2.5 text-sm text-gray-800">
              {rowData.assigned_user.name}
            </td>
          )}
          {isCompleted && (
            <td className="cursor-pointer px-4 py-2.5 text-center">
              <Tooltip tooltipContent="Delete">
                <button onClick={() => destroyTask(rowData.slug)}>
                  <i className="ri-delete-bin-line text-2xl text-gray-400 transition duration-300 ease-in-out hover:text-red-500" />
                </button>
              </Tooltip>
            </td>
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
};

export default Row;
```

After making the above mentioned changes, we will be able to see two tables in
the dashboard. One shows the list of completed tasks and other one shows the
list of pending tasks.

The `handleProgressToggle` function allows a user to toggle the progress of a
task between completed/pending.

A user can toggle between the two states of the task by clicking on the input
checkbox part of each `Row`.

Previously we had added the ability for the user to delete completed tasks. But
to be more flexible, we can add the same delete feature in our `Show` component
and allow deletion of even pending tasks.

Let us add another delete button inside the `Show` component. This will allow
the user to delete a task even if the task is pending.

Fully replace `Show.jsx` with the following content:

```jsx
import React, { useEffect, useState } from "react";

import { useHistory, useParams } from "react-router-dom";

import commentsApi from "apis/comments";
import tasksApi from "apis/tasks";
import Comments from "components/Comments";
import { Button, Container, PageLoader } from "components/commons";

const Show = () => {
  const [task, setTask] = useState([]);
  const [pageLoading, setPageLoading] = useState(true);
  const [newComment, setNewComment] = useState("");
  const [loading, setLoading] = useState(false);
  const { slug } = useParams();
  const history = useHistory();

  const destroyTask = async () => {
    try {
      await tasksApi.destroy({ slug: task.slug });
      history.push("/");
    } catch (error) {
      logger.error(error);
    }
  };

  const updateTask = () => {
    history.push(`/tasks/${task.slug}/edit`);
  };

  const fetchTaskDetails = async () => {
    try {
      const {
        data: { task },
      } = await tasksApi.show(slug);
      setTask(task);
      setPageLoading(false);
    } catch (error) {
      logger.error(error);
      history.push("/");
    }
  };

  const addComment = async event => {
    event.preventDefault();
    setLoading(true);
    try {
      await commentsApi.create({
        content: newComment,
        task_id: task.id,
      });
      fetchTaskDetails();
      setNewComment("");
    } catch (error) {
      logger.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchTaskDetails();
  }, []);

  if (pageLoading) {
    return <PageLoader />;
  }

  return (
    <Container>
      <div className="flex flex-col gap-y-8">
        <div className="mt-8 flex w-full items-start justify-between gap-x-6">
          <div className="flex flex-col gap-y-2">
            <h2 className="text-3xl font-semibold">{task?.title}</h2>
            <div className="flex items-center gap-x-6">
              <p className="text-base text-gray-700">
                <span className="font-semibold">Assigned to: </span>
                {task?.assigned_user?.name}
              </p>
              <p className="text-base text-gray-700">
                <span className="font-semibold">Created by: </span>
                {task?.task_owner?.name}
              </p>
            </div>
          </div>
          <div className="flex items-center justify-end gap-x-3">
            <Button
              buttonText="Delete"
              icon="delete-bin-5-line"
              size="small"
              style="secondary"
              onClick={destroyTask}
            />
            <Button
              buttonText="Edit"
              icon="edit-line"
              size="small"
              style="secondary"
              onClick={updateTask}
            />
          </div>
        </div>
        <Comments
          comments={task?.comments}
          handleSubmit={addComment}
          loading={loading}
          newComment={newComment}
          setNewComment={setNewComment}
        />
      </div>
    </Container>
  );
};

export default Show;
```

Users can now delete pending tasks if they wish to on the show task page.

When the users delete the task from the show task page, they should be
redirected back to the dashboard once the task is successfully deleted and a
success notification should be displayed.

If you recall we didn't add the logic to send a success message in the response
when a task is deleted from the dashboard.

We need to update the `destroy` action of the `TasksController` to send a
success message in the JSON response only if the task is successfully deleted
from the show task page. We can handle this in the same manner we handled the
task progress update.

We should update the API connector for deleting a task and add a `quiet` query
param to the task destroy API endpoint if the task is deleted from the
dashboard.

Update the `destroy` action in the `TasksController` like this:

```ruby {4}
def destroy
  authorize @task
  @task.destroy!
  render_notice("Task was successfully deleted!") unless params.key?(:quiet)
end
```

Now, update the following lines of code in the `Dashboard` component:

```jsx {6-13}
// previous imports

const Dashboard = ({ history }) => {
  // previous code

  const destroyTask = async slug => {
    try {
      await tasksApi.destroy({ slug, quiet: true });
      await fetchTasks();
    } catch (error) {
      logger.error(error);
    }
  };
};

export default Dashboard;
```

Finally update the tasks API connected file like this:

```javascript {4-7}
// previous code

const destroy = ({ slug, quiet }) => {
  const path = quiet ? `/tasks/${slug}?quiet` : `/tasks/${slug}`;
  return axios.delete(path);
};
```

## Moving response messages to i18n en.locales

Let's move the response messages to `en.yml`:

```yaml {4}
en:
  successfully_created: "%{entity} was successfully created!"
  successfully_updated: "%{entity} was successfully updated!"
  successfully_deleted: "%{entity} was successfully deleted!"
  task:
    slug:
      immutable: "is immutable!"
```

Let's update the `destroy` action of `TasksController` like this:

```ruby {4}
def destroy
  authorize @task
  @task.destroy!
  render_notice(t("successfully_deleted", entity: "Task")) unless params.key?(:quiet)
end
```

Now let's commit these changes:

```bash
git add -A
git commit -m "Added progress to tasks"
```
