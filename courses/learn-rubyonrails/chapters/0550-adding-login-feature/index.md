## Features

In this chapter, we are going to implement a simple token-based authentication
mechanism in our application. By the end of the chapter, our application will
have the following changes:

- We will have a login form requesting email and password in `/login` route. The
  page will look like this:

  <image alt="User login">login-page.png</image>

- Users once logged in will remain logged in until they log out manually. i.e.
  the session will never expire.

- Only the logged-in users will be able to see the list of tasks.
  Unauthenticated users will be redirected to the login page when trying to
  access the tasks list.

- We will display the list of users in `/` route instead of at `/dashboard` for
  easiness of accessing.

- We will display the logged-in user's name in our navigation bar as circled in
  this image:

  <image alt="User name in navbar">username-in-navbar.png</image>

## Technical design

This is how the overall design looks like:

- We will be generating a unique random token for users at the time of sign-up.
  We will use this token to verify the authenticity of requests.

- This token will be stored in a column named `authentication_token` in the
  `users` table.

- We will use the `has_secure_token` method provided by Rails for generating
  unique random alphanumeric tokens. This method is explained in detail in
  [this blog](https://blog.bigbinary.com/2016/03/23/has-secure-token-to-generate-unique-random-token-in-rails-5.html).

- We will create a new controller for managing sessions. Let's call it
  `SessionsController`. Its `create` action will be called by login API.

- We will add a `Jbuilder` template for `create` action in the
  `SessionsController`. Using `Jbuilder`, we will create and send a JSON
  response comprising of user's `name`, `email` and `authentication_token` if
  the request is valid.

- We will create a new `Login` page, which will be rendered at the route
  `/login`. As we did earlier with the sign-up page, we manage user inputs from
  a separate component named `Login` inside `Form` folder.

- Upon form submission, the `Login` component will send the credentials to
  `SessionsController` through `create` API. The response data received from
  server will be saved to the browser's localStorage in case of successful
  authentication.

- Since we have already configured our `axios` object to include authentication
  token, email, etc from localStorage to the headers of every request, we can
  now identify the users in the backend.

- We will make use of the [Redirect](https://reactrouter.com/web/api/Redirect)
  component from the `react-router-dom` package to redirect unauthenticated
  users to `/login` route when they try to access the tasks list through forced
  browsing.

- Disabling this from the frontend solely isn't enough. We need to update our
  backend too to ensure that we don't retrieve the tasks list for
  unauthenticated requests.

- We will add a method called `authenticate_user_using_x_auth_token` in the
  backend which will extract email and token from request headers, find a user
  possessing the given email from the database, and then check whether the token
  matches that of the request.

- If the authentication token is verified then the request will be processed
  further otherwise the request will be terminated there and an `:unauthorized`
  response will be sent from the `authenticate_user_using_x_auth_token`.

- If email or token is not present then also
  `authenticate_user_using_x_auth_token` method will terminate the request with
  an `:unauthorized` response.

- Since we will need the same authenticity verification logic on several
  controllers, we will define the `authenticate_user_using_x_auth_token` method
  inside our `ApplicationController` and use a `before_action` callback to
  invoke it before the controller action.

  This way we can ensure that the requests are authenticated before they are
  processed irrespective of the controller.

- To display logged in user's name on `NavBar`, we can use the `name` we stored
  in the localStorage during login.

This sums up what we are going to do in this chapter. Let us start coding.

## Creating token for new users

As discussed earlier, whenever we create a new user, we will auto-generate a
unique authentication token for that user and use it to identify the user later
on.

This is an alternative approach to default session management provided by Rails.

In most scenarios this approach is spiced up by using a JWT token to improve
scalability, support multiple device logins etc. But, for simplicity, we won't
be using a JWT token, in this project.

Let's create a migration to add column `authentication_token` to `users` table:

```bash
bundle exec rails generate migration add_authentication_token_to_users
```

Update the migration file with this code:

```ruby
class AddAuthenticationTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :authentication_token, :string
  end
end
```

Execute the migration script:

```bash
bundle exec rails db:migrate
```

Let's update our `User` model to use `has_secure_token` method to generate a
random alphanumeric token for the users.

To do that, add the following line to `app/models/user.rb`:

```ruby {9}
# frozen_string_literal: true

class User < ApplicationRecord
  MAX_NAME_LENGTH = 255
  MIN_PASSWORD_LENGTH = 6
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  MAX_EMAIL_LENGTH = 255

  has_many :assigned_tasks, foreign_key: :assigned_user_id, class_name: "Task"
  has_secure_password
  has_secure_token :authentication_token

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: MAX_EMAIL_LENGTH },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: MIN_PASSWORD_LENGTH }, if: -> { password.present? }
  validates :password_confirmation, presence: true, on: :create

  before_save :to_lowercase

  private

    def to_lowercase
      email.downcase!
    end
end
```

To verify this change, we need to create a new user and save it to the database.

We can do it from the Rails console in sandbox mode so that all these changes
will be rolled back on exit. This will let us keep our database clean from junk
data. Refer our
[previous chapter on rails console](/learn-rubyonrails/rails-console#working-in-a-sandbox)
for more details.

Open the Rails console in the sandbox mode:

```bash
bundle exec rails console --sandbox
```

Now, execute this command:

```ruby
user = User.new(
  name:"alex", email:"alex@example.com",
  password:"welcome", password_confirmation:"welcome",
)
```

We will get an output similar to this:

```bash
   (0.6ms)  SELECT sqlite_version(*)
=> #<User id: nil, name: "alex", created_at: nil, updated_at: nil, email: "alex@example.com", password_digest: [FILTERED], authentication_token: nil>
```

Now let's save the user to the database:

```ruby
user.save
```

`authentication_token` is auto-generated when user is created and saved to
database. Since the `authentication_token` is `unique`, the generated value will
always be a new one:

```bash
irb(main):006:0> user.authentication_token
=> "s4XUM7YboHazNzpnqftquJ6T"
```

## Session controller

Now, let us create the session controller to authenticate users and send the
`authentication_token` along with user's `id` and `name` as response if the
credentials provided by the user are correct:

```bash
bundle exec rails g controller sessions
```

Add the following lines of code to `sessions_controller.rb`:

```ruby
class SessionsController < ApplicationController
  def create
    @user = User.find_by!(email: login_params[:email].downcase)
    unless @user.authenticate(login_params[:password])
      render_error("Incorrect credentials, try again.", :unauthorized)
    end
  end

  private

    def login_params
      params.require(:login).permit(:email, :password)
    end
end
```

Note that we have only called the `render_error` method inside the guard clause.
Don't let this confuse you. This doesn't mean that an HTTP response will only be
sent if the code enters the `unless` block of the `create` action.

If the control doesn't go inside the guard clause, then Rails will render the
view template associated with the `create` action.

A guard clause is a conditional check that immediately exits the function or
method, either with a return statement or an exception.

In our code, `unless` statement is the guard clause since it will exit the
`create` method returning a JSON response and status if the condition inside
`unless` statement holds `false`.

There is no difference between the following create method and the create action
method we have in our application's `SessionsController`.

```ruby
def create
  @user = User.find_by!(email: login_params[:email].downcase)
  unless @user.authenticate(login_params[:password])
    render_error("Incorrect credentials, try again.", :unauthorized)
  else
    render
  end
end
```

The lesson here is that, we should avoid calling `render` whenever possible to
avoid redundancy since Rails takes care of it for us.

Note that, Rails, by convention, expects a view file for the `create` action in
the `views` directory. If that can't be found, then Rails will point out that
the relevant template file is missing.

Now, add a `Jbuilder` view template for rendering the JSON response for session
controller's `create` action.

To do so, run the following command:

```bash
touch ./app/views/sessions/create.json.jbuilder
```

In `app/views/sessions/create.json.jbuilder`, add the following lines of code:

```ruby
json.extract! @user,
  :id,
  :name,
  :authentication_token
```

Let's add session routes by modifying `config/routes.rb` so that it can be
called through API:

```ruby {5}
Rails.application.routes.draw do
  constraints(lambda { |req| req.format == :json }) do
    resources :tasks, except: %i[new edit], param: :slug
    resources :users, only: %i[create index]
    resource :session, only: :create
  end

  root "home#index"
  get '*path', to: 'home#index', via: :all
end
```

## Login page

As discussed earlier, let us move the dashboard component to `/` route.

We will be using our `PrivateRoute` component to disallow unauthenticated users
accessing that page by redirecting them to `/login` route.

Now while importing Login component in `App.jsx`, we will be using same
namespace as we had done while importing the `Signup` component. So this is a
good time to use `index.js` so that we don’t have to add multiple imports but
rather keep it down to a single import.

These conventions are documented in
[this chapter](https://courses.bigbinaryacademy.com/learn-react/react-best-practices/structuring-code/)
in our React Best Practices Book.

Create a new file `index.js` in `app/javascript/src/components/Authentication`
and add the following lines.

```js
import Login from "./Login";
import Signup from "./Signup";

export { Login, Signup };
```

then open `app/javascript/src/App.jsx` file and add the following lines:

```jsx {3,7,10,13-14,24-30}
import React from "react";
import { Route, Switch, BrowserRouter as Router } from "react-router-dom";
import { either, isEmpty, isNil } from "ramda";
import { ToastContainer } from "react-toastify";
import Dashboard from "components/Dashboard";
import { CreateTask, ShowTask, EditTask } from "components/Tasks";
import { Login, Signup } from "components/Authentication";
import PrivateRoute from "components/Common/PrivateRoute";
import { getFromLocalStorage } from "utils/storage";

const App = () => {
  const authToken = getFromLocalStorage("authToken");
  const isLoggedIn = !either(isNil, isEmpty)(authToken);

  return (
    <Router>
      <ToastContainer />
      <Switch>
        <Route exact path="/tasks/:slug/show" component={ShowTask} />
        <Route exact path="/tasks/:slug/edit" component={EditTask} />
        <Route exact path="/tasks/create" component={CreateTask} />
        <Route exact path="/signup" component={Signup} />
        <Route exact path="/login" component={Login} />
        <PrivateRoute
          path="/"
          redirectRoute="/login"
          condition={isLoggedIn}
          component={Dashboard}
        />
      </Switch>
    </Router>
  );
};

export default App;
```

Now that our dashboard component is rendered at `/` path instead of
`/dashboard`, replace `history.push("/dashboard")` with `history.push("/")` in
`Create` component, so as to redirect users to the correct URL from the
`handleSubmit` function, like this:

```jsx {9}
/* previous code */
const Create = ({ history }) => {
  /* previous code */
  const handleSubmit = async event => {
    event.preventDefault();
    setLoading(true);
    try {
      /* previous code */
      history.push("/");
    } catch (error) {
      logger.error(error);
      setLoading(false);
    }
  };
  /* previous code */
};

export default Create;
```

Now make the same change in the `Edit` component as well, like this:

```jsx {8} {
/* previous code */
const Edit = ({ history }) => {
  /* previous code */
  const handleSubmit = async event => {
    event.preventDefault();
    try {
      /* previous code */
      history.push("/");
    } catch (error) {
      setLoading(false);
      logger.error(error);
    }
  };
  /* previous code */
};
```

Now, let's define `app/javascript/src/components/Common/PrivateRoute.jsx`. It
should redirect unauthenticated users to the login screen, if they try to access
any private route.

Create the file and add the following lines of code to it:

```javascript {
import React from "react";
import { Redirect, Route } from "react-router-dom";
import PropTypes from "prop-types";

const PrivateRoute = ({
  component: Component,
  condition,
  path,
  redirectRoute,
  ...props
}) => {
  if (!condition) {
    return (
      <Redirect
        to={{
          pathname: redirectRoute,
          from: props.location,
        }}
      />
    );
  }
  return <Route path={path} component={Component} {...props} />;
};

PrivateRoute.propTypes = {
  component: PropTypes.func,
  condition: PropTypes.bool,
  path: PropTypes.string,
  redirectRoute: PropTypes.string,
  location: PropTypes.object,
};

export default PrivateRoute;
```

Open `app/javascript/src/apis/auth.js` and replace it with the following
content:

```javascript
import axios from "axios";

const login = payload =>
  axios.post("/session", {
    login: payload,
  });

const signup = payload =>
  axios.post("/users", {
    user: payload,
  });

const authApi = {
  login,
  signup,
};

export default authApi;
```

As with sign-up page, we will abstract the form logic from login to a different
component. For that, create a new file, `Login.jsx` inside `Form` folder by
running the following command:

```bash
mkdir -p app/javascript/src/components/Authentication/Form/
touch app/javascript/src/components/Authentication/Form/Login.jsx
```

Add the following content into `Form/Login.jsx`:

```jsx
import React from "react";
import { Link } from "react-router-dom";

import Input from "components/Input";
import Button from "components/Button";

const Login = ({ handleSubmit, setEmail, setPassword, loading }) => {
  return (
    <div
      className="flex items-center justify-center min-h-screen
      px-4 py-12 lg:px-8 bg-gray-50 sm:px-6"
    >
      <div className="w-full max-w-md">
        <h2
          className="mt-6 text-3xl font-extrabold leading-9
          text-center text-bb-gray-700"
        >
          Sign In
        </h2>
        <div className="text-center">
          <Link
            to="/signup"
            className="mt-2 text-sm font-medium text-bb-purple
            transition duration-150 ease-in-out focus:outline-none
            focus:underline"
          >
            Or Register Now
          </Link>
        </div>
        <form className="mt-8" onSubmit={handleSubmit}>
          <Input
            label="Email"
            type="email"
            placeholder="oliver@example.com"
            onChange={e => setEmail(e.target.value)}
          />
          <Input
            label="Password"
            type="password"
            placeholder="********"
            onChange={e => setPassword(e.target.value)}
          />
          <Button type="submit" buttonText="Sign In" loading={loading} />
        </form>
      </div>
    </div>
  );
};

export default Login;
```

`Login` component will be responsible for making the API call to create a user
session. For that, create a new file, `Login.jsx` by running the command and
let's make use of our reusable component `Login` inside `Form` folder:

```bash
touch ./app/javascript/src/components/Authentication/Login.jsx
```

Add the following content to `Login.jsx`:

```jsx
import React, { useState } from "react";

import LoginForm from "components/Authentication/Form/Login";
import authApi from "apis/auth";
import { setAuthHeaders } from "apis/axios";
import { setToLocalStorage } from "utils/storage";

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async event => {
    event.preventDefault();
    setLoading(true);
    try {
      const response = await authApi.login({ email, password });
      setToLocalStorage({
        authToken: response.data.authentication_token,
        email: email.toLowerCase(),
        userId: response.data.id,
        userName: response.data.name,
      });
      setAuthHeaders();
      setLoading(false);
      window.location.href = "/";
    } catch (error) {
      logger.error(error);
      setLoading(false);
    }
  };

  return (
    <LoginForm
      setEmail={setEmail}
      setPassword={setPassword}
      loading={loading}
      handleSubmit={handleSubmit}
    />
  );
};

export default Login;
```

Here, we are storing the tokens from login API response in `localstorage` of the
browser. These tokens will be attached to the request headers as `X-Auth-Token`
and `X-Auth-Email` in every request.

**Note:** Make sure that `axios` headers are set as mentioned in
[the previous chapter](/learn-rubyonrails/setting-up-react-environment#axios-headers-and-defaults).

## Validating request authenticity in backend

Until now, the users were able to get the list of tasks through API even if they
weren't authenticated. To restrict this behavior, we will make the following
changes:

1. If user is logged in, we do nothing and allow the controller to carry out its
   job.
2. If user is not logged in, we stop the application flow and redirect the user
   to the Login page.

For handling the 2nd case, we can use `Filters` provided by Rails. `Filters` are
methods that are run "before", "after" or "around" a controller action.

We would be using a `before_action` filter here as we want to check if the user
is logged in or not before letting the user view the tasks list or access any
data within the database. We will create a method for authentication and pass
this method to the `before_action` filter.

Update the `application_controller.rb` file like this:

```ruby
class ApplicationController < ActionController::Base
  before_action :authenticate_user_using_x_auth_token

  # previous code

  private

    # previous code

    def authenticate_user_using_x_auth_token
      user_email = request.headers["X-Auth-Email"].presence
      auth_token = request.headers["X-Auth-Token"].presence
      user = user_email && User.find_by!(email: user_email)
      is_valid_token = user && auth_token && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, auth_token)
      if is_valid_token
        @current_user = user
      else
        render_error("Could not authenticate with the provided credentials", :unauthorized)
      end
    end

    def current_user
      @current_user
    end
end
```

Let's observe what's going on here.

We will be receiving the `authentication_token` and `email_id` of the user in
the request headers as `X-Auth-Token` and `X-Auth-Email` respectively, with all
the API requests which needs to be authenticated.

Calling the `presence` method on `request.headers["X-Auth-Email"]` will return
the value of `X-Auth-Email` if it is not nil otherwise it will return `nil`. The
`to_s` method returns a string equivalent of the value it is called upon if the
value is present. If `to_s` is called on `nil` then it returns an empty string.

We are checking if the `auth_token` is present using the `to_s` method because,
the `presence` method would return `nil` if `request.headers["X-Auth-Token"]` is
not present and that will cause `secure_compare` method to throw an error.

When the method `authenticate_user_using_x_auth_token` is invoked, at first the
user is retrieved from database based on the `email_id` passed in the header. We
then check if the `auth_token` passed in the request header matches with the
`authentication_token` stored in database for that particular user. If the
credentials are correct, we set `@current_user` as `user`.

This is similar to how gems like `Devise` use `sign_in` method. Since
`@current_user` is an instance variable, it will be available in all the classes
inheriting from `ApplicationController`.

We have also added a method called `current_user` which returns the current user
details.

Order of the filters in which they are invoked matters a lot. Controller
executes filters in the order in which they are defined. We want the
authentication filter to run before any other filters.

That's why it's important that `authenticate_user_using_x_auth_token` is the
first filter. We have ensured this by declaring it as the first filter inside
the `ApplicationController`. All controllers inheriting from the
`ApplicationController` will inherit this filter and it will be the first filter
to be invoked.

Keep in mind that the `authenticate_user_using_x_auth_token` method should only
be invoked to authenticate API requests. It should not be invoked for any other
requests. Because for non-API routes authentication will fail as `X-Auth-Email`
and `X-Auth-Token` will not be present in the request header and the request
will fail.

The entry point into the application is not an API request and it is processed
by the `index` action of the `HomeController` which inherits from the
`ApplicationController`. We ought to skip the
`authenticate_user_using_x_auth_token` filter in this case. Add a
`skip_before_action` callback in the `home_controller.rb` file like this:

```ruby {2}
class HomeController < ApplicationController
  skip_before_action :authenticate_user_using_x_auth_token

  def index
    render
  end
end
```

## Skipping authentication when not required

Suppose the user is signing up or logging in. In such a case, performing
authentication doesn't make sense because the auth headers are not yet set.

We have declared the `authenticate_user_using_x_auth_token` in such a way that
it will be called before any other filters and controller actions. Our
application should not invoke this method when the user sends a login request.

To do so, we can use the `skip_before_action` filter inside the
`SessionsController` like this:

```ruby {2}
class SessionsController < ApplicationController
  skip_before_action :authenticate_user_using_x_auth_token

  def create
    @user = User.find_by!(email: login_params[:email].downcase)
    unless @user.authenticate(login_params[:password])
      render_error("Incorrect credentials, try again.", :unauthorized)
    end
  end

  private

    def login_params
      params.require(:login).permit(:email, :password)
    end
end
```

We should also skip authentication during signup. Update the `UsersController`
like this:

```ruby {2}
class UsersController < ApplicationController
  skip_before_action :authenticate_user_using_x_auth_token, only: :create

  # previous code
```

## Moving response messages to i18n en.locales

Let's move the response messages to `en.yml`:

```yaml {2-4}
en:
  session:
    could_not_auth: "Could not authenticate with the provided credentials."
    incorrect_credentials: "Incorrect credentials, try again."
  successfully_created: "%{entity} was successfully created!"
  successfully_updated: "%{entity} was successfully updated!"
  task:
    slug:
      immutable: "is immutable!"
```

We can use this as `session.incorrect_credentials` as error response message in
`session_controller.rb`:

```ruby {4}
def create
    @user = User.find_by!(email: login_params[:email].downcase)
    unless @user.authenticate(login_params[:password])
      render_error(t("session.incorrect_credentials"), :unauthorized)
  end
end
```

And similarly, for the case where we can't authenticate user using auth token,
in `authenticate_user_using_x_auth_token` method declared inside the
`ApplicationController` class we can send the following response:

```ruby {12}
def authenticate_user_using_x_auth_token
  user_email = request.headers["X-Auth-Email"].presence
  auth_token = request.headers["X-Auth-Token"].presence
  user = user_email && User.find_by!(email: user_email)
  is_valid_token = user && auth_token && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, auth_token)
  if is_valid_token
    @current_user = user
  else
    render_error(t("session.could_not_auth"), :unauthorized)
  end
end
```

## Showing logged in user

Now, to show the logged in user's name in our `NavBar`, add these changes our
`app/javascript/src/components/NavBar/index.jsx` file:

```jsx {5,8,24-32}
import React from "react";
import NavItem from "./NavItem";
import authApi from "apis/auth";
import { resetAuthTokens } from "src/apis/axios";
import { getFromLocalStorage } from "utils/storage";

const NavBar = () => {
  const userName = getFromLocalStorage("authUserName");

  return (
    <nav className="bg-white shadow">
      <div className="px-2 mx-auto max-w-7xl sm:px-4 lg:px-8">
        <div className="flex justify-between h-16">
          <div className="flex px-2 lg:px-0">
            <div className="hidden lg:flex">
              <NavItem name="Todos" path="/dashboard" />
              <NavItem
                name="Add"
                iconClass="ri-add-fill"
                path="/tasks/create"
              />
            </div>
          </div>
          <div className="flex items-center justify-end gap-x-4">
            <span
              className="inline-flex items-center px-2 pt-1 text-sm font-regular leading-5 text-bb-gray-600
              text-opacity-50 transition duration-150 ease-in-out border-b-2 border-transparent focus:outline-none
              focus:text-bb-gray-700"
            >
              {userName}
            </span>
          </div>
        </div>
      </div>
    </nav>
  );
};

export default NavBar;
```

Now, to validate these changes, we need some user accounts. We might already
have created some users while testing the sign-up feature on our previous
chapter.

To ensure uniformity, let us clear all of them, and create some users.

Start the Rails console:

```bash
bundle exec rails console
```

Clear all users:

```ruby
User.destroy_all
```

Now, run this snippet to create our default users:

```ruby
User.create!(
  email: 'oliver@example.com', name: 'Oliver',
  password: 'welcome', password_confirmation: 'welcome'
)
User.create!(
  email: 'sam@example.com', name: 'Sam',
  password: 'welcome', password_confirmation: 'welcome'
)
```

Start Rails server and go to our application. We should be able to login to any
one of these demo accounts.

Now, let's commit the changes:

```bash
git add -A
git commit -m "Added login feature"
```
