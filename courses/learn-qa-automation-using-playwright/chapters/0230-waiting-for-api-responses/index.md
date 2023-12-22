Flaky tests often happen in end-to-end testing when UI actions are performed before the corresponding API responses are ready. This timing mismatch can lead to inconsistent test results. Playwright has methods like `waitForRequest` and `waitForResponse` to help sync user actions on the page with API responses. These methods wait until they find a matching API pattern, or they throw an error if it takes too long.

Let's consider the same example of an online shopping application where a new order is created when we click the submit button.

```js
await page.getByRole("button", { name: "Submit" }).click();
await page.waitForResponse(response => response.url().includes("/orders/"));
```

In the above example, `page.waitForResponse` waits for a network response that matches with the URL pattern `/orders/` after clicking the submit button.

Even though the above example seems simple, there is a chance for falkiness here. This is because the API might respond before Playwright starts waiting for it. It might happen for two reasons:

1. API is very fast.
2. External factors delay the test script.
   Such situations could lead to timeouts and test failures.

To address the above issue, it's important to coordinate the promises so that the waitForResponse command runs at the same time as UI actions. The following example illustrates this approach.

```js
const fetchOrder = page.waitForResponse(response =>
  response.url().includes("/orders/")
);

await page.getByRole("button", { name: "Submit" }).click();
await fetchOrder;
```

In the above example, the page starts watching for the responses matching the specific URL pattern, `/orders/` before clicking the submit button. The waitForResponse command returns a promise, which we have saved into the variable fetchOrder. After performing the click action in the following line, we wait for the promise stored in fetchOrder to resolve. When it resolves, it signifies that the response has been received. This enables us to move on to the next assertion without facing any reliability issues.

## **Managing Multiple Responses**

Let's consider a scenario where we have to manage multiple responses, one to add a product and another to fetch the updated list of products.

To wait for the completion of 2 requests from the same URL pattern, consider the following approach.

```js
const fetchOrders = Promise.all(
  [...new Array(2)].map(
    page.waitForResponse(response => response.url().includes("/orders/"))
  )
);
await page.getByRole("button", { name: "Submit" }).click();
await fetchOrders;
```

In the above example, we start waiting for two responses with the pattern `/orders/` using `Promise.all`. The flaw in the above code is that when both the waitForResponse methods run in parallel, they end up tracking the exact same API request. In simpler terms, it's like waiting for just one request, as both of them wait for the completion of the same API.

To solve the above problem, it's important to improve the code by keeping track of the resolved APIs. Let's see how to achieve the same.

```js
const trackedResponses = [];

const fetchOrders = Promise.all(
  [...new Array(2)].map(() =>
    page.waitForResponse(response => {
      const requestId = response.headers()?.["x-request-id"];

      if (
        response.url().includes("/orders/") &&
        !trackedResponses.includes(requestId)
      ) {
        trackedResponses.push(requestId);
        return true;
      }

      return false;
    })
  )
);

await page.getByRole("button", { name: "Submit" }).click();
await fetchOrders;
```

In the above example, we have initialized a new variable trackedResponses with an empty array, intended to store unique identifiers (request IDs) of resolved APIs. It checks if the URL includes the substring /orders/ and also whether the request ID has not already been tracked in trackedResponses array. If both conditions are satisfied, it adds the request ID to trackedResponses array and returns true, indicating that we should wait for the response. This approach prevents the monitoring of the same response more than once.

In BigBinary, we have extracted out the above logic to `interceptMultipleResponses` available in [neeto-playwright-commons](https://github.com/bigbinary/neeto-playwright-commons).
