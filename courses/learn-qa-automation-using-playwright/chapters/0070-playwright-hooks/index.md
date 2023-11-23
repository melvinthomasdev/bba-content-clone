Hooks in playwright are functions that are executed before or after each test, test file, or test group. They can help you set up and tear down the environment for your tests, such as launching browsers, creating pages, logging in, cleaning up, etc.

**test.beforeAll(hookFunction)**

When called in the scope of a test file, it runs before all tests in the file. When called inside a test.describe() group, it runs before all tests in the group. You can use it to perform some global setup, such as launching a browser or creating a context.

```js
test.describe("Test suite", () => {
  test.beforeAll(async ({ page }) => {
    ...
  });

  test("test", async ({ page }) => {
    ...
  });
});
```

**test.afterAll(hookFunction)**

When called in the scope of a test file, it runs after all tests in the file. When called inside a test.describe() group, it runs after all tests in the group. You can use it to perform some global teardown, such as closing the browser or deleting the context.

```js
test.describe("Test suite", () => {
  test.afterAll(async ({ page }) => {
    ...
  });

  test("test", async ({ page }) => {
    ...
  });
});
```

**test.beforeEach(hookFunction)**

When called in the scope of a test file, it runs before each test in the file. When called inside a test.describe() group, it runs before each test in the group. You can use it to perform some local setup, such as creating a page, navigating to a URL, or logging in.

```js
test.describe("Test suite", () => {
  test.beforeEach(async ({ page }) => {
    ...
  });

  test("test", async ({ page }) => {
    ...
  });
});
```

**test.afterEach(hookFunction)**

When called in the scope of a test file, it runs after each test in the file. When called inside a test.describe() group, it runs after each test in the group. You can use it to perform some local teardown, such as reverting the actions performed during a test, taking screenshots, clearing cookies, or logging out.

```js
test.describe("Test suite", () => {
  test.afterEach(async ({ page }) => {
    ...
  });

  test("test", async ({ page }) => {
    ...
  });
});
```

Alternatively, the above hooks can also accept hook title as it's first parameter. The following example demonstrates this approach.

```js
test.describe("Test suite", () => {
  test.afterEach('after each hook', async ({ page }) => {
    ...
  });

  test("test", async ({ page }) => {
    ...
  });
});
```
