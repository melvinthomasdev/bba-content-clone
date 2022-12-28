## Use Axios interceptors

Axios lets us intercept `request` and `response`, former is used when we want to
add additional configuration (headers, data etc) while the latter is used when
we want to perform some action or modify the response (log errors, logout on 401
etc).

## Intercept all requests

Here, we will intercept and add auth headers to all `requests` that will be made
using Axios instance.

```javascript
const requestHandler = request => {
  request.headers["Authorization"] = getAuthHeader();

  return request;
};

axios.interceptors.request.use(request => requestHandler(request));
```

## Listen to all responses

The request will be resolved by default when the status code is between `200` -
`300`, otherwise the request will be rejected. This could be changed using
[validateStatus](https://github.com/axios/axios#handling-errors) in the request
config.

### 1. Log all errors

```javascript
const responseSuccessHandler = response => {
  return response;
};

const responseErrorHandler = error => {
  if (error.response) {
    console.error(error.response.data);
    console.error(error.response.status);
    console.error(error.response.headers);
  } else if (error.request) {
    console.error(error.request);
  } else {
    console.error("Error", error.message);
  }
  console.error(error.config);

  return Promise.reject(error);
};

axios.interceptors.response.use(
  response => responseSuccessHandler(response),
  error => responseErrorHandler(error)
);
```

### 2. Logout on 401

If status code is 401, redirect user to Login route. If we keep client side
authentication states, reset them.

```javascript
const responseSuccessHandler = response => {
  return response;
};

const responseErrorHandler = error => {
  if (error.response.status === 401) {
    // Add your logic to
    //  1. Redirect user to LOGIN
    //  2. Reset authentication from localstorage/sessionstorage
  }

  return Promise.reject(error);
};

axios.interceptors.response.use(
  response => responseSuccessHandler(response),
  error => responseErrorHandler(error)
);
```
