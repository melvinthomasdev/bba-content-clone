In this chapter we will add two new features. First feature is to display
notification messages and second feature is to customize the HTTP requests using
`Axios interceptors`.

## Features

Our notification feature should work in the following manner:

- Whenever an operation like creating a new task or deleting a task is
  performed, a notification message should be displayed which would let the user
  know of the result of the operation.

- When the operation is successful, the notification should contain a success
  message and in case of a failure it should contain the error.

- For success notifications, a checkbox icon should precede the message to
  denote a successful operation. Similarly in case of an error, there should be
  an alert icon. Small details like these can vastly improve the UI and UX of an
  application.

- Notifications should always appear at the centre-bottom of our page as shown
  in the image attached below.

- The notifications will be automatically shown upon getting a response from our
  server.

<image>showing-notifications.png</image>

## Technical design

To implement these features, we need the following:

- A notification component, we will call it `Toastr` for reasons mentioned in
  the next section. This `Toastr` component will display the notification
  message when a new notification arrives.

  `Toastr` component will be built using
  [react-toastify](https://github.com/fkhadra/react-toastify) library. Using
  `react-toastify` as a base will take care of a lot of low level
  implementation.

- `react-toastify` will also take care of rendering the appropriate icon
  according to the notification type. It comes shipped with some default icons
  for each intent like say `error`, `success`, `info` etc.

- A component which will act as a container for the notification messages. We
  will name it `ToastrComponent`.

- We will create a file called `storage.js` in `app/javascript/src/helpers`.
  Inside `storage.js`, we will create helper functions called
  `setToLocalStorage` and `getFromLocalStorage` to set and get data from the
  LocalStorage.

- API requests should contain authentication data by default. We shouldn't have
  to add authorization data every time we make a request.

- We already have a `setAuthHeaders` function to set default authorization
  headers for all HTTP requests made using `Axios`, and we will invoke this
  function inside the `App` component when application mounts.

  Authorization data is usually stored in browser's localStorage. We will use
  the storage helper functions to get authorization data from LocalStorage.

- Rather than invoking the notification component by ourselves, we can delegate
  the job of raising a notification automatically based on the status of the
  response using the `Axios interceptors`.

- Inside `axios.js` will create `handleSuccessResponse`, `handleErrorResponse`
  and `registerIntercepts` functions.

- `handleSuccessResponse` and `handleErrorResponse` functions are the two
  callbacks that will be registered as the response handlers for Axios
  responses.

- `registerIntercepts` function will register the `handleSuccessResponse` and
  `handleErrorResponse` functions with `Axios interceptors` to be called when a
  response is received.

- We will export `registerIntercepts` inside the `App` component and call it
  from there when application mounts.

## Creating a Toastr component

Yes. You read it right. We named it `Toastr`, so that it doesn't collide with
other library components which has names like `Toaster`, `Toasts` etc.

So a `Toastr` component's purpose is to display notifications like say "Task
completed", "Preparing download..." etc with an intent like `success`, `error`
etc.

Don't confuse this with the spinner logic. It's not the same. You can think of
this as a notification that you receive in your phone or alert messages in your
browser. Let's see how this can be useful for us.

In a Rails API based application, we send successful JSON responses with key
called `notice` and error notifications with key called `error`.

This is a convention we will be following while building this application. The
`notice` and `error` keys will always contain the message that needs to be shown
as a notification.

Let's see an example of a successful response sent with a `notice` key:

```ruby
render status: :ok, json: { notice: 'Successfully deleted the item' }
```

So when this response is received at the frontend side, we need to show a
notification with an intent of `success` (since http status is `ok` or 200).

Let's also see an example of an error response with the `error` key:

```ruby
render status: :unauthorized, json: { error: "Unauthorized" }
```

When an error response is received at the frontend side, we need to show an
error notification. That's pretty much the use case of a `Toastr`. Now let's
actually create the component.

So the questions that you need ask yourself are:

- Is this a React component? Yes. So we should name it with `.jsx` extension
  since it will contain jsx, obviously. This also helps with enhanced
  intellisense(we will get to it later).

- Where should this file be created in our directory structure? Since this file
  is common for all other components, let's actually create a directory called
  `Common` and add this file in it.

- The directory name as well as component file name, should be in `PascalCase`.
  The same thing applies to the component naming.

Run the following commands to create the file:

```bash
mkdir -p app/javascript/src/components/Common
touch app/javascript/src/components/Common/Toastr.jsx
```

To show the notifications, we need a base library which we can use and modify
according to our requirements(remember the intents?). Thus, let's make use of
the `react-toastify` package.

```bash
yarn add react-toastify@8.0.2
```

We are using this specific version of `react-toastify` because the latest one
has some breaking changes. To know more details check the
[issue](https://github.com/fkhadra/react-toastify/issues/775) in the official
`react-toastify` repo.

To make it work we need to add the CSS files associated with the
`react-toastify` library in the Rails assets pipeline.

This is an important step, and you should remember this whenever you are adding
a new JavaScript package. That is, you need to add the CSS files relevant to the
package in the Rails assets pipeline.

Let's append the following lines to
`app/javascript/stylesheets/application.scss`:

```bash
@import "react-toastify/dist/ReactToastify.min.css";
```

Awesome! Now we can use those packages and their styles, colors, transitions
etc.

Sometimes these packages don't work as intended when we deploy the application
to heroku. This is because Rails asset pipeline works slightly differently in
the development environment and in the production environment.

Let's complete our `Toastr` component. Add the following code snippet to
`app/javascript/src/components/Common/Toastr.jsx`:

```javascript
import React from "react";

import { toast, Slide } from "react-toastify";

const ToastrComponent = ({ message }) => {
  return (
    <div className="flex flex-row items-start justify-start">
      <p className="mx-4 font-medium leading-5 text-white">{message}</p>
    </div>
  );
};

const showToastr = message => {
  toast.success(<ToastrComponent message={message} />, {
    position: toast.POSITION.BOTTOM_CENTER,
    transition: Slide,
    theme: "colored",
  });
};

const isError = e => e && e.stack && e.message;

const showErrorToastr = error => {
  const errorMessage = isError(error) ? error.message : error;
  toast.error(<ToastrComponent message={errorMessage} />, {
    position: toast.POSITION.BOTTOM_CENTER,
    transition: Slide,
    theme: "colored",
  });
};

const Toastr = {
  success: showToastr,
  error: showErrorToastr,
};

export default Toastr;
```

Done. Now we have a `Toastr` component which we can actually use in our code.
But the question is how do we effectively use it?

You must have noticed that the props passed to both success and error `toast`
components are same. This is a clear violation of the DRY principle. We should
avoid writing duplicate code.

Thus instead of passing the same props twice, we should declare a constant
variable called `TOASTR_OPTIONS` which will store the props and we can pass this
variable in place of the props.

First create a directory for constants inside `app/javascript/src` and then
create a new file inside the `app/javascript/src/constants` directory using the
following commands:

```bash
mkdir -p app/javascript/src/constants/
touch app/javascript/src/constants/index.js
```

Inside `app/javascript/src/constants/index.js`, add the following lines of code:

```javascript
import { toast, Slide } from "react-toastify";

const TOASTR_OPTIONS = {
  position: toast.POSITION.BOTTOM_CENTER,
  transition: Slide,
  theme: "colored",
};

export { TOASTR_OPTIONS };
```

Let's add a webpack alias for the constants directory. Append the following into
the `alias` key in `config/webpack/alias.js`:

```javascript {7}
module.exports = {
  resolve: {
    alias: {
      apis: "src/apis",
      common: "src/common",
      components: "src/components",
      constants: "src/constants",
    },
  },
};
```

Instead of declaring a variable inside `Toastr.jsx` itself we have declared the
`TOASTR_OPTIONS` variable inside a separate file because this will allow us to
import and reuse this variable in other files if required and if we need to
update the Toastr props we will only need to make changes in one file.

It is considered a good practice to declare common constants and helper
functions in a separate file for the following reasons:

- Prevents clutter inside components and modules thus making them less bulky.

- Doing so makes it convenient to import and reuse them in multiple places and
  prevents code duplication.

- Classes, modules and functions should follow the single responsibility
  principle. Declaring constants and helper functions inside them defeats this
  purpose. And it also makes the code difficult to maintain and reuse.

Now, update `app/javascript/src/components/Common/Toastr.jsx` with the following
lines of code:

```js {2,4,15,22}
import React from "react";
import { toast } from "react-toastify";

import { TOASTR_OPTIONS } from "constants";

const ToastrComponent = ({ message }) => {
  return (
    <div className="flex flex-row items-start justify-start">
      <p className="mx-4 font-medium leading-5 text-white">{message}</p>
    </div>
  );
};

const showToastr = message => {
  toast.success(<ToastrComponent message={message} />, TOASTR_OPTIONS);
};

const isError = e => e && e.stack && e.message;

const showErrorToastr = error => {
  const errorMessage = isError(error) ? error.message : error;
  toast.error(<ToastrComponent message={errorMessage} />, TOASTR_OPTIONS);
};

const Toastr = {
  success: showToastr,
  error: showErrorToastr,
};

export default Toastr;
```

Ideally, whenever we get a JSON response from our server, and if it contains the
`notice` key or Rails `errors` object, then we need to show the notification.

But handling this step manually at each location where this response will be
received, is a tedious task.

So let's make use of `axios` and the magical interceptors which it provides, to
do this job for us. Let's see how it's done in the next section.

Before moving on to Axios interceptors, we should take a look at storing data
like `authorization token` received through JSON responses in localStorage.

## Storing data in localStorage

Let's create a helper function to store required data in localStorage and
another helper function to fetch the stored data.

First we can create a directory for utility files and a file called `storage.js`
in it:

```bash
mkdir -p app/javascript/src/utils/
touch app/javascript/src/utils/storage.js
```

Add the following to `app/javascript/src/utils/storage.js`:

```javascript
const setToLocalStorage = ({ authToken, email, userId, userName }) => {
  localStorage.setItem("authToken", JSON.stringify(authToken));
  localStorage.setItem("authEmail", JSON.stringify(email));
  localStorage.setItem("authUserId", JSON.stringify(userId));
  localStorage.setItem("authUserName", JSON.stringify(userName));
};

const getFromLocalStorage = key => {
  let response = "";
  try {
    const value = localStorage.getItem(key);
    response = value ? JSON.parse(value) : "";
  } catch (error) {
    logger.error(error);
    response = "";
  }
  return response;
};

export { setToLocalStorage, getFromLocalStorage };
```

We have added a `try/catch` block inside the `getFromLocalStorage` function so
that we can catch any errors while reading or parsing data. If any error occurs
it will be logged to the console and an empty string will be returned.

Now let's add a webpack alias for these helpers. Append the following into the
`alias` key in `config/webpack/alias.js`:

```javascript {5}
module.exports = {
  resolve: {
    alias: {
      apis: "src/apis",
      utils: "src/utils",
      common: "src/common",
      components: "src/components",
      constants: "src/constants",
    },
  },
};
```

We can now use these helpers over native local storage functions in our
`axios.js` file. Thus replace local storage statements with the following
highlighted lines in `axios.js`:

```js {2,14-15}
import axios from "axios";
import { setToLocalStorage, getFromLocalStorage } from "utils/storage";

axios.defaults.baseURL = "/";

const setAuthHeaders = (setLoading = () => null) => {
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
```

## Using Axios interceptors

Axios interceptors are the middleware that we use between the client and the
server, so that it intercepts all the requests, and we can apply custom
functionality.

These are technically, functions that Axios calls for every request.

We can use interceptors to transform the request before Axios sends it, or
transform the response before Axios returns the response to the code from where
it was invoked.

We have already used a similar Axios functionality for setting the headers with
each request and wrapped it a custom function called `setAuthHeaders`.

Similarly let's actually write the interceptors in our project specific
`axios.js` file.

Open `app/javascript/src/apis/axios.js` and add the following lines of code.

```js {2,5,26-54}
import axios from "axios";
import Toastr from "components/Common/Toastr";
import { setToLocalStorage, getFromLocalStorage } from "utils/storage";

const DEFAULT_ERROR_NOTIFICATION = "Something went wrong!";

axios.defaults.baseURL = "/";

const setAuthHeaders = (setLoading = () => null) => {
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

export { setAuthHeaders, registerIntercepts };
```

## Axios response callbacks

The `handleSuccessResponse` and `handleErrorResponse` functions are two of the
most important Axios callbacks that help us in handling the responses.

The Rails server will send different HTTP statuses for different actions. Thus
we should have a mechanism to notify the user of failures like say an
authorization error or even notify the user one of their actions, like say
creating a new task, was successful.

We could invoke `Toastr` messages in every component and make it show error or
success responses manually. But that's redundant work.

The `handleSuccessResponse` callback will take care of handling success
responses, which are usually having a status of `2xx`.

The `handleErrorResponse` callback will take care of handling error responses,
like say authorization error of status code 401 or server error of status code
500, etc. We also added custom logic like destroying the local storage keys
which are used for authorization, if we receive an authorization error response.

## Registering Axios interceptors

Phew! That was a lot of code, but there is one more step that we have to do.

We need to register these interceptors, as well as add a `ToastContainer` for
the `react-toastify` popups to show up in.

Fully replace `app/javascript/src/App.jsx` with the following content:

```javascript
import React, { useEffect, useState } from "react";
import { Route, Switch, BrowserRouter as Router } from "react-router-dom";
import { ToastContainer } from "react-toastify";

import CreateTask from "components/Tasks/Create";
import Dashboard from "components/Dashboard";
import PageLoader from "components/PageLoader";
import { registerIntercepts, setAuthHeaders } from "apis/axios";
import { initializeLogger } from "common/logger";

const App = () => {
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    initializeLogger();
    registerIntercepts();
    setAuthHeaders(setLoading);
  }, []);

  if (loading) {
    return (
      <div className="h-screen">
        <PageLoader />
      </div>
    );
  }

  return (
    <Router>
      <ToastContainer />
      <Switch>
        <Route exact path="/tasks/create" component={CreateTask} />
        <Route exact path="/dashboard" component={Dashboard} />
      </Switch>
    </Router>
  );
};

export default App;
```

Here we have imported the `Create` component from `components/Tasks/Create` as
`CreateTask`, and not as `Create`, because in future there can be many `create`
components from different folders in `App.jsx` and that will lead to an error
when there are more than one imports with the same name i.e. `Create`. More than
that, visually, it provides us a better understanding of what the component
creates since it's namespaced.

Now we are officially done.

So whenever we send a JSON response with a `notice` key or when we send full
messages from Rails `errors` object in the `error` key of JSON response, then
those notifications should show up.

The errors are handled in the `handleErrorResponse` function in `axios.js`.

These errors will be shown with an intent of `error`, which would make it popup
in the red background.

Likewise, we can create even further intents like say `Toastr.info`,
`Toastr.warning` etc.

So just test it out, by say creating a new task.

We would be receiving a green colored notification if the task was successfully
created.

```bash
git add -A
git commit -m "Created Toastr component and added Axios interceptors"
```
