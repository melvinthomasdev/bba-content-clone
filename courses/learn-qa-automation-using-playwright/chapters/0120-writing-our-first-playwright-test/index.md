With the concepts we learned in the previous chapters, lets write our first Playwright test.

To get started let's create a new spec file. Note that from here on all the commands will be executed at the `playwright-tests` directory and not at the root of the repository.

```bash
# Execute from the playwright-tests directory
mkdir e2e/tests
touch e2e/tests/login.spec.ts
```

Before writing the tests, let's observe the actual UI. As mentioned in the [locators chapter](https://courses.bigbinaryacademy.com/learn-qa-automation-using-playwright/locators/), `data-testid` is the most resilient selector to use while writing the tests. We can find the apt selectors to be used in the Playwright tests in two ways.

## Find selectors using the VSCode extension

If you have installed the VSCode extension as mentioned in the [Modes of Executing Tests chapter](https://courses.bigbinaryacademy.com/learn-qa-automation-using-playwright/modes-of-executing-tests/#vs-code-extension) then using the pick locator tool is the most efficient way to get the best locator. Let's use this tool to observe the elements on the Login page and find the best selector.

**Step 1: Open the `Pick Locator` tool from the Testing extension in VSCode**

Open the Playwright `Testing` extension and click on the `Pick Locator` tool.

<image>playwright-vscode-plugin-pick-locator-tool.png</image>

**Step 2: Visit the site where we want to find the selectors**

In the locator tool, go to the url [localhost:3000](http://localhost:3000). This opens the login page of granite.

**Step 3: Use the tool to find the best selector**

 On the login page hover on the various elements to find the accurate selectors for each of them.

<image>playwright-selector-login-screen.png</image>

## Find selectors using the browser DevTools `Inspect` tool

In case the Playwright plugin cannot be used, we can use the browser devtools to find the element.

**Step 1: Open the site in a browser**

Open a new browser tab and visit [localhost:3000](http://localhost:3000). This opens the login page to granite.

**Step 2: Open the DevTools window**

Right click on the element and choose the `Inspect element` option. On the DevTools inspect window find the tag of the element we want the selector for.

**Step 3: Use the labels to find the best selector**

In the tag for the element, find the best label available for using as a selector.

<image>playwright-find-selector-using-devtools.png</image>

## Figuring out the steps to be done for the test

Now that we know how to find the selectors, we should figure out the steps we should perform in order to login. For this page, it would be as follows.

1. Enter the email
2. Enter the password
3. Click on the `Login` button
4. Confirm the username in navbar
5. Confirm the `LogOut` button in navbar

## Writing the tests

Now that we have the steps figured out let's write the tests.

```ts
// login.spec.ts

import { test, expect } from "@playwright/test";

test.describe("Login page", () => {
  test("should login with the correct credentials", async ({ page }) => {
    await page.goto("http://localhost:3000");
    await page.getByTestId("login-email-field").fill("oliver@example.com");
    await page.getByTestId("login-password-field").fill("welcome");
    await page.getByTestId("login-submit-button").click();
    await expect(page.getByTestId("navbar-username-label")).toBeVisible();
    await expect(page.getByTestId("navbar-logout-link")).toBeVisible();
  });
});
```

In this test we have used two `action` methods.

1. `locator.fill()`: Focuses the element and triggers an input event with the entered text.
2. `locator.click()`: Triggers a mouse left click on the element.

Playwright provides an assortment of actions for the most commonly used user events. The detailed explanation for each action can be found [here](https://playwright.dev/docs/input).

We are also doing an assertion here. The `toBeVisible` assertion makes sure that the element is present on the dom and is visible to the user after the styles have been applied. There are a lot of assertions that can be used in different scenarios which can be found [here](https://playwright.dev/docs/test-assertions).

Now that we have written the tests lets execute them by the following command.

```bash
yarn playwright test --headed login.spec.ts
```
Great! All tests should be passing. Now let's commit the code.

```bash
git add -A
git commit -m "Added tests for login"
```