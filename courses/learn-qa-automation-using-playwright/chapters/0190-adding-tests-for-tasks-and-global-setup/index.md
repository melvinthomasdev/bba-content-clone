## Adding tests for the tasks page

Let's continue with our project and add the tests for the tasks page. In the tasks page we need to add the tests for the following operations.

1. Create a new task assigned to the same user
   - Verify that the task is visible under the `Pending Tasks` section to the current user in the dashboard
2. Mark a task as completed
   - Verify that the task falls under the `Completed Tasks` section in the dashboard
3. Delete a task
   - Verify that the task is no longer visible in the dashboard for both the creator and the assignee
4. Create a new task assigned to a different user
   - Verify that the task is visible under the `Pending Tasks` section to the current user as the creator
   - Verify that the task is visible to the assigned user under the `Pending Tasks` section as the assignee
5. Starring a task
   - Verify that the task is moved to the top of the table
   - Verify that the star sign is highlighted
6. Un-starring a task
   - Verify that the star sign is no longer highlighted.

We have six tests that fall under the same suite. Let's write the tests for the first operation.

Create a new file for the tasks tests and POM.

```bash
touch e2e/tests/tasks.spec.ts
touch e2e/poms/tasks.ts
```

Now we can write the tests to verify the `create new task` action.

```ts
// tasks.spec.ts

import { test } from "../fixtures";
import { expect } from "@playwright/test";
import { faker } from "@faker-js/faker";

test.describe("Tasks page", () => {
  let taskName: string;

  test.beforeEach(() => {
    taskName = faker.word.words({ count: 5 });
  });

  test("should create a new task with creator as the assignee", async ({
    loginPage,
    page,
  }) => {
    await page.goto("http://localhost:3000");
    await loginPage.loginAndVerifyUser({
      email: "oliver@example.com",
      password: "welcome",
      username: "Oliver Smith",
    });

    await page.getByTestId("navbar-add-todo-link").click();
    await page.getByTestId("form-title-field").fill(taskName);

    await page.locator(".css-2b097c-container").click();
    await page.locator(".css-26l3qy-menu").getByText("Oliver Smith").click();
    await page.getByTestId("form-submit-button").click();
    const taskInDashboard = page
      .getByTestId("tasks-pending-table")
      .getByRole("row", {
        name: new RegExp(taskName, "i"),
      });
    await taskInDashboard.scrollIntoViewIfNeeded();
    await expect(taskInDashboard).toBeVisible();
  });
});
```

As creating a new task is a process that we need in multiple scenarios, we can extract it into a POM method. So the test and POM will look like this.

```ts
// poms/tasks.ts

import { Page, expect } from "@playwright/test";

export class TaskPage {
  page: Page;

  constructor(page: Page) {
    this.page = page;
  }

  createTaskAndVerify = async ({ taskName }: { taskName: string }) => {
    await this.page.getByTestId("navbar-add-todo-link").click();
    await this.page.getByTestId("form-title-field").fill(taskName);

    await this.page.locator(".css-2b097c-container").click();
    await this.page
      .locator(".css-26l3qy-menu")
      .getByText("Oliver Smith")
      .click();
    await this.page.getByTestId("form-submit-button").click();
    const taskInDashboard = this.page
      .getByTestId("tasks-pending-table")
      .getByRole("row", {
        name: new RegExp(taskName, "i"),
      });
    await taskInDashboard.scrollIntoViewIfNeeded();
    await expect(taskInDashboard).toBeVisible();
  };
}
```

```ts
// fixtures/index.ts

import { test as base } from "@playwright/test";
import LoginPage from "../poms/login";
import { TaskPage } from "../poms/tasks";

interface ExtendedFixtures {
  loginPage: LoginPage;
  taskPage: TaskPage;
}

export const test = base.extend<ExtendedFixtures>({
  loginPage: async ({ page }, use) => {
    const loginPage = new LoginPage(page);
    await use(loginPage);
  },
  taskPage: async ({ page }, use) => {
    const taskPage = new TaskPage(page);
    await use(taskPage);
  },
});
```

