Now that we have everything in the right place we are all set to introduce a new
feature to update a task.

## Features

These are the requirements of this feature:

- An edit button should be present for each task. User should be redirected to
  edit task page on clicking the edit button.

- Edit task page should contain a form with pre filled values of the task.

- Upon clicking the submit button in the edit form, a PATCH request should be
  sent with the updated task values.

- A notification should be displayed stating whether the update operation was
  successfully reflected in our database or not.

- User should be redirected to the Dashboard once a task is successfully
  updated.

<image alt="Updating a task feature">updating-a-task.png</image>

## Technical design

To implement this feature, we need to introduce the following changes:

**On the backend**

- Add an `update` route for tasks RESTful resources in the routes file.

- Add an `update` action in the `TasksController`. When application receives a
  PATCH request to update a task, it will be processed by the update action.

- Add a `before_action` callback to invoke `load_task!` method which will load
  the requested task before both `show` and `update` actions are called.

**On the frontend**

- Add a PATCH request API connector for updating a task.

- Create an `Edit` component which will receive the task `slug` through URL
  params. It will also contain the reusable `Form` component which will provide
  an edit form.

- Update the `Show` component and add an `updateTask` function which will handle
  the logic to redirect the application to edit page.

- `Edit` component will call the API to fetch a task and pass fetched data to
  the `Form` to pre-populate the fields.

- Add a route in `App` component for rendering the `Edit` component.

## Implementing update task

We will start by adding the `update` action in `TasksController`. Let's open
`/app/controllers/tasks_controller.rb` and change the code as shown below:

```ruby {5-9}
class TasksController < ApplicationController

  # previous code if any

  def update
    task = Task.find_by!(slug: params[:slug])
    task.update!(task_params)
    render_notice("Task was successfully updated!")
  end

  private

    # previous code if any
```

We have used the `update!` method to save the updated values.

If the update is successful, we will return status
[ok](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/200) with a
notice. And on failure, the exception raised will be handled inside the
`ApplicationController`.

In our `update` action we are using the same line of code which we had written
in our `show` action. The following is that line of code:

```ruby
task = Task.find_by!(slug: params[:slug])
```

Finding tasks separately in every action will lead to repetition of code.

