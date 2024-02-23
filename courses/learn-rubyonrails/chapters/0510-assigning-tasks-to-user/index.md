## Features

In this chapter, we are going to see how to assign tasks to a user. The
following is the list of things we need in this feature:

- Every task should have a single user as its assignee. A user can have zero or
  more assigned tasks.

- We need a new dropdown in the task form showing the list of users. We should
  be able to select the task's assignee from this dropdown.

  <image alt="User dropdown">user-dropdown.png</image>

- The task details page should show the name of its assignee.

  <image alt="Assignee in task details">show-user-in-task-details.png</image>

- Each task on the dashboard should contain the task assignee's name along with
  the task's title.

## Technical design

Let us break down the requirement into smaller sub-tasks and explain our way of
approach in a bit more technical way:

- Our controller for the `User` model will have an `index` action that returns a
  list of users. This is required to show the dropdown in the tasks form.

- We use this API to retrieve the list of users from `Create` and `Edit`
  components and pass it to `Form` through `props`.

- We can add a new dropdown component using the library `react-select` in `Form`
  component. This will be filled with the list of users it will receive through
  its `props`.

- On submitting, the selected user's `id` will be passed to the create/update
  API of tasks. That value will be stored against the `assigned_user_id` column.

- We will update the `show` action in tasks controller to include details of
  task assignee. We can use that information to display the name of assignee in
  the `Show` component.

- We will update the `index` action of the `TasksController` to include the
  details of `assigned_user` for each task in the JSON response. Then we will
  update the `Row` component to display the task assignee's name.

## Creating index action for user

Let's create an new file `app/controllers/users_controller.rb` and add the
following lines of code to it:

```ruby
class UsersController < ApplicationController
  def index
    users = User.select(:id, :name)
    render status: :ok, json: { users: }
  end
end
```

The `select` method accepts a subset of fields and only returns the selected
fields from the result set. In this case, the `select` method will fetch an
`ActiveRecord::Relation` object containing the names and ids of all the users
and store it in the `users` variable.

The SQL query for the above mentioned `select` method will be like this:

```rb
SELECT id, name FROM users
```

We can also use the `select` method as the `Array#select` method in Ruby by
adding a block that returns a boolean response.

For example:

```ruby
voting_candidates = User.all.select {|user| user.age >= 18 }
```

In the above code, `User.all` returns an array of user objects and then the
`Array#select` method iterates over them to check the given condition. If an
object returns `true` for the given condition then that object will be selected
into the `voting_candidates` array.

Although we can also get the required results by using the `Array#select` method
in the above mentioned `index` action, we shouldn't use it. That's because we
are not selecting some specific records or objects, but we are selecting
specific columns from all the objects. In this case, using `Array#map` method is
a better approach.

For example:

```ruby
# wrong way
def index
  users = []
  User.all.select do |user|
    users << { id: user.id, name: user.name }
  end
end

# better than "select" method
def index
  users = User.all.map { |user| {id: user.id, name: user.name} }
end
```

However, this `map` method approach does not make much sense in the `index`
action as it makes the code relatively more complicated than the first approach
and adds extra steps to get the same result which can be avoided.

So to conclude we should use `ActiveRecord#select` method when we want to select
specific columns or properties from an array of objects or records and
`Array#select` method when we want to select specific objects from an array of
objects. As in the `index` action, we are selecting some specific columns from
an array of records so the correct approach would be like this:

```rb
class UsersController < ApplicationController
  def index
    users = User.select(:id, :name)
    render status: :ok, json: { users: users }
  end
end
```

