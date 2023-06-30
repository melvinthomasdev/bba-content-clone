In this chapter, we will learn about `counter_cache` in Rails and how it can
improve our application's performance by optimizing queries.

Counter caches can be useful in situations where you need to display a count of
associated records, and you want to avoid executing a separate count query every
time you need to access the count. In the granite application, such a situation
may arise if we want to display the comment counts of all the tasks on the
dashboard page. We will first implement this using the straightforward approach
without caching the counter values and see how it can be unhealthy for our
application. Then we will look into the `counter_cache` approach and discover
how it improves the application's performance.

## Displaying the comment counts

At this point displaying the comment counts might seem fairly intuitive. We will
start by modifying the view file for the `index` action of the
`TasksController`. So replace the content of
`app/views/tasks/index.json.jbuilder` file with the following:

```rb {9}
# frozen_string_literal: true

json.tasks do
  json.pending @pending_tasks do |pending_task|
    json.partial! "tasks/task", task: pending_task
    json.extract! pending_task,
      :progress,
      :status
    json.comments_count pending_task.comments.size
  end

  json.completed @completed_tasks
end
```

Now the count of comments in each task would be accessible through the newly
added key `comments_count`.

Let us modify the UI to incorporate the change. We will add a new column in the
dashboard table with the header `Comments` which will be used to display the
count. Replace the contents of
`app/javascript/src/components/Tasks/Table/Header.jsx` file with the following:

```jsx {30-34}
import React from "react";

import { compose, head, join, juxt, tail, toUpper } from "ramda";

const Header = ({ type }) => {
  const getTitleCase = compose(join(""), juxt([compose(toUpper, head), tail]));

  const title = `${getTitleCase(type)} Tasks`;

  return (
    <thead>
      <tr>
        <th className="w-1" />
        <th className="bg-gray-50 px-6 py-3 text-left text-xs font-bold uppercase leading-4 tracking-wider text-bb-gray-600 text-opacity-50">
          {title}
        </th>
        {type === "pending" && (
          <th className="bg-gray-50 px-6 py-3 text-left text-sm font-bold leading-4 tracking-wider text-bb-gray-600 text-opacity-50">
            Assigned To
          </th>
        )}
        {type === "completed" && (
          <>
            <th style={{ width: "164px" }} />
            <th className="bg-gray-50 py-3 pl-6 text-center text-sm font-bold leading-4 tracking-wider text-bb-gray-600 text-opacity-50">
              Delete
            </th>
          </>
        )}
        {type === "pending" && (
          <th className="bg-gray-50 py-3 text-center text-sm font-bold leading-4 tracking-wider text-bb-gray-600 text-opacity-50">
            Comments
          </th>
        )}
        {type === "pending" && (
          <th className="bg-gray-50 py-3 pl-6 text-center text-sm font-bold leading-4 tracking-wider text-bb-gray-600 text-opacity-50">
            Starred
          </th>
        )}
      </tr>
    </thead>
  );
};

export default Header;
```

Also, replace the contents of
`app/javascript/src/components/Tasks/Table/Row.jsx` file with the following:

