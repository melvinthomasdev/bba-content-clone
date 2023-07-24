In the last chapter, we saw how to create a new task and save it to the
database. Let's add a new feature to display the newly created task.

## Features

These are the requirements of this feature:

- A show button should be present for each task. User should be redirected to
  task details page on clicking the show button.

- Task details page should only contain the task title for now. Below is a
  picture showing how UI would look like once implemented.

  Do not get overwhelmed by the edit and delete buttons as well as the comment
  section. We will cover those features later in this book.

<image>showing-task.png</image>

## Technical design

To implement this feature, we need to introduce the following changes:

**On the backend**

- Add a `show` route for tasks RESTful resources in the routes file.

- We will add a `show` action in the `TasksController`. When the application
  receives the request to show a task, that request will be processed by the
  show action.

**On the frontend**

- Add a GET API connector for fetching a task inside the tasks API collection.

- Add a `Show` component which will receive the task `slug` using URL params.
  `Show` component will call the API to fetch a task and display the task
  details.

- In the `Dashboard` component, add a new `showTask` function which will
  redirect the application to a new page based on the task slug using
  `react-router-dom`.

- Pass down `showTask` function as a prop to the `Row` component through the
  `Table` component.

- Add a new Route in the `App` component for the task page. This route should
  render the `Show` component.

## Implementing show action in TasksController

Open `/app/controllers/tasks_controller.rb` and add the following lines of code:

```ruby {2-7}
class TasksController < ApplicationController
  def show
    task = Task.find_by!(slug: params[:slug])
    render_json({ task: task })
  end
end
```

In the `show` action we are trying to find and respond with a task by filtering
using the `slug` attribute.

Note that in the above action we have used the `find_by!` method which will
raise an exception if no matching record is found in the database. We do not
need to worry about handling the exception anymore as we have already handled
that inside the `ApplicationController`.

After the task is loaded successfully, the `render_json` method responds with an
`:ok` status and the `task` json.

We have chosen the `render_json` method over the `render_notice` method here
because `render_notice` method also sends back a success message along with a
json which gets displayed as a notification in the client-side. We do not want
to send a success message in this case.

## Building Show Component

Let's first create our task's show component:

```bash
touch app/javascript/src/components/Tasks/Show.jsx
```

In `Show.jsx`, paste the following content:

```jsx
import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";

import Container from "components/Container";
import PageLoader from "components/PageLoader";
import tasksApi from "apis/tasks";

const Show = () => {
  const [taskDetails, setTaskDetails] = useState([]);
  const [pageLoading, setPageLoading] = useState(true);
  const { slug } = useParams();

  const fetchTaskDetails = async () => {
    try {
      const {
        data: { task },
      } = await tasksApi.show(slug);
      setTaskDetails(task);
    } catch (error) {
      logger.error(error);
    } finally {
      setPageLoading(false);
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
      <h1 className="pb-3 pl-3 mt-3 mb-3 text-lg leading-5 text-bb-gray border-b border-bb-gray">
        <span>Task Title : </span> {taskDetails?.title}
      </h1>
    </Container>
  );
};

export default Show;
```

`useParams` hook is provided by the `react-router-dom` package and it returns an
object of URL parameters as key/value pairs. For example, for
`/tasks/:task-slug`, `useParams` will return the following object:

```javascript
{
  ("task_slug");
}
```

Let's now create an API route to handle our show request in
`app/javascript/src/apis/tasks.js`.

**Note: Until now we have been using highlighted lines of code to show what
needs to be added to the codebase/component.**

However, from here onwards, since we will be making a lot of changes and
additions to each of the components, if we haven't highlighted any lines in code
block, then the best way to stay in sync is to copy the whole code snippet and
replace the corresponding component/file in your local project with that
content, unless specified otherwise.

`App.jsx` will only require updates in most chapters, rather than full
replacement.

This will help you from not missing out on any of the changes that needs to be
reflected in your local project.

Now update `tasks.js` with the following content:

```javascript {5,14}
import axios from "axios";

const list = () => axios.get("/tasks");

const show = slug => axios.get(`/tasks/${slug}`);

const create = payload =>
  axios.post("/tasks/", {
    task: payload,
  });

const tasksApi = {
  list,
  show,
  create,
};

export default tasksApi;
```

Now we will create a `showTask` handler function in the `Dashboard` and pass it
down to the `Table` component. Fully replace
`app/javascript/src/components/Dashboard/index.jsx` with the following content:

