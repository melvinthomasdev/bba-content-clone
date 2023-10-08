## React Router

React router is used for declarative routing in React. React Router uses a model
called "dynamic routing". It means that routing takes place as your app is
rendering, and not via a configuration or convention outside of the running app.

To install React Router, run the following command:

```bash
yarn add react-router-dom@5.3.0
```

Then, run the following command:

```bash
mkdir -p ./app/javascript/src/
touch ./app/javascript/src/App.jsx
```

This creates `App.jsx` file.

The `App.jsx` component will act as the entry point for all our rendering.

Let's also add loading state into this component so that in upcoming sections we
can set the axios headers synchronously.

Paste the following contents into `App.jsx`:

```jsx
import React, { useEffect, useState } from "react";
import { Route, Switch, BrowserRouter as Router } from "react-router-dom";

const App = () => {
  return (
    <Router>
      <Switch>
        <Route exact path="/" render={() => <div>Home</div>} />
        <Route exact path="/about" render={() => <div>About</div>} />
      </Switch>
    </Router>
  );
};

export default App;
```

Once the components are created and routing is implemented in the following
chapters, we should be able to see the `Home` and `About` components being
rendered. This forms the basis for `react-router`.

## Axios

[Axios](https://axios-http.com) is a promise based HTTP client for the browser and Node.js. To install
`axios` , run the following command:

```bash
yarn add axios
```

HTTP requests can be sent easily by using different methods in `axios` .
For example `axios.get('https://httpbin.org/get')` will send a `GET` request to the
specified URL.

The `axios` requests are mostly `async` in nature. Thus at BigBinary we always
embed all `async` blocks within the `try-catch` blocks to ensure that the code
catches any exceptions that might occur as part of the call.

Adding `async` calls within `try-catch` block also helps in debugging.

### Axios headers and defaults

Interceptors are methods which are triggered before the main method. A
`request interceptor` is called before the actual call to the endpoint is made
and a `response interceptor` is called before the promise is completed and the
data is received from the callback:

```bash
mkdir -p ./app/javascript/src/apis
touch ./app/javascript/src/apis/axios.js
```

This creates a file `axios.js` inside `apis` directory.

As starters, we will use this file to set out Axios headers.

Rails by default adds CSRF counter measures for all requests.

Thus even for AJAX calls, we will have to provide a CSRF token, so that Rails
will understand that the request is trust worthy.

In the upcoming chapters, when we reach authentication part, we need a scalable
mechanism by which we can send the authentication token to our backend server
with each request.

For all these cases, setting the Axios headers is the solution.

Paste the following to `axios.js`:

```js
import axios from "axios";

axios.defaults.baseURL = "/";

export const setAuthHeaders = (setLoading = () => null) => {
  axios.defaults.headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
    "X-CSRF-TOKEN": document
      .querySelector('[name="csrf-token"]')
      .getAttribute("content"),
  };
  const token = localStorage.getItem("authToken");
  const email = localStorage.getItem("authEmail");
  if (token && email) {
    axios.defaults.headers["X-Auth-Email"] = email;
    axios.defaults.headers["X-Auth-Token"] = token;
  }
  setLoading(false);
};
```

`setAuthHeaders` is a function invoked from `App.jsx`.

The CSRF token will be set in the `X-CSRF-TOKEN` header.

It then sets the page to loading and the function sets default headers from
`X-Auth-Email` and `X-Auth-Token`.

The `email` and `token` will come into action once we reach the chapter dealing
with authentication.

These tokens will then be sent with every request to the backend server.

The `setLoading` function is used to make sure that our `App.jsx` component is
only rendered once these headers are set.

We usually show a page loader while waiting for this process to be completed.

Once the headers have been set, `setLoading(false)` removes the page loader and
renders the desired component.

Now we need to invoke this `setAuthHeaders` method from our entry point, which
is `App.jsx`.

Add the following code to `App.jsx`:

```jsx
import React, { useEffect, useState } from "react";
import { Route, Switch, BrowserRouter as Router } from "react-router-dom";
import { setAuthHeaders } from "apis/axios";
// previous code if any

const App = () => {
  const [loading, setLoading] = useState(true);
  // previous code if any

  useEffect(() => {
    setAuthHeaders(setLoading);
  }, []);

  if (loading) {
    return <h1>Loading...</h1>;
  }

  // previous code without changes
};
```

## JS Logger

Our `ESlint` config does not allow us to use `console.log` inside of our app.
You can read more about why we should avoid `console.log` in general over
[here](https://medium.com/better-programming/please-stop-using-console-log-its-broken-b5d7d396cf15#).

The following line is how we have added a rule inside of our `ESlint` config
that marks all `console` statements as errors:

```json
{
  "no-console": "error"
}
```

However, during API calls to server or while communicating with another external
service, errors are bound to occur. In such cases, we might want to log the
errors that are caught from our `try-catch` block.

We can use `js-logger` in such cases. `js-logger` is a lightweight JavaScript
Logger that has zero dependencies.

During the setup of Webpacker, we had already installed the necessary packages, specifically `js-logger` and `babel-plugin-js-logger`.

To initialize `js-logger`, run the following command from the root of project:

```bash
mkdir -p ./app/javascript/src/common
touch ./app/javascript/src/common/logger.js
```

Inside `logger.js` , paste the following:

```javascript
export const initializeLogger = () => {
  /* eslint react-hooks/rules-of-hooks: "off" */
  const Logger = require("js-logger");
  Logger.useDefaults();
  if (process.env.RAILS_ENV === "production") {
    Logger.setLevel(Logger.OFF);
  }
};
```

If you wish to use the `logger.js` file from the
[Wheel repository](https://raw.githubusercontent.com/bigbinary/wheel/main/app/javascript/src/common/logger.js),
then you can do so using the following command:

```bash
curl -o "./app/javascript/src/common/logger.js" "https://raw.githubusercontent.com/bigbinary/wheel/main/app/javascript/src/common/logger.js"
```

Typically, you would need to manually add the `js-logger` plugin to your `babel.config.js` file. However, our provided `babel.config.js` file from `wheel` already includes the `js-logger` plugin, as shown below. Therefore, there is no need for you to modify the `babel.config.js` file.

```javascript {2}
  plugins: [
    "js-logger",
    "babel-plugin-macros",
    "@babel/plugin-transform-runtime",
    isTestEnv
      ? "babel-plugin-dynamic-import-node" // tests run in node environment
      : "@babel/plugin-syntax-dynamic-import",
    isProductionEnv && [
      "babel-plugin-transform-react-remove-prop-types",
      { removeImport: true },
  ],
```

Then, invoke `initializeLogger()` from `App.jsx` as follows:

```jsx
// previous imports
import { initializeLogger } from "common/logger";

const App = () => {
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    /*eslint no-undef: "off"*/
    initializeLogger();
    setAuthHeaders(setLoading);
    // logger.info("Never use console.log");
    // logger.error("Never use console.error");
  }, []);

  if (loading) {
    return <h1>Loading...</h1>;
  }

  return (
    <Router>
      <Switch>
        <Route exact path="/" render={() => <div>Home</div>} />
        <Route exact path="/about" render={() => <div>About</div>} />
      </Switch>
    </Router>
  );
};

export default App;
```

On running your server, you would see that `js-logger` won't log any of the
messages in the browser console even if the logger statements are uncommented.
The reason is that we haven't mounted the `App.jsx` component into our Rails
view pipeline yet.

We will talk more the mounting and how to do that in the
[chapter for API based architecture](https://bigbinary.com/learn-rubyonrails-book/api-based-architecture).

Since no routes or components have been set in the Rails pipeline, it will by
default show a welcome page that it comes shipped with.

Currently there is no use case of logging from `App.jsx`. Thus we suggest to
consider the above mentioned logger statements as examples only.

## CSRF token authenticity verification error

If you ever encounter the `ActionController::InvalidAuthenticityToken` error,
then it means that your Axios requests are not sending the CSRF token while
making requests to Rails server.

Thus the first point to check would be `axios.js` file and check whether code to
set default headers have been added or not. Compare your `axios.js` file with
the code given in the [previous section](#axios-headers-and-defaults).

Once that is verified, the next step is to check `App.jsx`, and verify that
`setAuthHeaders(setLoading)` has been invoked from `useEffect`.

Please refer the previous sections in this chapter itself to understand how to
set Axios headers.

## Aliases

Aliases allows us to create aliases to import or require certain modules more
easily. Instead of doing:

```jsx
import authAPI from "../../apis/auth";
```

We can define an alias for the `apis` folder so that it can be accessed from any
component without having to do relative import.

To do so, edit `resolve.js` as follows:

```javascript {5,6,7}
// Rest of the code if any

module.exports = {
  alias: {
    apis: absolutePath("src/apis"),
    common: absolutePath("src/common"),
    components: absolutePath("src/components"),
  },
  // Rest of the code if any
};
```

Now, you can `import` from `apis` folder without having to resolve the entire
path each time.

Example:

```jsx
import authAPI from "apis/auth";
```

Now let's commit these changes:

```bash
git add -A
git commit -m "Set up react environment"
```

### References

- [Understanding React Router](https://reactrouter.com/web/guides/quick-start)
- [Understanding Axios](https://github.com/axios/axios)
- [Fetch vs Axios](https://medium.com/@thejasonfile/fetch-vs-axios-js-for-making-http-requests-2b261cdd3af5)
- [JS-Logger](https://github.com/jonnyreeves/js-logger)
- [What is Babel?](https://babeljs.io/docs/en/)
- [Aliasing in webpack](https://webpack.js.org/configuration/resolve/)
