## Features

Let's implement user sign-up functionality to our application. With this
feature, new users can sign-up via UI and they will be able to handle their
tasks via Dashboard.

These are the goals we are trying to achieve in this chapter:

- We need an API for creating users with details such as name, email, and
  password.
- We need a new page showing a form having fields: name, email, password, and
  password confirmation. The form should call the user creation API with the
  input data upon submission.

  <image alt="User signup page">signup-page.png</image>

- Users should be able to see a toast message when the form submission is
  successful.

  <image alt="Signup Success Toastr">signup-success-toaster.png</image>

## Technical design

To implement user sign-up, we will have to do the following:

- From the `create` action in `UsersController`, we will create an instance of
  `User` from the request data and save it to the database.

- If saving is successful, we will respond with JSON data containing the key
  called `notice`. Since we had already implemented the Axios interceptors, it
  will take care of showing the contents from the `notice` key in response as a
  `Toastr` notification.

- We will create a new API connector, `auth.js` for calling sign-up and other
  authentication-related APIs.

- We will create a new frontend page `Signup` for taking user credentials and
  sending them via API. We will use the `/signup` route to display that page.
- To make things more modular, we can accept these credentials from a separate
  component called `Signup` inside `Form` folder.

## Adding create action

Open `app/controllers/users_controller.rb` file and add the following content:

```ruby
class UsersController < ApplicationController
  # previous code

  def create
    user = User.new(user_params)
    user.save!
    render_notice("User was successfully created!")
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
```

Now we need to update `routes.rb`:

```ruby {4}
Rails.application.routes.draw do
  constraints(lambda { |req| req.format == :json }) do
    resources :tasks, except: %i[new edit], param: :slug
    resources :users, only: %i[index create]
  end

  root "home#index"
  get "*path", to: "home#index", via: :all
end
```

## Moving response messages to i18n en.locales

Let's move our response message to `locales/en.yml` but this time with even more
modularization. Since, the response message for `User` and `Task` are same, we
can combine them using variable interpolation.

To create abstraction, the i18n provides a feature called variable interpolation
that allows you to use variables in translation definitions and pass the values
for these variables to the translation method.

Let's modify our response messages in `en.yml` to use variable interpolation:

```yaml {2-3}
en:
  successfully_created: "%{entity} was successfully created!"
  successfully_updated: "%{entity} was successfully updated!"
  task:
    slug:
      immutable: "is immutable!"
```

Now, `successfully_created`, in `en.yml`, will expect a variable named,
`entity`. So let's go through our JSON responses and pass that variable with
appropriate entity name, wherever we are using `successfully_created` key.

In `users_controller.rb`:

```ruby {4}
def create
  user = User.new(user_params)
  user.save!
  render_notice(t("successfully_created", entity: "User"))
end
```

And in `tasks_controller.rb`:

```ruby {4}
def create
  task = Task.new(task_params)
  task.save!
  render_notice(t("successfully_created", entity: "Task"))
end
```

And hence, by doing this we don't have to write two separate messages.

## API connector for authentication

We can create a new API connector, `auth.js`, which exports all authentication
related API calls as functions.

Create a the file `app/javascript/src/apis/auth.js` and add the following lines
to it:

```javascript
import axios from "axios";

const signup = payload =>
  axios.post("/users", {
    user: payload,
  });

const authApi = {
  signup,
};

export default authApi;
```

## Creating sign up component

We need to create a `Signup` component to allow users to signup.

We will be keeping all of our auth based components inside `Authentication`
folder. To do so, run the following command:

```bash
mkdir -p app/javascript/src/components/Authentication
```

Inside the directory, create a new component by running the command:

```bash
touch app/javascript/src/components/Authentication/Signup.jsx
```

As discussed in the technical design, we will be abstracting signup form logic
to a different component called `Signup` inside `Form` folder. To create the
component that contains the form logic, run the following command:

```bash
mkdir -p app/javascript/src/components/Authentication/Form
touch app/javascript/src/components/Authentication/Form/Signup.jsx
```

In `Form/Signup.jsx`, paste the following contents:

```jsx
import React from "react";

import { Link } from "react-router-dom";

import { Button, Input } from "components/commons";

const Signup = ({
  handleSubmit,
  setName,
  setEmail,
  setPassword,
  loading,
  setPasswordConfirmation,
}) => (
  <div
    className="flex min-h-screen items-center justify-center bg-gray-50
    px-4 py-12 sm:px-6 lg:px-8 "
  >
    <div className="w-full max-w-md">
      <h2
        className="mt-6 text-center text-3xl font-extrabold
        leading-9 text-gray-700"
      >
        Sign Up
      </h2>
      <div className="text-center">
        <Link
          to="/"
          className="text-bb-purple mt-2 text-center text-sm
            font-medium transition duration-150 ease-in-out
            focus:underline focus:outline-none"
        >
          Or Login Now
        </Link>
      </div>
      <form className="mt-8 flex flex-col gap-y-6" onSubmit={handleSubmit}>
        <Input
          label="Name"
          placeholder="Oliver"
          onChange={e => setName(e.target.value)}
        />
        <Input
          label="Email"
          placeholder="oliver@example.com"
          type="email"
          onChange={e => setEmail(e.target.value)}
        />
        <Input
          label="Password"
          placeholder="********"
          type="password"
          onChange={e => setPassword(e.target.value)}
        />
        <Input
          label="Password Confirmation"
          placeholder="********"
          type="password"
          onChange={e => setPasswordConfirmation(e.target.value)}
        />
        <Button buttonText="Register" loading={loading} type="submit" />
      </form>
    </div>
  </div>
);

export default Signup;
```

Now open `Signup.jsx` and add the following contents.

```jsx
import React, { useState } from "react";

import authApi from "apis/auth";
import SignupForm from "components/Authentication/Form/Signup";

const Signup = ({ history }) => {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [passwordConfirmation, setPasswordConfirmation] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async event => {
    event.preventDefault();
    setLoading(true);
    try {
      await authApi.signup({
        name,
        email,
        password,
        password_confirmation: passwordConfirmation,
      });
      setLoading(false);
      history.push("/dashboard");
    } catch (error) {
      logger.error(error);
      setLoading(false);
    }
  };

  return (
    <SignupForm
      handleSubmit={handleSubmit}
      loading={loading}
      setEmail={setEmail}
      setName={setName}
      setPassword={setPassword}
      setPasswordConfirmation={setPasswordConfirmation}
    />
  );
};

export default Signup;
```

We have created a `Signup` component and we have abstracted form logic to
`Signup.jsx` and form components to `Form/Signup.jsx`.

Now, we will be adding a route inside of `App.jsx` that renders our newly
created `Signup` component.

To do so, open `App.jsx` and add the highlighted lines:

```jsx {2,10}
// ----previous imports if any----
import Signup from "components/Authentication/Signup";

const App = () => {
  // previous code if any
  return (
    <Router>
      <Switch>
        // -----previous code if any-----
        <Route exact path="/signup" component={Signup} />
      </Switch>
    </Router>
  );
};
```

Now let's run Rails server and visit http://localhost:3000/signup and input the
details of the new user.

After filling in the details click on `submit` button and you will be notified
whether the request was successful or not by the previously added `Toastr`
component.

In the following chapters we will implement the feature to redirect the user to
`login` page on successful registration.

Now, let's commit the changes:

```bash
git add -A
git commit -m "Added signup feature"
```