```jsx
import React, { useState, useEffect } from "react";
import { isNil, isEmpty, either } from "ramda";

import Container from "components/Container";
import Table from "components/Tasks/Table";
import tasksApi from "apis/tasks";
import PageLoader from "components/PageLoader";

const Dashboard = ({ history }) => {
  const [tasks, setTasks] = useState([]);
  const [loading, setLoading] = useState(true);

  const fetchTasks = async () => {
    try {
      const {
        data: { tasks },
      } = await tasksApi.list();
      setTasks(tasks);
      setLoading(false);
    } catch (error) {
      logger.error(error);
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
      <div className="w-screen h-screen">
        <PageLoader />
      </div>
    );
  }

  if (either(isNil, isEmpty)(tasks)) {
    return (
      <Container>
        <h1 className="text-xl leading-5 text-center">
          You have no tasks assigned 😔
        </h1>
      </Container>
    );
  }

  return (
    <Container>
      <Table data={tasks} showTask={showTask} />
    </Container>
  );
};

export default Dashboard;
```

We need to pass down `showTask` function as props to `Row` component and attach
it to an `onClick` event which will be fired upon clicking the show button.

To do so, update `app/javascript/src/components/Tasks/Table/index.jsx` with the
following lines of code:

```jsx {5,13}
import React from "react";
import Header from "./Header";
import Row from "./Row";

const Table = ({ data, showTask }) => {
  return (
    <div className="flex flex-col">
      <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div className="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
          <div className="overflow-hidden border-b border-bb-gray-200 shadow sm:rounded-lg">
            <table className="min-w-full divide-y divide-gray-200">
              <Header />
              <Row data={data} showTask={showTask} />
            </table>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Table;
```

Then, update the content of `Row.jsx` with following lines:

```jsx {4,6, 15-17,22-29,38}
import React from "react";
import PropTypes from "prop-types";

import Tooltip from "components/Tooltip";

const Row = ({ data, showTask }) => {
  return (
    <tbody className="bg-white divide-y divide-gray-200">
      {data.map(rowData => (
        <tr key={rowData.id}>
          <td
            className="block w-64 px-6 py-4 text-sm font-medium
            leading-8 text-bb-purple capitalize truncate"
          >
            <Tooltip content={rowData.title} delay={200} direction="top">
              <div className="truncate max-w-64 ">{rowData.title}</div>
            </Tooltip>
          </td>
          <td className="px-6 py-4 text-sm font-medium leading-5 text-right cursor-pointer">
            <a
              className="text-bb-purple"
              onClick={() => showTask(rowData.slug)}
            >
              Show
            </a>
          </td>
        </tr>
      ))}
    </tbody>
  );
};

Row.propTypes = {
  data: PropTypes.array.isRequired,
  showTask: PropTypes.func,
};

export default Row;
```

Now we have completed adding the show action handler for a task and hooked it to
the `onClick` event. The last step is to define a route inside of `App.jsx` to
render our tasks show page.

But while importing the `Show` component in `App.jsx` we will be using the same
namespace as in `Create` component which is `components/Tasks`.

Here we can add an `index.js` file to `components/Tasks` to reduce the number of
import statements in `App.jsx` and also to make things look cleaner.

