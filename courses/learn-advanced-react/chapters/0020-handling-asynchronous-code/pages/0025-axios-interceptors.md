Axios lets us intercept `requests` and `responses` using interceptors. Requests
can be intercepted when we want to add additional configurations like default
headers and data. Responses can be intercepted when we want to perform some
action based on the response such as logging errors or logout out on 401.

To add an interceptor, just add a `requestHandler` to the `axios` object. For
example, if you want to add an authorization header to all `requests` that need
to be made, you can add a request interceptor like so:

```javascript
const requestHandler = request => {
  request.headers["Authorization"] = getAuthHeader();

  return request;
};

axios.interceptors.request.use(request => requestHandler(request));
```

Here's an example of a response interceptor that logs every error in the
console:

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

If your response handler hits a status code of 401: Unauthorized, make sure the
user is redirected to the login route If you maintain any authentication states
on the client side, reset them too.

The above example can be modified to logout the user on 401 like so:

```javascript
const responseSuccessHandler = response => {
  return response;
};

const responseErrorHandler = error => {
  if (error.response) {
    if (error.response.status === 401) {
      //  Redirect user to the login page
      //  Reset any locally stored session data / authentication information
    }
    // rest of error response handler
  }
  // rest of error handler

  return Promise.reject(error);
};

axios.interceptors.response.use(
  response => responseSuccessHandler(response),
  error => responseErrorHandler(error)
);
```

As shown in the above examples, the return values for the handlers are specific:

- The `requestSuccessHandler` should return the request config object it got as
  an argument
- The `responseSuccessHandler` should return the response object it got as an
  argument
- The `requestErrorHandler` and `responseErrorHandler` should return a
  `Promise.reject()`

If you wish to dive deeper into Interceptors, check out these resources:

- [Setting up Axios Interceptors for all HTTP calls in an application](https://blog.bitsrc.io/setting-up-axios-interceptors-for-all-http-calls-in-an-application-71bc2c636e4e)
- [The official Axios docs on Interceptors](https://axios-http.com/docs/interceptors)