```ts
// tasks.spec.ts

import { test } from "../fixtures";
import { faker } from "@faker-js/faker";

test.describe("Tasks page", () => {
  let taskName: string;

  test.beforeEach(() => {
    taskName = faker.word.words({ count: 5 });
  });

  test("should create a new task with creator as the assignee", async ({
    page,
    loginPage,
    taskPage,
  }) => {
    await page.goto("http://localhost:3000");
    await loginPage.loginAndVerifyUser({
      email: "oliver@example.com",
      password: "welcome",
      username: "Oliver Smith",
    });
    await taskPage.createTaskAndVerify({ taskName });
  });
});
```

## The need for a global setup

Let's add the next test case now. We'll add the tests for marking a task as completed.

```ts
// tasks.spec.ts

import { test } from "../fixtures";
import { expect } from "@playwright/test";
import { faker } from "@faker-js/faker";

test.describe("Tasks page", () => {
  let taskName: string;

  test.beforeEach(() => {
    taskName = faker.word.words({ count: 5 });
  });

  test("should create a new task with creator as the assignee", async ({
    page,
    loginPage,
    taskPage,
  }) => {
    await page.goto("http://localhost:3000");
    await loginPage.loginAndVerifyUser({
      email: "oliver@example.com",
      password: "welcome",
      username: "Oliver Smith",
    });
    await taskPage.createTaskAndVerify({ taskName });
  });

  test("should be able to mark a task as completed", async ({
    page,
    loginPage,
    taskPage,
  }) => {
    await page.goto("http://localhost:3000");
    await loginPage.loginAndVerifyUser({
      email: "oliver@example.com",
      password: "welcome",
      username: "Oliver Smith",
    });
    await taskPage.createTaskAndVerify({ taskName });
    await page
      .getByTestId("tasks-pending-table")
      .getByRole("row", { name: taskName })
      .getByRole("checkbox")
      .click();
    const completedTaskInDashboard = page
      .getByTestId("tasks-completed-table")
      .getByRole("row", { name: taskName });
    await completedTaskInDashboard.scrollIntoViewIfNeeded();
    await expect(completedTaskInDashboard).toBeVisible();
  });
});
```

Now, if we look at the code, we are repeating the login step at the beginning of each test. Since DRY methodology prevents us from doing so, we can extract this to the `beforeEach` block. But all the tests except the login and register tests will want the login action to be performed before executing the rest of the tests. What will we do in that case? Repeating the login process in the `beforeEach` block before each test is also against the DRY convention. This is where global setup and teardown comes into play.

With the global setup, we can have the login test to be a dependency which executes before each test without having to specify them repeatedly. Global teardown helps us to do some cleanup functions after all the tests have been executed.

## Configuring global setup for the login action

To configure the login action using global setup, we need to group our tests based on the need for login and and add the login spec as a dependency before executing each of them. Let's see what changes we need to make to the configuration file to execute the login test before the dependent tests.

```ts
// playwright.config.ts

import { defineConfig, devices } from "@playwright/test";

export default defineConfig({
  testDir: "./e2e",
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: "html",
  use: {
    trace: "on-first-retry",
    baseURL: "http://localhost:3000",
  },

  projects: [
    {
      name: "login",
      use: { ...devices["Desktop Chrome"] },
      testMatch: "**/login.spec.ts",
    },
    {
      name: "Logged In tests",
      use: { ...devices["Desktop Chrome"] },
      dependencies: ["login"],
      testMatch: "**/*.spec.ts",
      testIgnore: "**/register.spec.ts",
    },
    {
      name: "Logged out tests",
      use: { ...devices["Desktop Chrome"] },
      testMatch: "**/register.spec.ts",
    },
  ],
});
```

Here's, what we have added in the configuration.