These conventions are documented in
[this chapter](https://academy.bigbinary.com/learn-react/pages/structuring-code)
in our React Best Practices Book.

Create a new file `index.js` in `app/javascript/src/components/Tasks` and add
the following lines:

```js
import CreateTask from "./Create";
import ShowTask from "./Show";

export { CreateTask, ShowTask };
```

Here, we have imported the `Create` and `Show` as `CreateTask` and `ShowTask`
because outside the `tasks` namespace or inside `App.jsx` names like `Create`
and `Show` can be very confusing and may also give errors as there can be
multiple Create and Show from different folders(namespaces). Thus it's better to
export them as `CreateTask` and `ShowTask`.

Now add the highlighted lines to `App.jsx`:

```jsx {3,12}
// previous imports if any
import Dashboard from "components/Dashboard";
import { CreateTask, ShowTask } from "components/Tasks";
import { ToastContainer } from "react-toastify";

const App = () => {
  // previous code if any
  return (
    <Router>
      <ToastContainer />
      <Switch>
        <Route exact path="/tasks/:slug/show" component={ShowTask} />
        <Route exact path="/tasks/create" component={CreateTask} />
        <Route exact path="/dashboard" component={Dashboard} />
      </Switch>
    </Router>
  );
};

export default App;
```

Now, let's go to the [dashboard URL](http://localhost:3000/dashboard) and click
on the `Show` button, we might see that an error has occurred:

```bash
Routing Error
No route matches [GET] "/tasks/slug"
```

We are getting an error because the Rails router can't find any route matching
the format `/tasks/:slug` for a `GET` request or more accurately since we
haven't defined `show` action in task `resources`.

Let's solve this by adding that action into `/config/routes.rb`.

Note: It is possible that you're able to access the show page for an individual
task even before updating the `routes.rb` file without encountering any routing
error.

But the issue that you might notice is that the title of the task will remain
empty as we are not able to fetch details from the backend due to absence of the
corresponding API route for returning the title details.

Adding the route in the following step will allow us to view the show page with
title of the task:

```ruby
resources :tasks, only: %i[index create show], param: :slug
```

Now if we visit [dashboard URL](http://localhost:3000/dashboard) and then click
on `Show` button corresponding to a task, we will be able to see the details of
that task.

## Using Rails console to search tasks

Let's fire up the console once again using the `rails console` command:

```bash
rails console
Running via Spring preloader in process 25412
Loading development environment (Rails 7.0.5)

irb(main):001:0> Task.find_by(slug: "my-first-task")
  Task Load (0.2ms)  SELECT  "tasks".* FROM "tasks" WHERE "tasks"."slug" = ? LIMIT ?  [["slug", "my-first-task"], ["LIMIT", 1]]
=> #<Task id: 1, title: "My first task", created_at: "2019-02-04 13:34:04", updated_at: "2019-02-04 13:34:04", slug: "my-first-task">

irb(main):002:0> Task.find_by(slug: "my-4th-task")
  Task Load (0.4ms)  SELECT  "tasks".* FROM "tasks" WHERE "tasks"."slug" = ? LIMIT ?  [["slug", "my-4th-task"], ["LIMIT", 1]]
=> #<Task id: 5, title: "My 4th task", created_at: "2019-02-04 15:14:26", updated_at: "2019-02-04 15:14:26", slug: "my-4th-task">

irb(main):003:0> Task.find_by(slug: "my-7th-task")
  Task Load (0.4ms)  SELECT  "tasks".* FROM "tasks" WHERE "tasks"."slug" = ? LIMIT ?  [["slug", "my-7th-task"], ["LIMIT", 1]]
=> #nil
```

As shown above, we use the `find_by` method and pass it with any `slug`.

If an entry in the database exists with corresponding slug, then the record is
fetched otherwise exception is returned.

You can use the `find_by!` method which will raise an
`ActiveRecord::RecordNotFound` exception if no tasks with a matching slug is
found in the database.

```bash
irb(main):004:0> Task.find_by!(slug: "my-7th-task")
  Task Load (0.2ms)  SELECT  "tasks".* FROM "tasks" WHERE "tasks"."slug" = ? LIMIT ?  [["slug", "my-7th-task"], ["LIMIT", 1]]
=> # `find_by!': Couldn't find Task (ActiveRecord::RecordNotFound)
```

We can also use other attributes to look for a specific task using the `where`
method.

Let's try with the `title` attribute:

```bash
irb(main):005:0> Task.where(title: "My first task")
  Task Load (0.8ms)  SELECT  "tasks".* FROM "tasks" WHERE "tasks"."title" = ? LIMIT ?  [["title", "My first task"], ["LIMIT", 11]]
=> #<ActiveRecord::Relation [#<Task id: 1, title: "My first task", created_at: "2019-02-04 13:34:04", updated_at: "2019-02-04 13:34:04", slug: "my-first-task">]>

irb(main):006:0> Task.where(title: "My 4th task")
  Task Load (0.4ms)  SELECT  "tasks".* FROM "tasks" WHERE "tasks"."title" = ? LIMIT ?  [["title", "My 4th task"], ["LIMIT", 11]]
=> #<ActiveRecord::Relation [#<Task id: 4, title: "My 4th task", created_at: "2019-02-04 15:11:42", updated_at: "2019-02-04 15:11:42", slug: "my-4th-task">, #<Task id: 5, title: "My 4th task", created_at: "2019-02-04 15:14:26", updated_at: "2019-02-04 15:14:26", slug: "my-4th-task-2">]>
```

Now let's commit these changes:

```bash
git add -A
git commit -m "Added show page for a task"
```
