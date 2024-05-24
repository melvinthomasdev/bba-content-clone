## Test suite

In Playwright, **test.describe** is a function used to group and organize multiple test cases within a suite. It allows us to create a descriptive block for a set of related tests.

It takes two arguments: a string describing the suite and a function containing the individual test cases.

```js
import { test, expect } from "@playwright/test";

test.describe("Manage customers", () => {
  ...
  ...
});
```

## Test

The **test** function is used to define an individual test case. It takes two main arguments: a string describing the test case and an asynchronous function containing the actual test logic.

```js
import { test, expect } from "@playwright/test";

test.describe("Manage customers", () => {
  test("should verify member operations", async ({ page }) => {
    await page.goto("https://playwright.dev/");
      ...
  });
});
```

The asynchronous function receives a context object as its parameter. This object contains various properties, and the most commonly used one is `page`. The page property provides access to a page instance, allowing us to interact with the browser page during the test.

## Conventions for writing a test

- **Suite names:** Use descriptive names for test suites as the first param of the describe method. These names should represent a logical grouping of tests, often based on a feature or functionality. It should start with an uppercase letter and be short.

- **Test names:** Choose descriptive names for tests that clearly indicate what aspect of the application is being tested. Ensure these names are in lowercase. It can optionally begin with a should or must. The idea is that when reading the suite name and test name together, it should be meaningful. In the above example it would be read as `Manage customers should verify member operations`.

- **Organizing Tests:** Organize the tests hierarchically. Group related tests together to improve readability and maintainability.

This is a theoretical chapter. There is nothing to commit in here. If you have made some changes to the project, clean them up by executing the 
following command.

```bash
git clean -fd
```