To learn more about how the `select` method works, you can refer to the
[official documentation](https://api.rubyonrails.org/v7.0.5/classes/ActiveRecord/QueryMethods.html#method-i-select)
from Rails.

Now we need to update `routes.rb`:

```ruby {3}
Rails.application.routes.draw do
  resources :tasks, except: %i[new edit], param: :slug
  resources :users, only: :index

  root 'home#index'
  get '*path', to: 'home#index', via: :all
end
```

## Creating users API connector

Let's create a new file to define all the APIs related to user model:

```bash
touch app/javascript/src/apis/users.js
```

Now let's add the following code to it:

```javascript
import axios from "axios";

const fetch = () => axios.get("/users");

const usersApi = {
  fetch,
};

export default usersApi;
```

## Updating Form component

We are going to use [react-select](https://react-select.com/) library rather
than writing the `select` component from the scratch:

```bash
yarn add react-select
```

Next, replace the whole content of the `Form` component with the following
lines:

```javascript
import React, { useRef } from "react";

import { equals } from "ramda";
import { useHistory } from "react-router-dom";
import Select from "react-select";

import { Button, Input } from "components/commons";

const Form = ({
  title,
  setTitle,
  assignedUser,
  users,
  setUserId,
  loading,
  handleSubmit,
}) => {
  const history = useHistory();
  const userOptions = users.map(user => ({
    value: user.id,
    label: user.name,
  }));
  const defaultOption = { value: assignedUser?.id, label: assignedUser?.name };

  const initialValues = useRef({
    title,
    userId: assignedUser.id,
  });

  const isNotDirty = equals(initialValues.current, {
    title,
    userId: assignedUser.id,
  });

  return (
    <form className="mb-4 w-full" onSubmit={handleSubmit}>
      <div className="mx-auto mb-4 w-full overflow-hidden rounded-lg border border-gray-200 bg-white text-gray-800 sm:max-w-screen-sm md:max-w-screen-md lg:max-w-screen-2xl">
        <div className="flex flex-col gap-4 p-6">
          <Input
            label="Title"
            placeholder="Todo Title (Max 50 Characters Allowed)"
            value={title}
            onChange={e => setTitle(e.target.value.slice(0, 50))}
          />
          <div className="flex flex-col">
            <p className="text-sm font-medium leading-none text-gray-800">
              Assigned To
            </p>
            <div className="mt-1 w-full">
              <Select
                isSearchable
                defaultValue={defaultOption}
                menuPosition="fixed"
                options={userOptions}
                onChange={e => setUserId(e.value)}
              />
            </div>
          </div>
        </div>
      </div>
      <div className="flex items-center gap-x-3">
        <Button
          buttonText="Save changes"
          disabled={isNotDirty}
          loading={loading}
          type="submit"
        />
        <Button
          buttonText="Cancel"
          style="secondary"
          onClick={() => history.push("/dashboard")}
        />
      </div>
    </form>
  );
};

export default Form;
```

Here, we are receiving `users` and `assignedUser` from props of `Form.jsx` which
will be used to populate the `Select` component with usernames and also as a
default value.

Note that, when we select an item from the usernames, the corresponding `id` of
the user is what gets passed into `setUserId`.

If you notice the first two lines in the `Form` component, there we are
formatting out the `users` and `assignedUser`, to the format required by
`react-select`.

Note that, in the above code, we have used a variable named `isNotDirty` to disable the "Save changes" button. This ensures that the "Save changes" button is only enabled if the user has made any changes to the form values.

To ensure a better user experience, we should disable the primary button when the form is not dirty to prevent accidental submissions and unwanted requests.

Now, let's see how we have checked whether a form is dirty.

To check whether a form is dirty, we need to store the initial or default values of the form data and compare them with the current state of the form data. Since the initial form values should not change, even if the form re-renders, we made use of [`useRef`](https://courses.bigbinaryacademy.com/learn-react/side-effects/use-ref-hook/) hook to store this value. The `useRef` hook allows us to persist values between re-renders.

The `useRef` hook accepts the initial value that we want to store. Here, we have passed an object that contains `title` and `assignedUser.id` as values to the `useRef` hook:

```js
const initialValues = useRef({
  title,
  userId: assignedUser.id,
});
```

It returns a reference to a mutable object, which doesn't trigger a re-render. We can access the stored value using the `current` property of this object, i.e. `initialValues.current` will return the object containing `title` and `userId`. This value will not change even if the `title` and the `assignedUser` changes due to re-rendering.

Now that we have the `initialValues` set, we can compare it with an object containing the `title` and `assignedUser.id` values derived from `prop` values during rendering like so:

```js
const isNotDirty = equals(initialValues.current, {
  title,
  userId: assignedUser.id,
});
```

We have used the `equals` function from `ramda` to compare the two objects by their values.

## Updating Create component

Now while creating a task we will assign a user to that task.

Let's update `app/javascript/src/components/Tasks/Create.jsx` and invoke the
`Form` component. We will be invoking the users `index` API from here and the
result will be passed to `Form`:

```javascript
import React, { useState, useEffect } from "react";

import tasksApi from "apis/tasks";
import usersApi from "apis/users";
import { Container, PageLoader, PageTitle } from "components/commons";

import Form from "./Form";

const Create = ({ history }) => {
  const [title, setTitle] = useState("");
  const [userId, setUserId] = useState("");
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(false);
  const [pageLoading, setPageLoading] = useState(true);

  const handleSubmit = async event => {
    event.preventDefault();
    setLoading(true);
    try {
      await tasksApi.create({ title, assigned_user_id: userId });
      setLoading(false);
      history.push("/dashboard");
    } catch (error) {
      logger.error(error);
      setLoading(false);
    }
  };

  const fetchUserDetails = async () => {
    try {
      const {
        data: { users },
      } = await usersApi.fetch();
      setUsers(users);
      setUserId(users[0].id);
    } catch (error) {
      logger.error(error);
    } finally {
      setPageLoading(false);
    }
  };

  useEffect(() => {
    fetchUserDetails();
  }, []);

  if (pageLoading) {
    return <PageLoader />;
  }

  return (
    <Container>
      <div className="flex flex-col gap-y-8">
        <PageTitle title="Add new task" />
        <Form
          assignedUser={users[0]}
          handleSubmit={handleSubmit}
          loading={loading}
          setTitle={setTitle}
          setUserId={setUserId}
          title={title}
          users={users}
        />
      </div>
    </Container>
  );
};

export default Create;
```

After submitting the form we'll get `task` as params with attribute
`assigned_user_id`.

## Updating TasksController

If we look into the SQL statements generated on the server, we see that
`assigned_user_id` is not being used in the sql statements. That's because we
are not marking `assigned_user_id` as a safe parameter. We need to change
`task_params` to whitelist `assigned_user_id` attribute.

We also need to update the `show` action of `TasksController` to respond with
the task assignee along with other task details.

If you recall we had added a `belongs_to` association in the `Task` model called
`assigned_user`. When we declare an association inside a model, Rails creates a
method inside the model by the name of the association which returns the
associated object when invoked.

In this case, the method name will be `assigned_user` and it will return the
task assignee when invoked. We can use the `assigned_user` method to obtain the
task assignee inside the show action of TasksController.

If you are keen to know how this works under the hood, you can refer to the
[Rails macros and metaprogramming chapter](/learn-rubyonrails/rails-macros-and-metaprogramming#macro-in-rails)
in this book which deals with this topic in depth.

To introduce the required changes, update the `TasksController` with the
following lines of code:

```ruby {15-17,33}
class TasksController < ApplicationController
  before_action :load_task!, only: %i[show update destroy]

  def index
    tasks = Task.all
    render status: :ok, json: { tasks: }
  end

  def create
    task = Task.new(task_params)
    task.save!
    render_notice(t("successfully_created"))
  end

  def show
    render_json({ task: @task, assigned_user: @task.assigned_user })
  end

  def update
    task = Task.find_by!(slug: params[:slug])
    task.update!(task_params)
    render_notice(t("successfully_updated"))
  end

  def destroy
    @task.destroy!
    render_json
  end

  private

    def task_params
      params.require(:task).permit(:title, :assigned_user_id)
    end

    def load_task!
      @task = Task.find_by!(slug: params[:slug])
    end
end
```

After making the changes we just discussed, `assigned_user_id` will get stored
while creating a new task and we will get `assigned_user` along with other task
details in the frontend upon fetching a task.

Start Rails sever and visit http://localhost:3000/dashboard. Clicking on the create task
button will redirect you to the page to create new task. Select a user from the
dropdown menu, add a title, and create the task. That's it.

## Updating Edit component

Open `app/javascript/src/components/Tasks/Edit.jsx` and replace the entire
content in it with the following lines of code:

```javascript
import React, { useState, useEffect } from "react";

import { useParams } from "react-router-dom";

import tasksApi from "apis/tasks";
import usersApi from "apis/users";
import { Container, PageLoader, PageTitle } from "components/commons";

import Form from "./Form";

const Edit = ({ history }) => {
  const [title, setTitle] = useState("");
  const [userId, setUserId] = useState("");
  const [assignedUser, setAssignedUser] = useState("");
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(false);
  const [pageLoading, setPageLoading] = useState(true);
  const { slug } = useParams();

  const handleSubmit = async event => {
    event.preventDefault();
    try {
      await tasksApi.update({
        slug,
        payload: { title, assigned_user_id: userId },
      });
      setLoading(false);
      history.push("/dashboard");
    } catch (error) {
      setLoading(false);
      logger.error(error);
    }
  };

  const fetchUserDetails = async () => {
    try {
      const {
        data: { users },
      } = await usersApi.fetch();
      setUsers(users);
    } catch (error) {
      logger.error(error);
    }
  };

  const fetchTaskDetails = async () => {
    try {
      const {
        data: {
          task: { title, assigned_user },
        },
      } = await tasksApi.show(slug);
      setTitle(title);
      setAssignedUser(assigned_user);
      setUserId(assigned_user.id);
    } catch (error) {
      logger.error(error);
    }
  };

  const loadData = async () => {
    await Promise.all([fetchTaskDetails(), fetchUserDetails()]);
    setPageLoading(false);
  };

  useEffect(() => {
    loadData();
  }, []);

  if (pageLoading) {
    return (
      <div className="h-screen w-screen">
        <PageLoader />
      </div>
    );
  }

  return (
    <Container>
      <div className="flex flex-col gap-y-8">
        <PageTitle title="Edit task" />
        <Form
          assignedUser={assignedUser}
          handleSubmit={handleSubmit}
          loading={loading}
          setTitle={setTitle}
          setUserId={setUserId}
          title={title}
          users={users}
        />
      </div>
    </Container>
  );
};

export default Edit;
```

In the `Edit` component we want to wait till both the `user` and `task` details
are fetched. Thus we have used `Promise.all` to wait for both the promises to
resolve in a parallel fashion. And after successfully fetching the details, we
set the `pageLoading` state to `false`.

When we click on the edit button on the task listing page we are redirected to
the edit task page.

## Showing user names in Show component

Now we will display the user that is assigned to the task on task show page.

Fully replace `Show.jsx` with the following lines of code:

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
            <div className="flex items-center gap-x-6">
              <p className="text-base text-gray-700">
                <span className="font-semibold">Assigned to: </span>
                {task?.assigned_user?.name}
              </p>
            </div>
          </div>
          <Button
            buttonText="Edit"
            icon="edit-line"
            size="small"
            style="secondary"
            onClick={updateTask}
          />
        </div>
      </div>
    </Container>
  );
};

export default Show;
```

Now, while clicking on the show button of a task in the `Table` component which
is rendered in `Dashboard`, we will be routed to the `Show` component from
`Tasks` folder. There we can see the task details, which would include the
title, as well as the assigned user's name.

In this chapter, we haven't added any tests for the User model because we don't
have much to test for.

Currently, the User model is at its barebones level. As we move further, we will
be adding some test cases for the User model.

## Showing task assignee in Dashboard

To display the task assignee detail in the Dashboard we need to update the
`index` action in `TasksController` to respond with the assigned_user along with
other task details.

Update the `index` action of the `TasksController` as follows:

```ruby {4-7}
class TasksController
  # previous code

  def index
    tasks = Task.all.as_json(include: { assigned_user: { only: %i[name id] } })
    render_json({ tasks: })
  end

  # previous code
end
```

Don't get overwhelmed by the `as_json` method in the above code. We will take a
brief look at it in the next section of this chapter.

So far we have only been showing the task title in each of the tasks listed on
the dashboard. To display task assignee's name along with the task title in
dashboard update the `Row` component like this:

```jsx {16-18}
import React from "react";

import PropTypes from "prop-types";

import { Tooltip } from "components/commons";

const Row = ({ data, showTask, destroyTask }) => (
  <tbody className="divide-y divide-gray-200 bg-white">
    {data.map(rowData => (
      <tr key={rowData.id}>
        <td className="space-x-5 border-r border-gray-300 px-4 py-2.5 text-sm font-medium capitalize">
          <Tooltip tooltipContent={rowData.title}>
            <span>{rowData.title}</span>
          </Tooltip>
        </td>
        <td className="whitespace-no-wrap border-r border-gray-300 px-4 py-2.5 text-sm text-gray-800">
          {rowData.assigned_user.name}
        </td>
        <td className="cursor-pointer px-6 py-4 text-right text-sm font-medium leading-5">
          <a className="text-indigo-600" onClick={() => showTask(rowData.slug)}>
            Show
          </a>
        </td>
        <td
          className="cursor-pointer px-6 py-4 text-right
            text-sm font-medium leading-5"
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

Row.propTypes = {
  data: PropTypes.array.isRequired,
  destroyTask: PropTypes.func,
  showTask: PropTypes.func,
};

export default Row;
```

## Using the as_json method

The `as_json` method is a part of the `ActiveModel::Serializers::JSON` module.
It returns a hash of attributes present in the object. The hash will only
consist of keys in string format rather than symbol format. Thus we'd have to
query using the string itself. Example:

```ruby
user_name = tasks[0]["assigned_user"]["name"]
```

We can invoke the `as_json` method on an object without passing any arguments.
If we do not pass any arguments, then returned hash will include all the
object's attributes.

We are calling the `as_json` method on a collection of task objects which will
return a hash of all attributes for each of the task objects.

We have also passed an `include` option to the `as_json` method. Passing
`include` inside the `as_json` method includes a nested hash of the object's
associations as a key in the hash. The key is named after the name of
association. In our case, we are including the `assigned_user` association for
each of the task objects.

At last, we have passed the `only` method that limits the attributes included in
the returned hash to the attributes which are passed in the `only` method.

Note that `only` has been nested inside the user association hash, hence it will
only limit the assigned_user's attributes and return the `name` and `id` of
associated assigned_user for each task.

Now let's commit these changes:

```bash
git add -A
git commit -m "Added ability to assign task to a user"
```