```jsx {55-57}
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
    <tbody className="divide-y divide-gray-200 bg-white">
      {data.map(rowData => (
        <tr key={rowData.id}>
          <td className="text-center">
            <input
              checked={isCompleted}
              className="form-checkbox ml-6 h-4 w-4 cursor-pointer rounded border-gray-300 text-bb-purple focus:ring-bb-purple"
              type="checkbox"
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
              "block w-64 px-6 py-4 text-sm font-medium capitalize leading-8 text-bb-purple ",
              {
                "cursor-pointer": !isCompleted,
                "text-opacity-50": isCompleted,
              }
            )}
            onClick={() => !isCompleted && showTask(rowData.slug)}
          >
            <Tooltip content={rowData.title} delay={200} direction="top">
              <div className="max-w-64 truncate ">{rowData.title}</div>
            </Tooltip>
          </td>
          {!isCompleted && (
            <>
              <td className="whitespace-no-wrap px-6 py-4 text-sm font-medium leading-5 text-bb-gray-600">
                {rowData.assigned_user.name}
              </td>
              <td className="whitespace-no-wrap px-6 py-4 text-center text-sm font-medium leading-5 text-bb-gray-600">
                {rowData.comments_count}
              </td>
              <td className="cursor-pointer py-4 pl-6 text-center">
                <i
                  className={classnames(
                    "p-1 text-2xl transition duration-300 ease-in-out hover:text-bb-yellow",
                    {
                      "ri-star-line text-bb-border":
                        rowData.status !== "starred",
                    },
                    {
                      "ri-star-fill text-white text-bb-yellow":
                        rowData.status === "starred",
                    }
                  )}
                  onClick={() => starTask(rowData.slug, rowData.status)}
                />
              </td>
            </>
          )}
          {isCompleted && (
            <>
              <td style={{ width: "164px" }} />
              <td className="cursor-pointer py-4 pl-6 text-center">
                <i
                  className="ri-delete-bin-5-line text-center text-2xl text-bb-border transition duration-300 ease-in-out hover:text-bb-red"
                  onClick={() => destroyTask(rowData.slug)}
                />
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

We have successfully added a new column to the dashboard which displays the
count of comments under each task. Now, everything might seem to work fine until
we inspect the server log.

<image>counter-cache-n+1-queries.png</image>

As you can see, a separate count query is executed for each task to get the
number of comments. This can be inefficient, especially if you are displaying a
large number of records and need to get the count of associated records for each
one. In other terms, it makes our application less scalable. As the number of
`tasks` increases, the performance of the application falls off resulting in a
slow user experience.

Rails provides an elegant solution to prevent this from happening in the form of
`counter_cache`.

## Using counter cache

A counter cache is a way to store the number of associated records in a column
on the parent record. This can be useful for optimizing queries and reducing the
number of database hits when you need to access the count of associated records.

To set up a counter cache in a Rails application, we will start by adding an
integer column to the parent table. The name of the column should be of the form
`#{child_table_name}_count`.

In our case, `Task` is the parent model and `Comment` is the child model since a
task can have many comments. So we should add a new column to the `tasks` table
with the name `comments_count`. Let us generate the migration script for the
same:

```bash
bundle exec rails generate migration AddCommentsCountToTasks comments_count:integer
```

Run `bundle exec rails db:migrate` to run the migration.

Next, we add a `counter_cache` option to the `belongs_to` association in the
child model. Let us modify the `Comment` model in `app/models/comment.rb` as
follows:

```rb
class Comment < ApplicationRecord
  # previous code if any

  belongs_to :task, counter_cache: true

  # previous code if any
end
```

That concludes the setup. Now, if you inspect the server log, you will see that
the `comments` table is not queried at all.

<image>counter-cache-added-server-log.png</image>

Here's how it works:

- When you create a new comment, Rails will increment the `comments_count`
  column on the associated task by 1.

- When you destroy a comment, Rails will decrement the `comments_count` column
  on the associated task by 1.

- If you update the `task_id` of a comment, which is essentially removing the
  comment from that particular task's perspective, Rails will increment the
  `comments_count` column on the new task and decrement the `comments_count`
  column on the old task.

Since `comments_count` always keeps track of the number of comments, a separate
query to `comments` table is avoided when we need to access the count.

## Resetting the counter cache

If you have already created some records and then set up a counter cache for an
association, the counter cache column may show a wrong number for the count
because it has not been initialized with the correct values.

To fix this issue, you will need to reset the counter cache column to the
correct values. You can use the `reset_counters` method provided by Rails to do
this.

For this, open up your Rails console and type the following:

```rb
Tasks.id.each { |id| Task.reset_counters(id, :comments)}
```

You could also create a migration to achieve the same. Keep in mind that
resetting the counter cache will trigger a separate count query for each record,
so it may not be efficient to reset the counter cache for a large number of
records. You should consider whether the performance benefits of resetting the
counter cache are worth the added complexity in your particular use case.

You can learn more about `counter_cache` in the
[official docs](https://api.rubyonrails.org/classes/ActiveRecord/CounterCache/ClassMethods.html).

Now let's commit the current changes:

```bash
git add -A
git commit -m "Added a column in dashboard to display comment counts"
```

In some cases, one might not be able to use the default counter cache, provided
by Rails, directly. These situations may arise when you want to introduce a
conditional counter cache or if you want to customize the name of your counter
cache column. In these scenarios, the `counter_culture` gem will prove to be
beneficial. You can read more about this gem in the
[counter culture in-depth chapter.](/learn-rubyonrails/counter-culture)