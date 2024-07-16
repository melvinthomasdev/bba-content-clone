## Features

Until now, users once logged in, had no way of logging out of our application.
Let us implement the logout feature:

- We can add a logout button in our navbar.

- Clicking the logout button should terminate the session and redirect the user
  to the login page.

- From now onwards, we should keep track of who created which task. Later, we
  can use this to limit access to a task to its owner and its assignee only.

- Task detail page should also contain the name of task owner.

## Technical design

We will do the following to implement the given requirements:

- We will create a `destroy` action in `SessionsController`. We use this action
  to clean up the session on the backend when the user logs out. We can map this
  action to the `DELETE` request to the `/session` URL.

- After calling the API, we will clear our browser's localStorage and reset the
  headers from axios configuration.

- Now, to add information about the task owner, we will need a new column
  `task_owner_id` in `tasks` table.

- We will add a foreign_key constraint on `task_owner_id` to create a
  relationship between a task and its corresponding user who is the owner of the
  task.

- We will declare a `has_many` association with a custom name of `created_tasks`
  in the `User` model and a `belongs_to` association for `task_owner` in the
  `Task` model.

- Inside the `TasksController`, we will get the currently logged-in user details
  via the `current_user` method in the `ApplicationController`. We can use the
  current user's `created_tasks` association to create a new task.

- To send the task owner's name in JSON response, we will have to update the
  show action's corresponding Jbuilder view builder.

- To display the task creator's name in task details page, we will need to
  update the `Show` component of `Tasks` to render task owner's name received
  from backend along with other task details.

### Sessions controller

Open `app/controllers/sessions_controller.rb` and add the following lines:

```ruby {2,11-14}
class SessionsController < ApplicationController
  skip_before_action :authenticate_user_using_x_auth_token, only: :create

  def create
    @user = User.find_by!(email: login_params[:email].downcase)
    unless @user.authenticate(login_params[:password])
      render_error(t("session.incorrect_credentials"), :unauthorized)
    end
  end

  def destroy
    @current_user = nil
    # any other session cleanup tasks can be done here...
  end

  private

    def login_params
      params.require(:login).permit(:email, :password)
    end
end
```

In the above code, along with adding a `destroy` action, we have also updated
the `skip_before_action` filter to be effective only when the request is for
`create` action.

### Session routes

Let's modify `routes.rb` and add a destroy action for `session`:

```ruby {5}
Rails.application.routes.draw do
   constraints(lambda { |req| req.format == :json }) do
    resources :tasks, except: %i[new edit], param: :slug
    resources :users, only: %i[create index]
    resource :session, only: [:create, :destroy]
  end

  root "home#index"
  get '*path', to: 'home#index', via: :all
end
```

## Frontend changes

Open `apis/auth.js` and add following lines:

```javascript {8,17}
import axios from "axios";

const login = payload =>
  axios.post("/session", {
    login: payload,
  });

const logout = () => axios.delete(`/session`);

const signup = payload =>
  axios.post("/users", {
    user: payload,
  });

const authApi = {
  login,
  logout,
  signup,
};

export default authApi;
```

Let's open `apis/axios.js` and create a function to clear the default Axios
headers when the user is logged out. Add the `resetAuthTokens` method at the end
of the file and also update the export statement like this:

```javascript{55-58,60}
import axios from "axios";
import { Toastr } from "components/commons";
import { setToLocalStorage, getFromLocalStorage } from "utils/storage";

const DEFAULT_ERROR_NOTIFICATION = "Something went wrong!";

axios.defaults.baseURL = "/";

const setAuthHeaders = () => {
  axios.defaults.headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
    "X-CSRF-TOKEN": document
      .querySelector('[name="csrf-token"]')
      .getAttribute("content"),
  };
  const token = getFromLocalStorage("authToken");
  const email = getFromLocalStorage("authEmail");
  if (token && email) {
    axios.defaults.headers["X-Auth-Email"] = email;
    axios.defaults.headers["X-Auth-Token"] = token;
  }
  setLoading(false);
};

const handleSuccessResponse = response => {
  if (response) {
    response.success = response.status === 200;
    if (response.data.notice) {
      Toastr.success(response.data.notice);
    }
  }
  return response;
};

const handleErrorResponse = axiosErrorObject => {
  if (axiosErrorObject.response?.status === 401) {
    setToLocalStorage({ authToken: null, email: null, userId: null });
    setTimeout(() => (window.location.href = "/"), 2000);
  }
  Toastr.error(
    axiosErrorObject.response?.data?.error || DEFAULT_ERROR_NOTIFICATION
  );
  if (axiosErrorObject.response?.status === 423) {
    window.location.href = "/";
  }
  return Promise.reject(axiosErrorObject);
};

const registerIntercepts = () => {
  axios.interceptors.response.use(handleSuccessResponse, error =>
    handleErrorResponse(error)
  );
};

const resetAuthTokens = () => {
  delete axios.defaults.headers["X-Auth-Email"];
  delete axios.defaults.headers["X-Auth-Token"];
};

export { setAuthHeaders, registerIntercepts, resetAuthTokens };
```

