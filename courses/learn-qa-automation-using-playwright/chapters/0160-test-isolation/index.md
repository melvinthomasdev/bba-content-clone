Test isolation refers to the practice of ensuring that each test in a software testing suite operates independently and is not influenced by the state or results of other tests. The primary goal of test isolation is to create a controlled and predictable testing environment.

Playwright provides the concept of browser contexts, which are isolated environments for running tests. Each test can have its own browser context, preventing interference between tests. Each context has its own set of pages and browser state, and they don't share cookies or cache.

We also have the option to create contexts as shown below.

```js
test("Regular and Admin", async ({ browser }) => {
  const adminContext = await browser.newContext();
  const regularContext = await browser.newContext();

  // create pages and interact with contexts independently
  const adminPage = await adminContext.newPage();
  const regularPage = await regularContext.newPage();
});
```

Creating custom contexts is useful when you want to isolate certain sets of tests or perform specific actions in a clean environment without affecting the default context or other custom contexts.
