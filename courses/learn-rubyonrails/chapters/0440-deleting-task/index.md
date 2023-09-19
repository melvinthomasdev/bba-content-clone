In the last chapter, we saw how to update a task. In this chapter we'll see how
to delete a task.

## Features

These are the basic requirements of the feature:

- A delete button should be present for all tasks.

- Upon clicking the delete button, a `DELETE` HTTP request should be sent to the
  backend.

- Once a response is received for the `DELETE` request a notification should be
  displayed with a success message or error message depending upon the response
  status.

- No notification should be displayed if a task is successfully deleted because
  from a UI perspective the result of this action will be visible and showing a
  notification on top of it will be an overkill in this case.

## Technical design

To implement this feature, we need to introduce the following changes:

**On the backend**

- Add a `destroy` route for tasks RESTful resources in the routes file.

- Add a `destroy` action in the `TasksController`. When application receives a
  DELETE request to delete a task, it will be processed by the delete action.

- Update the `before_action` callback in the `TasksController` to call the
  `load_task!` method before `destroy` action is called.

**On the frontend**

- Add a `DELETE` request API connector for deleting a task.

- Update the `Dashboard` component and add a `deleteTask` function which will
  handle the logic to delete the task.

- Pass `deleteTask` function as a prop to the `Row` component through `Table`
  component.

- Update the `Row` component and add a delete button which will call the
  `deleteTask` function received through props.

- Add a route in `App` component for rendering the `Edit` component from `Tasks`
  folder.

## Implementing destroy action in TasksController

Let's implement the `destroy` action in our `TasksController`.

Add the following lines of code into `TasksController`:

```ruby {2,6-9}
class TasksController < ApplicationController
  before_action :load_task!, only: %i[show update destroy]

  # previous code if any

  def destroy
    @task.destroy!
    render_json
  end

  private

    # previous code if any
```

Here, `load_task!` methods runs before the `destroy` action and will have
fetched the `task` whose `slug` matches our request parameter's `slug` value.

We do not need to send a json along with the response when a task is deleted
successfully that is why we are responding with the `render_json` method which
will send a response with an
[ok](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/200) status and an
empty json if nothing is passed as an argument.

Now, update the tasks resources in `config/routes.rb` file:

```ruby
resources :tasks, except: %i[new edit], param: :slug
```

## Handling task deletion

When user clicks on the "Delete" button then we need to handle that click. Then
send a request to the server to delete the task. Let's handle it.

First, let's add an API for deleting a task. To do so, add the following lines
to `app/javascript/src/apis/tasks.js`:

```javascript {17,24}
import axios from "axios";

const fetch = () => axios.get("/tasks");

const show = slug => axios.get(`/tasks/${slug}`);

const create = payload =>
  axios.post("/tasks/", {
    task: payload,
  });

const update = ({ slug, payload }) =>
  axios.put(`/tasks/${slug}`, {
    task: payload,
  });

const destroy = slug => axios.delete(`/tasks/${slug}`);

const tasksApi = {
  fetch,
  show,
  create,
  update,
  destroy,
};

export default tasksApi;
```

Open `app/javascript/src/components/Dashboard/index.jsx` and fully replace the
content of the file with the code shown below.

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
      } = await tasksApi.fetch();
      setTasks(tasks);
      setLoading(false);
    } catch (error) {
      logger.error(error);
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
      <Table data={tasks} destroyTask={destroyTask} showTask={showTask} />
    </Container>
  );
};

export default Dashboard;
```

Now, we need to pass down `destroyTask` function as props to `Row` component. To
do so, update `app/javascript/src/components/Tasks/Table/index.jsx` with the
following lines of code:

```jsx {5,16}
import React from "react";
import Header from "./Header";
import Row from "./Row";

const Table = ({ data, showTask, destroyTask }) => {
  return (
    <div className="flex flex-col">
      <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div className="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
          <div className="overflow-hidden border-b border-bb-gray-200 shadow sm:rounded-lg">
            <table className="min-w-full divide-y divide-gray-200">
              <Header />
              <Row data={data} showTask={showTask} destroyTask={destroyTask} />
            </table>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Table;
```

Now, we need to make use of the `destroyTask` function so that a click on the
`Delete` button in the tasks table would delete the corresponding task.

To do so, go to `app/javascript/src/components/Tasks/Table/Row.jsx` and add the
following lines:

```jsx {6,33-44,53}
import React from "react";
import PropTypes from "prop-types";

import Tooltip from "components/Tooltip";

const Row = ({ data, destroyTask, showTask }) => {
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
          <td
            className="px-6 py-4 text-sm font-medium
            leading-5 text-right cursor-pointer"
          >
            <a
              className="text-red-500
              hover:text-red-700"
              onClick={() => destroyTask(rowData.slug)}
            >
              Delete
            </a>
          </td>
        </tr>
      ))}
    </tbody>
  );
};

Row.propTypes = {
  data: PropTypes.array.isRequired,
  destroyTask: PropTypes.func,
  showTask: PropTypes.func,
};

export default Row;
```

## Destroying all in batches

If we invoke `destroy_all` method on a list of thousands of records then it can
cause db and memory issues.

The `destroy_all` method loads the entire relation and then iteratively destroys
the records one by one which can blow the memory very easily. Moreover, if we
are destroying 5000 records using the `destroy_all` method then it places the db
in a transaction lock. So this will prevents any other db calls from being
executed and will cause APIs to timeout during the time db is locked.

So while using `destroy_all` method we should prefer using batches, like so:

```rb
Model.in_batches.destroy_all
```

This would ensure that the records are destroyed in a batched fashion so that
the memory and API calls don't take any hit.

## Deleting a task

So let's go through the Destroy flow of our task.

When we click the `delete` button, the `onClick` function uses the
`destroyTask()` for making the API call and handles the task deletion provided
the correct route and `slug` of the task.

The control then goes to the router and router directs the control to `destroy`
action of the `TasksController`.

Once it's done, we again fetch the list of tasks from the DB, because the
database should be the source of truth for the data we show in UI in all cases.

```bash
git add -A
git commit -m "Added ability to delete a task"
```