Now, let's open the `NavBar/index.jsx` component and make use of the logout API
that we added before to make the logout logic complete. Replace the whole
content of `NavBar/index.jsx` with this code:

```jsx
import React, { useState, useEffect, useRef } from "react";

import classnames from "classnames";
import { Link, useLocation } from "react-router-dom";
import { resetAuthTokens } from "src/apis/axios";

import authApi from "apis/auth";
import { getFromLocalStorage, setToLocalStorage } from "utils/storage";

import GraniteLogo from "./GraniteLogo";

const NavBar = () => {
  const [isMenuVisible, setIsMenuVisible] = useState(false);
  const menuRef = useRef();
  const userName = getFromLocalStorage("authUserName");
  const location = useLocation();

  useEffect(() => {
    const handleClickOutside = event => {
      if (menuRef.current && !menuRef.current.contains(event.target)) {
        setIsMenuVisible(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [menuRef]);

  const toggleMenu = () => {
    setIsMenuVisible(!isMenuVisible);
  };

  const handleLogout = async () => {
    try {
      await authApi.logout();
      setToLocalStorage({
        authToken: null,
        email: null,
        userId: null,
        userName: null,
      });
      resetAuthTokens();
      window.location.href = "/";
    } catch (error) {
      logger.error(error);
    }
  };

  return (
    <header className="bg-primary-white sticky top-0 z-20 w-full border-b border-gray-200 transition-all duration-500">
      <div className="mx-auto max-w-6xl px-6">
        <div className="flex h-16 items-center justify-between">
          <div className="w-max flex-shrink-0">
            <Link className="h-full w-auto" to="/">
              <GraniteLogo className="h-8 w-auto" />
            </Link>
          </div>
          <div className="flex items-center gap-x-4">
            <Link
              to="/"
              className={classnames("text-sm font-medium text-gray-800", {
                "text-indigo-600": location.pathname === "/",
              })}
            >
              Todos
            </Link>
            <Link
              className="rounded-md bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-700 focus:shadow"
              to="/tasks/create"
            >
              Add new task
            </Link>
            <div className="relative" ref={menuRef}>
              <Link
                className="flex items-center gap-x-1 rounded-md bg-gray-200 px-4 py-2 text-sm font-medium text-gray-800 hover:bg-gray-300 focus:shadow"
                onClick={toggleMenu}
              >
                <span className="block">{userName}</span>
                <i className="ri-arrow-down-s-line" />
              </Link>
              {isMenuVisible && (
                <div className="absolute right-0 z-20 mt-2 w-48 rounded-md border border-gray-300 bg-white py-1 shadow-xl">
                  <Link
                    className="block cursor-pointer px-3 py-1.5 text-sm text-gray-800 hover:bg-gray-100"
                    onClick={handleLogout}
                  >
                    Log out
                  </Link>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </header>
  );
};

export default NavBar;
```

We are making use of the `setToLocalStorage` helper method created in the
previous section to clear the localStorage. The user will be then redirected to
the login page if the logout was successfully done in the server too, where we
destroy the `@current_user` instance variable.

Now let's commit these changes:

```bash
git add -A
git commit -m "Added ability to logout"
```

## Storing information about who created the task

As discussed earlier, let's add a new column `task_owner_id` to tasks table
using a new migration. We will also add a foreign key constraint on
`task_owner_id` column which will contain the referenced primary key from a
record in the `users` table.

Run the following command to generate the migration:

```bash
bundle exec rails g migration AddTaskOwnerIdToTask
```

```ruby
class AddTaskOwnerIdToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :task_owner_id, :integer
    add_foreign_key :tasks, :users, column: :task_owner_id, on_delete: :cascade
  end
end
```

The `on_delete: :cascade` option makes sure that the referencing rows, which
here are the rows of the task table, also get deleted when deleting the rows of
the referenced table, which is the user table in this case.

In our case, when deleting users, all the tasks created by them will also get
deleted.

Note that rows of users table won't be affected when tasks are deleted. The
foreign key relation is unidirectional.

Again, once we create a new migration, let's persist that into our database:

```bash
bundle exec rails db:migrate
```

## Adding association for task owner