1. A `baseURL` so that we don't have to type in the full URL each time we use the `page.goto()` command.
2. A new project for the login spec.
3. A new project for all the specs except the register spec and named it `Logged in tests` and added the login project as a dependency.
4. A new project for the register spec and named it `Logged out tests`.

What it does is that it makes sure that the dependent login spec runs before all the other specs are executed. Now let's remove the login steps from the `Logged in tests group`.

```ts
// tasks.spec.ts

import { test } from "../fixtures";
import { expect } from "@playwright/test";
import { faker } from "@faker-js/faker";

test.describe("Tasks page", () => {
  let taskName: string;

  test.beforeEach(() => {
    taskName = faker.word.words({ count: 5 });
  });

  test("should create a new task with creator as the assignee", async ({
    page,
    taskPage,
  }) => {
    await page.goto("/");
    await taskPage.createTaskAndVerify({ taskName });
  });

  test("should be able to mark a task as completed", async ({
    page,
    taskPage,
  }) => {
    await page.goto("/");
    await taskPage.createTaskAndVerify({ taskName });
    await page
      .getByTestId("tasks-pending-table")
      .getByRole("row", { name: taskName })
      .getByRole("checkbox")
      .click();
    const completedTaskInDashboard = page
      .getByTestId("tasks-completed-table")
      .getByRole("row", { name: taskName });
    await completedTaskInDashboard.scrollIntoViewIfNeeded();
    await expect(completedTaskInDashboard).toBeVisible();
  });
});
```

We see that we have added in a `page.goto("/")` command instead of the login steps. This is necessary because each test in Playwright runs in its own page context(similar to a new tab on a browser). This means that each test doesn't know at which page, the previous test ended. The `page.goto("/")` command makes the page visit the baseURL at the beginning of the test. Note that we cannot extract this logic to a `beforeEach` block either since the `beforeEach` block also has different page context from the tests.

Now let's execute these tests.

```bash
yarn playwright test --headed
```

We can observe that the login spec executed before the execution of the tasks spec. But all the tests except the login and register spec are failing, stuck at the login page. If the login spec was executed before the tests, why wasn't the user logged in before tasks specs?

## Adding a `storageState`

The reason why the dependent tests were not logged in even though the login spec was executed before them, is again because of the exclusive page contexts per test. The user logged in during the login spec but that context is not available for the rest of the specs. So we need to find a way to share the context between specs. This is where we can use the `storageState` method provided by Playwright.

`storageState` saves the current session details from a page into a file. We can then use this stored details to restore the session before each test so that we can avoid logging in each time. For this, let's define the path where we want to save the storage state and configure it in our Playwright configuration.

Before doing this though, we will rename our `login.spec.ts` file into `login.setup.ts` because of two reason.

1. Semantic reason: We're no longer just testing the application using the login spec, we're also setting up the base for all the tests that come after that.
2. Technical reason: We have add the global pattern of `**/*.spec.ts` to our `Logged in tests` group and we should rename the login spec to exclude it from this group.

```bash
mv ./e2e/tests/login.spec.ts ./e2e/tests/login.setup.ts
```

Now we can add the `storageState` to our Playwright configuration

```ts
// playwright.config.ts

import { defineConfig, devices } from "@playwright/test";

export const STORAGE_STATE = "./auth/session.json";

export default defineConfig({
  testDir: "./e2e",
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: "html",
  use: {
    trace: "on-first-retry",
    baseURL: "http://localhost:3000",
  },

  projects: [
    {
      name: "login",
      use: { ...devices["Desktop Chrome"] },
      testMatch: "**/login.setup.ts", // Notice the updated spec name
    },
    {
      name: "Logged In tests",
      use: { ...devices["Desktop Chrome"], storageState: STORAGE_STATE },
      dependencies: ["login"],
      testMatch: "**/*.spec.ts",
      testIgnore: "**/register.spec.ts",
    },
    {
      name: "Logged out tests",
      use: { ...devices["Desktop Chrome"] },
      testMatch: "**/register.spec.ts",
    },
  ],
});
```