We should follow the DRY principle which we had learnt in the
[Core Principles](/learn-rubyonrails/rails-core-principles#dry) chapter.

Instead of finding task separately in every action, we can create a `load_task!`
method which we can run before certain actions using the `before_action` filter.

By default `before_action` filter will call the specified method before any or
specified actions are executed.

If we don't want to run the method before all the actions, then we can pass in a
hash as an argument, like this:

```ruby
before_action :load_task!, only: %i[show update]
```

So it'll be applied only before those specified actions.

We can also pass in the hash with the `except` key with an array of actions to
exclude. It means that before all other actions, except the excluded ones, our
`before_action` filter method will get run.

```ruby
before_action :load_task!, except: :create
```

Here the advantage is that we don't need to mention all actions manually. The
`load_task!` method will run before all actions inside the `TasksController`
except the `create` action.

Let's modify our `TasksController` and use the `before_action` filter.

Add the following changes to `TasksController`:

```ruby {2,6-8,10-13,17-19}
class TasksController < ApplicationController
  before_action :load_task!, only: %i[show update]

  # previous code

  def show
    render_json({ task: @task })
  end

  def update
    @task.update!(task_params)
    render_notice("Task was successfully updated!")
  end

  private

    def load_task!
      @task = Task.find_by!(slug: params[:slug])
    end

    def task_params
      params.require(:task).permit(:title)
    end
end
```

Here, the `load_task!` method will fetch the task using `find_by!` method and
store it in `@task` variable, before running the `show` and `update` actions.

`find_by!` will raise an exception if no task is found with a matching slug.

Note that, we have used a bang operator with the `load_task!` method name
because the method will return an exception n case a task is not found. It is a
Ruby convention for method names to end with a bang operator if they raise an
exception.

Now, update the tasks resources in `config/routes.rb` file, like this:

```ruby
resources :tasks, except: %i[new edit destroy], param: :slug
```

Note that, we will be using the `except` keyword over `only`, since we only need
to exclude three actions and include the rest.

Let's now create a new component for updating task details. To do so, like
before, we will abstract the `API` logic and `form` logic to different
components.

First, let's add an `API` route to edit tasks inside
`app/javascript/src/apis/tasks.js`.

To do so, add the following lines to `tasks.js`:

```javascript {12-15,21}
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

const tasksApi = {
  fetch,
  show,
  create,
  update,
};

export default tasksApi;
```

Now, let's create our React components to update task details. To do so, first
run the following command:

```bash
touch app/javascript/src/components/Tasks/Edit.jsx
```

Inside `Edit.jsx`, add the following content:

```jsx
import React, { useState, useEffect } from "react";

import { useParams } from "react-router-dom";

import tasksApi from "apis/tasks";
import { Container, PageLoader, PageTitle } from "components/commons";

import Form from "./Form";

const Edit = ({ history }) => {
  const [title, setTitle] = useState("");
  const [loading, setLoading] = useState(false);
  const [pageLoading, setPageLoading] = useState(true);
  const { slug } = useParams();

  const handleSubmit = async event => {
    event.preventDefault();
    try {
      await tasksApi.update({
        slug,
        payload: { title },
      });
      setLoading(false);
      history.push("/dashboard");
    } catch (error) {
      setLoading(false);
      logger.error(error);
    }
  };

  const fetchTaskDetails = async () => {
    try {
      const {
        data: {
          task: { title, user_id },
        },
      } = await tasksApi.show(slug);
      setTitle(title);
      setUserId(user_id);
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
    return (
      <div className="w-screen h-screen">
        <PageLoader />
      </div>
    );
  }

  return (
    <Container>
      <div className="flex flex-col gap-y-8">
        <PageTitle title="Edit task" />
        <Form
          handleSubmit={handleSubmit}
          loading={loading}
          setTitle={setTitle}
          title={title}
          type="update"
        />
      </div>
    </Container>
  );
};

export default Edit;
```

Add the new export in `Tasks/index.js` file, like this:

```jsx
// previous code as it was...
import EditTask from "./Edit";

export { CreateTask, ShowTask, EditTask };
```

`Form` is the reusable UI that we had created while working on the chapter to
create a task.

Here, `fetchTaskDetails` function is used to pre-populate the `input` field with
the existing title of the task.

Now, we need to create a route inside of our `App.jsx`.

To do so, open `App.jsx` and add the following lines:

```jsx {3,12}
// previous imports if any
import Dashboard from "components/Dashboard";
import { CreateTask, ShowTask, EditTask } from "components/Tasks";
import { ToastContainer } from "react-toastify";

const App = () => {
  return (
    <Router>
      <ToastContainer />
      <Switch>
        // previous code if any
        <Route exact path="/tasks/:slug/edit" component={EditTask} />
        <Route exact path="/tasks/:slug/show" component={ShowTask} />
        <Route exact path="/tasks/create" component={CreateTask} />
        <Route exact path="/dashboard" component={Dashboard} />
      </Switch>
    </Router>
  );
};

export default App;
```

Now, add the `updateTask` function to the `Show` component.

To do so, fully replace `app/javascript/src/components/Tasks/Show.jsx` with the
following lines of code:

```jsx
import React, { useEffect, useState } from "react";

import { useHistory, useParams } from "react-router-dom";

import tasksApi from "apis/tasks";
import { Button, Container, PageLoader } from "components/commons";

const Show = () => {
  const [task, setTask] = useState([]);
  const [pageLoading, setPageLoading] = useState(true);
  const { slug } = useParams();
  const history = useHistory();

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
          </div>
          <div className="flex items-center justify-end gap-x-3">
            <Button
              buttonText="Edit"
              icon="edit-line"
              size="small"
              style="secondary"
              onClick={updateTask}
            />
          </div>
        </div>
      </div>
    </Container>
  );
};

export default Show;
```

Now, on the show task page, clicking on edit icon would render the `Edit`
component from `Tasks` folder, where task details can be edited.

## Moving response messages to i18n en.locales

Let's move the response messages to en.yml:

```yaml {3}
en:
  successfully_created: "Task was successfully created!"
  successfully_updated: "Task was successfully updated!"
  task:
    slug:
      immutable: "is immutable!"
```

Let's update the `update` action of `TasksController` with the translation, like
so:

```ruby {4}
def update
  task = Task.find_by!(slug: params[:slug])
  task.update!(task_params)
  render_notice(t("successfully_updated"))
end
```

```bash
git add -A
git commit -m "Added ability to update a task"
```
