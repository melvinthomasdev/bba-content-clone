**Missing an await**

Unlike Cypress, which seamlessly manages asynchrony within its syntax, Playwright relies on promises, and most of its methods return promises. The potential for code flakiness arises when we neglect to await the completion of promises. Omitting the await keyword is a primary culprit behind flaky tests in Playwright. Additionally, vigilant API monitoring is crucial for maintaining test stability.

If any of the following scenarios occur, the most probable culprit would be not awaiting an asynchronous method:

1. Our code executes after the after hooks of Playwright are executed. Ideally, after hooks should consistently run only after our entire test has completed. This is the phase where all default fixtures, such as the page and content, are torn down.

   <image>playwright-afterhooks-execution.png</image>

2. In the event of receiving a "Page closed" error.

   <image>playwright-page-closed-error.png</image>

**Not waiting for API responses**

Tests may exhibit flakiness until proper synchronization is established between UI actions and API responses.

```js
const fetchUsers = interceptMultipleResponses({
  responseUrl: USERS_PATH,
  times: 3,
}); // returns a promise and is assigned to fetchUsers
await page.getByTestId("users").click(); // UI action
await fetchUsers; // wait until promises are resolved
```

`interceptMultipleResponses` is a custom command we've implemented, designed to wait for the API response with the specified path for the specified number of requests.