Now let's add the steps to save the session details into the `storageState` in the `login.setup.ts` file.

```ts
// login.setup.ts

import { STORAGE_STATE } from "../../playwright.config";
import { test } from "../fixtures";

test.describe("Login page", () => {
  test("should login with the correct credentials", async ({
    page,
    loginPage,
  }) => {
    await page.goto("http://localhost:3000");
    await loginPage.loginAndVerifyUser({
      email: "oliver@example.com",
      password: "welcome",
      username: "Oliver Smith",
    });
    await page.context().storageState({ path: STORAGE_STATE });
  });
});
```

We can now execute the tests again.

```bash
yarn playwright test --headed
```

All the dependent tests should be logged in before they start executing leading all the tests to pass.

## Global teardown

We saw how global setup can help set some common things up before the execution of tests. The global teardown can help us perform cleanup tasks such as clearing temporary data, deleting unwanted files generated when running the tests and much more.

In our project we can see that a new file called `auth/session.json` is generated after each test, which is unwanted. Let's create a global teardown method to delete this file after the tests have completed execution.

For this we need to create a new file called `global.teardown.ts`.

```bash
touch e2e/tests/global.teardown.ts
```

```ts
// global.teardown.ts

import { test } from "@playwright/test";
import { STORAGE_STATE } from "../../playwright.config";
import * as fs from "fs";

test("Teardown", () => {
  fs.unlink(STORAGE_STATE, error => {
    if (!error) return;
    console.log(error);
  });
});
```

Let's also make the corresponding changes in the configuration file.

```ts
// playwright.config.ts

import { defineConfig, devices } from "@playwright/test";

export const STORAGE_STATE = "./auth/session.json";

export default defineConfig({
  testDir: "./e2e",
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: "html",
  use: {
    trace: "on-first-retry",
    baseURL: "http://localhost:3000",
  },

  projects: [
    {
      name: "login",
      use: { ...devices["Desktop Chrome"] },
      testMatch: "**/login.setup.ts",
    },
    {
      name: "teardown",
      use: { ...devices["Desktop Chrome"] },
      testMatch: "**/global.teardown.ts",
    },
    {
      name: "Logged In tests",
      use: { ...devices["Desktop Chrome"], storageState: STORAGE_STATE },
      dependencies: ["login"],
      teardown: "teardown",
      testMatch: "**/*.spec.ts",
      testIgnore: "**/register.spec.ts",
    },
    {
      name: "Logged out tests",
      use: { ...devices["Desktop Chrome"] },
      testMatch: "**/register.spec.ts",
    },
  ],
});
```

Here we have added a new group called `teardown` which includes the global teardown which we just created. We have also added in the `teardown` project as a teardown in our `Logged in tests` which will execute the teardown method only at the end of execution of all the specs under the `Logged in tests` project.

Let's run the tests again.

```bash
yarn playwright test --headed
```

All the tests should be passing and additionally, the `user/session.json` file should be deleted after all the tests were executed.

Before we commit the changes, let's add the newly created `auth` directory into `.gitignore` file so that the changes made in the directory are not committed.

```
# .gitignore

node_modules/
/test-results/
/playwright-report/
/blob-report/
/playwright/.cache/
/auth
```

To summarize, if we have a common task we need to execute before the tests, like logging into the application, we can use the global setup using dependencies to execute the specs in order. But just executing a test doesn't mean that the subsequent tests will be logged in because of the exclusive page contexts in Playwright. To restore the session we received during login in all the subsequent tests, we need to use the `storageState` functionality, which saves the session details into a file for it to be restored in the upcoming tests.

We will add the tests for the rest of the the scenarios in the tasks page in the upcoming chapters.

Let's commit these changes.

```bash
git add -A
git commit -m "Added tests for task creation and completion and added global setup and teardown for login"
```