Every task in the database is associated with the user who created it and a user
can create multiple such tasks. Hence we should declare appropriate associations
in the `User` and `Task` models.

Add the following line of code inside `app/models/user.rb` to add a `has_many`
association called `created_tasks` for the `User` model:

```ruby {2}
class User < ApplicationRecord
  has_many :created_tasks, foreign_key: :task_owner_id, class_name: "Task"

  # previous code

  private

    # previous code
end
```

Similarly we should update the `Task` model and add a `belongs_to` association
called `task_owner` like this:

```ruby {2}
class Task < ApplicationRecord
  belongs_to :task_owner, foreign_key: "task_owner_id", class_name: "User"

  # previous code

  private

    # previous code
end
```

Now we have created associations for both task owner and the assigned user. We
know that all tasks will be deleted when the user who created those tasks is
deleted.

But what happens when the assigned user is deleted? Ideally the task should be
assigned back to the task owner but in our case the assigned user will be set to
`nil` when that happens.

To fix this, let us add a method inside the `User` model to assign back the
tasks to the task owner in the event of assigned user getting deleted. Update
`app/models/user.rb` with the following lines of code:

```ruby {3,9-14}
class User < ApplicationRecord
  # previous code
  before_destroy :assign_tasks_to_task_owners

  private

    # previous code

    def assign_tasks_to_task_owners
      tasks_whose_owner_is_not_current_user = assigned_tasks.where.not(task_owner_id: id)
      tasks_whose_owner_is_not_current_user.find_each do |task|
        task.update(assigned_user_id: task.task_owner_id)
      end
    end
end
```

When `assign_tasks_to_task_owners` is invoked on a user object, all the
`assigned_tasks` for that user are fetched and out of those tasks we are
selecting only those tasks which are created by another user and saving the
result in `tasks_to_be_reassigned` variable.

Tasks owned by the user should be deleted and it doesn't make sense for us to
perform the reassigning operation on a task which is about to be deleted from
the database. Besides if the `task_owner` and the `assigned_user` are same then
reassigning isn't required.

By default `before_destroy` callback method which is
`assign_tasks_to_task_owner` will be invoked every time, right before a user
record gets deleted.

## Creating a task using Task owner

In our application all tasks are associated to users. We cannot create a task
unless there is no user. Each task is created by a user who is related to the
task using the `task_owner` association and the task is also assigned to a user.
Task assignee is related to a task using the `assigned_user` association.

So far we had only been saving tasks with an `assigned_user`. We also need to
add a task owner for tasks. To do so, we can pass the `task_owner_id` in the
`task_params` while creating a new task. While this works, we'd have to
explicitly pass the `task_owner_id` as parameter.

We know that the task_owner will always be the currently logged in user. In our
application, `current_user` refers to the currently logged in user. We can use
the `current_user.created_tasks` association to create a task. This way we do
not have to specify the `task_owner_id` in `task_params`. When we use
`current_user.created_tasks`, Rails knows that the new task's `task_owner_id` is
equal to current user's id.

Rails knows this because we have specified the `task_owner_id` foreign key for
`created_tasks` association in the `User` model. This saves time, and makes code
more fluent as well as adhering to the business logic.

It's generally frowned upon to use `Model.new` for creating new records.
Whenever possible use the already available association or instance variables
itself.

Update the `create` method of `TasksController` like this:

```ruby {4-8}
class TasksController < ApplicationController
  # previous code

  def create
    task = current_user.created_tasks.new(task_params)
    task.save!
    render_notice(t("successfully_created", entity: "Task"))
  end

  # previous code
end
```

Before moving on, we should delete the existing task records in our database as
they do not have a `task_owner` and this can lead to errors later on. Use the
following command to delete all the existing task records and their associations
from the database.

```ruby
Task.destroy_all
```

## Showing task owner

`task_owner` can be accessed in the show action's corresponding `Jbuilder`
template file where we can include it as a key in the response JSON along with
other task attributes.

Let's update the `show.json.jbuilder` view template for tasks and add the
`task_owner` key to the response JSON. To do so, add the following lines to
`/app/views/tasks/show.json.jbuilder`:

```ruby {12-15}
json.task do
  json.extract! @task,
    :id,
    :slug,
    :title

  json.assigned_user do
    json.id @task.assigned_user.id
    json.name @task.assigned_user.name
  end

  json.task_owner do
    json.extract! @task.task_owner,
      :name
  end
end
```

Now, update the `Show` component to display the task owner name along with other
task details. Add the following lines of code to the `Show` component:

```javascript {17-20}
// previous imports

const Show = () => {
  // previous code

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

Now let's commit these changes:

```bash
git add -A
git commit -m "Added task owner to tasks"
```
