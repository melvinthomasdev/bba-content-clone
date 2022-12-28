## Making a case for Axios

In many applications we are using low level fetch methods and making custom
adjustments as we need. It works but Axios can abstract away most of the stuff
that's done manually there. If we use Axios, we can handle these cases much more
cleanly.

For example, Axios interceptors are much easier to set up. Also, when we import
Axios, we receive a singleton. So, whatever change we make will be reflected
anywhere we use Axios. This is useful while handling headers. When logging in,
we can set auth tokens in Axios headers so that we won't have to specify it for
every requests. When logging out, we can reset the Axios headers.

## Why use Axios?

Axios helps to keep things D.R.Y with **instances**, **interceptors**, and
**defaults**. This can help with complex applications that are frequently making
API requests.

- **Interceptors:** Access the request or response configuration (headers, data,
  etc) as they're outgoing or incoming. These functions can act as gateways to
  see configuration or add/modify data.
- **Instances:** Create reusable instances with baseUrl, headers, and other
  configuration already set up.
- **Defaults:** Set default values for common headers (like Authorization) on
  outgoing requests. this will be useful if you're authenticating to a server on
  every request.

> Separate instances are often created for various APIs, interceptors are set up
> for global error handling, and defaults are often set, or unset, for things
> like common headers.

Axios’s library has a few other useful features.

1. Handling timeout
2. Intercept and/or Cancel requests
3. Protection against XSRF
4. Automatic transforms for JSON data
5. Wide support for browsers

### Install

```bash
$ yarn add axios
```

### Usage

```javascript
axios
  .get("/users/12345")
  .then(response => {
    // handle success
    console.log(response);
  })
  .catch(error => {
    // handle error
    console.log(error);
  })
  .then(() => {
    // always executed
  });
```

## Setup

It is suggested to add following configurations in `componentDidMount` of
`App.jsx` so that the axios instance is prepared to be used throughout the app.

### 1. Default config

```javascript
import axios from "axios";
import { getCSRFToken } from "components/utils";

axios.defaults.baseURL = "https://example.com/api/v1/";
axios.defaults.timeout = 1000;
axios.defaults.headers.common["X-CSRF-Token"] = getCSRFToken();

axios.get("/users/12345").then(response => {
  console.log(response);
});
```

### 2. Create an instance with default config

This could be useful for making different API calls which may not be done from
the default instance. For example: External services etc.

```javascript
import axios from "axios";
import { getCSRFToken } from "components/utils";

const API = axios.create({
  baseURL: "https://example.com/api/v1/",
  timeout: 1000,
  headers: {
    "X-CSRF-Token": getCSRFToken(),
  },
});

API.get("/users/12345").then(response => {
  console.log(response);
});
```

### 3. Intercept `requests` to add auth headers

```javascript
const requestHandler = request => {
  request.headers["Authorization"] = getAuthHeader();

  return request;
};

axios.interceptors.request.use(request => requestHandler(request));
```

### 4. Intercept `responses` to log errors

```javascript
// Provide only response json part
// => Chuk other metadata provided by axios
const responseSuccessHandler = response => {
  return response.data;
};

// Log & Sanitize errors response
// => The errors given by server will not be always consistent so we
//    could sanitize the response and return proper error to the client.
const responseErrorHandler = error => {
  var errors = ["Something went wrong, please try again!"];

  if (error.response) {
    if (error.response.data.errors) errors = error.response.data.errors;
    if (error.response.data.error) errors = [error.response.data.error];

    if (error.response.status === 401) forceLogoutUser();
  } else if (error.request) {
    console.log(error.request);
  } else {
    console.log("Error", error.message);
  }

  return Promise.reject({
    status: error.response.status,
    errors: errors,
  });
};

axios.interceptors.response.use(
  response => responseSuccessHandler(response),
  error => responseErrorHandler(error)
);
```

## Little things that matter

Axios simplifies and abstracts away a lot of code for us. Here are some useful
abstractions that axios provides to us.

### 1. Track upload progress

Axios is based on XMLHttpRequest and consequently all the events, properties and
methods that come along with it are available in Axios. A well known
fact(nitpick) about fetch() is that it doesn't provide a method to track
**upload progress**. Axios provides very easy ways to track upload progress on
the other hand.

Here is an example from the
[axios repo](https://github.com/axios/axios/blob/master/examples/upload/index.html)
itself:

```javascript
const [uploadProgress, setUploadProgress] = useState(0); // display uploadProgress value in a loader
// other lines of code
// .......

const config = {
  onUploadProgress: progressEvent => {
    const percentCompleted = Math.round(
      (progressEvent.loaded * 100) / progressEvent.total
    );
    setUploadProgress(percentCompleted);
  },
};

try {
  const updatedBlog = axios.put("/upload/server", data, config);
  return updatedBlog.response.data;
} catch (err) {
  if (!err.response) {
    throw err;
  }
  throw err.response.data;
}
```

### 2. Set timeout

As shown earlier setting timeout is as easy as adding a `timeout: 3000`
key-value pair to the axios config object. fetch() provides the
[AbortController](https://developer.mozilla.org/en-US/docs/Web/API/AbortController)
interface for timeouts, but it is not as simple to implement as in axios. You
can also implement your own higher-order function and make the fetch call inside
the returned function.

### 3. Use params config for querying

There are two ways to send query parameters in a GET request using Axios. The
most commonly used method is to append it to the URL. Let's say for example we
need to send the following as query parameters to
`https://example.com/api/v1/search`.

```json
{
  "firstName": "Oliver",
  "lastName": "Smith"
}
```

We can do this by appending the query parameters like so:

```plaintext
https://example.com/api/v1/search?firstName=Oliver&lastName=Smith
```

Or we can generate the query using packages like query-string that converts
objects to queries. Axios has this feature inbuilt and that's the second way of
sending query parameters using Axios.

```js
axios.get("https://example.com/api/v1/", { params: { firstName: "Oliver",
lastName: "Smith" } });
```

## References

- Kent C. Dodds'
  [opinion](https://kentcdodds.com/blog/replace-axios-with-a-simple-custom-fetch-wrapper)
  on when to prefer which among axios and fetch.
