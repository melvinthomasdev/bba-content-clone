We still have a few more tests to write in the tasks page. Let's write them now.

## Delete a task

Here we need to:

1. Add a new task
2. Verify that the task was created in the `Pending tasks` table
3. Mark the task as completed
4. Verify that the task was added in the `Completed tasks` table
5. Click on the delete icon
6. Verify that the task is removed from both tables

Here we can see that all the steps until step 4 are the same as those in the test `should be able to mark a task as completed`. So let's extract that logic into a POM.

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

  markTaskAsCompletedAndVerify = async ({ taskName }: { taskName: string }) => {
    await this.page
      .getByTestId("tasks-pending-table")
      .getByRole("row", { name: taskName })
      .getByRole("checkbox")
      .click();
    const completedTaskInDashboard = this.page
      .getByTestId("tasks-completed-table")
      .getByRole("row", { name: taskName });
    await completedTaskInDashboard.scrollIntoViewIfNeeded();
    await expect(completedTaskInDashboard).toBeVisible();
  };
}
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
    await taskPage.markTaskAsCompletedAndVerify({ taskName });
  });
});
```

Let's add the tests for deleting a task now.

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
    await taskPage.markTaskAsCompletedAndVerify({ taskName });
  });

  test("should be able to delete a completed task", async ({
    page,
    taskPage,
  }) => {
    await page.goto("/");
    await taskPage.createTaskAndVerify({ taskName });
    await taskPage.markTaskAsCompletedAndVerify({ taskName });
    const completedTaskInDashboard = page
      .getByTestId("tasks-completed-table")
      .getByRole("row", { name: taskName });

    await completedTaskInDashboard
      .getByTestId("completed-task-delete-link")
      .click();

    await expect(completedTaskInDashboard).toBeHidden();
    await expect(
      page
        .getByTestId("tasks-pending-table")
        .getByRole("row", { name: taskName })
    ).toBeHidden();
  });
});
```

Let's execute the tests.

```bash
yarn playwright test --headed
```

All the tests should be passing.

## Adding tests for starring and un-starring

We can add the tests for starring and un-starring a task now.

For starring the a task:

1. Add a new task
2. Click the star icon
3. Star icon should be highlighted
4. The starred task should come up on top of the pending tasks

For un-starring a task:

1. Add a new task
2. Star the task
3. Click on the star icon again
4. Star icon should not be highlighted

Note that we are using this the same steps for starring the tasks in un-starring the task, so we can extract it to the POM. We should be able to understand when to extract a logic to a POM and when to write the tests in the spec file from these examples.

```ts
// poms/tasks.ts

import { Page, expect } from "@playwright/test";

interface TaskName {
  taskName: string;
}

export class TaskPage {
  page: Page;

  constructor(page: Page) {
    this.page = page;
  }

  createTaskAndVerify = async ({ taskName }: TaskName) => {
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

  markTaskAsCompletedAndVerify = async ({ taskName }: TaskName) => {
    await this.page
      .getByTestId("tasks-pending-table")
      .getByRole("row", { name: taskName })
      .getByRole("checkbox")
      .click();
    const completedTaskInDashboard = this.page
      .getByTestId("tasks-completed-table")
      .getByRole("row", { name: taskName });
    await completedTaskInDashboard.scrollIntoViewIfNeeded();
    await expect(completedTaskInDashboard).toBeVisible();
  };

  starTaskAndVerify = async ({ taskName }: TaskName) => {
    const starIcon = this.page
      .getByTestId("tasks-pending-table")
      .getByRole("row", { name: taskName })
      .getByTestId("pending-task-star-or-unstar-link");
    await starIcon.click();
    await expect(starIcon).toHaveClass(/ri-star-fill/i);
    await expect(
      this.page.getByTestId("tasks-pending-table").getByRole("row").nth(1)
    ).toContainText(taskName);
  };
}
```

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
    await taskPage.markTaskAsCompletedAndVerify({ taskName });
  });

  test("should be able to delete a completed task", async ({
    page,
    taskPage,
  }) => {
    await page.goto("/");
    await taskPage.createTaskAndVerify({ taskName });
    await taskPage.markTaskAsCompletedAndVerify({ taskName });
    const completedTaskInDashboard = page
      .getByTestId("tasks-completed-table")
      .getByRole("row", { name: taskName });

    await completedTaskInDashboard
      .getByTestId("completed-task-delete-link")
      .click();

    await expect(completedTaskInDashboard).toBeHidden();
    await expect(
      page
        .getByTestId("tasks-pending-table")
        .getByRole("row", { name: taskName })
    ).toBeHidden();
  });

  test("should be able to star a pending task", async ({ page, taskPage }) => {
    page.goto("/");
    await taskPage.createTaskAndVerify({ taskName });
    await taskPage.starTaskAndVerify({ taskName });
  });

  test("should be able to un-star a pending task", async ({
    page,
    taskPage,
  }) => {
    page.goto("/");
    await taskPage.createTaskAndVerify({ taskName });
    await taskPage.starTaskAndVerify({ taskName });
    const starIcon = page
      .getByTestId("tasks-pending-table")
      .getByRole("row", { name: taskName })
      .getByTestId("pending-task-star-or-unstar-link");
    await starIcon.click();
    await expect(starIcon).toHaveClass(/ri-star-line/);
  });
});
```

Let's execute the tests now.

```bash
yarn playwright test --headed
```

Now we might see an issue. The tests dealing with starring tasks might fail in some runs and pass in others. Such a test is termed a `flaky test`. Let's see what is causing the test to fail.

## Debugging flakiness

The error is thrown at `poms/tasks.ts:59` which is

```ts
await expect(
  this.page.getByTestId("tasks-pending-table").getByRole("row").nth(1)
).toContainText(taskName);
```

We are checking that the first element in the table is the starred element which is a valid test case. What is causing the test to fail is because of the parallelism which is enabled by default in Playwright. We have two tests dealing with the starring of tasks. When both of them are executed in parallel, there can occur a race condition which puts the starred task in another test on top. It is not recommended to run all the tests serially, even though it can solve this issue.

The best way to solve this would be to group the two inter-dependent tests into another describe block and configure that describe block to run tests in serial.

```ts
// tasks.spec.ts

import { test } from "../fixtures";
import { expect } from "@playwright/test";
import { faker } from "@faker-js/faker";
import LoginPage from "../poms/login";

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
    await taskPage.markTaskAsCompletedAndVerify({ taskName });
  });

  test("should be able to delete a completed task", async ({
    page,
    taskPage,
  }) => {
    await page.goto("/");
    await taskPage.createTaskAndVerify({ taskName });
    await taskPage.markTaskAsCompletedAndVerify({ taskName });
    const completedTaskInDashboard = page
      .getByTestId("tasks-completed-table")
      .getByRole("row", { name: taskName });

    await completedTaskInDashboard
      .getByTestId("completed-task-delete-link")
      .click();

    await expect(completedTaskInDashboard).toBeHidden();
    await expect(
      page
        .getByTestId("tasks-pending-table")
        .getByRole("row", { name: taskName })
    ).toBeHidden();
  });

  test.describe("Starring tasks feature", () => {
    test.describe.configure({ mode: "serial" });

    test("should be able to star a pending task", async ({
      page,
      taskPage,
    }) => {
      page.goto("/");
      await taskPage.createTaskAndVerify({ taskName });
      await taskPage.starTaskAndVerify({ taskName });
    });

    test("should be able to un-star a pending task", async ({
      page,
      taskPage,
    }) => {
      page.goto("/");
      await taskPage.createTaskAndVerify({ taskName });
      await taskPage.starTaskAndVerify({ taskName });
      const starIcon = page
        .getByTestId("tasks-pending-table")
        .getByRole("row", { name: taskName })
        .getByTestId("pending-task-star-or-unstar-link");
      await starIcon.click();
      await expect(starIcon).toHaveClass(/ri-star-line/);
    });
  });
});
```

In this enhancement, we grouped the tests for starring the tests into a single named describe block and configured them to run serially so that the race condition is avoided. This approach is more optimized because we're not losing the speed provided by parallelism in all the tests just to avoid a race condition in a few tests.

Let's re-run the tests.

```bash
yarn playwright test --headed
```

Now we can observe that the tests dealing with starring a task is executing one after the other. All the tests are passing as well.

## Adding tests which verify multiple users - Multi-page tests

Now let's dive into some of the unique features Playwright provides us. For testing the feature where we assign a task to a different user, we need to:

1. Verify that the task is visible under the `Pending Tasks` section to the current user as the creator
2. Verify that the task is visible to the assigned user under the `Pending Tasks` section as the assignee

Here we are dealing with two different dashboards. We can only test the dashboard for a different user if we logout and login again. How do we avoid that? In a normal browser, the most sensible way would be to open a new Incognito or In-Private window and login there as a new user.

We can do the same in Playwright by initializing a new browser and a page context. Before we move on with our implementation, we have to make a minor change to the `createTaskAndVerify` POM method for tasks. Currently we have hardcoded the assignee as `Oliver Smith`. We need to make a change to that so that the method assigns any user we pass in.

```ts
// poms/tasks.ts

import { Page, expect } from "@playwright/test";

interface TaskName {
  taskName: string;
}

interface CreateNewTaskProps extends TaskName {
  userName?: string;
}

export class TaskPage {
  page: Page;

  constructor(page: Page) {
    this.page = page;
  }

  createTaskAndVerify = async ({
    taskName,
    userName = "Oliver Smith",
  }: CreateNewTaskProps) => {
    await this.page.getByTestId("navbar-add-todo-link").click();
    await this.page.getByTestId("form-title-field").fill(taskName);

    await this.page.locator(".css-2b097c-container").click();
    await this.page.locator(".css-26l3qy-menu").getByText(userName).click();
    await this.page.getByTestId("form-submit-button").click();
    const taskInDashboard = this.page
      .getByTestId("tasks-pending-table")
      .getByRole("row", {
        name: new RegExp(taskName, "i"),
      });
    await taskInDashboard.scrollIntoViewIfNeeded();
    await expect(taskInDashboard).toBeVisible();
  };

  markTaskAsCompletedAndVerify = async ({ taskName }: TaskName) => {
    await this.page
      .getByTestId("tasks-pending-table")
      .getByRole("row", { name: taskName })
      .getByRole("checkbox")
      .click();
    const completedTaskInDashboard = this.page
      .getByTestId("tasks-completed-table")
      .getByRole("row", { name: taskName });
    await completedTaskInDashboard.scrollIntoViewIfNeeded();
    await expect(completedTaskInDashboard).toBeVisible();
  };

  starTaskAndVerify = async ({ taskName }: TaskName) => {
    const starIcon = this.page
      .getByTestId("tasks-pending-table")
      .getByRole("row", { name: taskName })
      .getByTestId("pending-task-star-or-unstar-link");
    await starIcon.click();
    await expect(starIcon).toHaveClass(/ri-star-fill/i);
    await expect(
      this.page.getByTestId("tasks-pending-table").getByRole("row").nth(1)
    ).toContainText(taskName);
  };
}
```

Now let's write the test for dealing with multiple user logins.

```ts
// tasks.spec.ts

import { test } from "../fixtures";
import { expect } from "@playwright/test";
import { faker } from "@faker-js/faker";
import LoginPage from "../poms/login";

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
    await taskPage.markTaskAsCompletedAndVerify({ taskName });
  });

  test("should be able to delete a completed task", async ({
    page,
    taskPage,
  }) => {
    await page.goto("/");
    await taskPage.createTaskAndVerify({ taskName });
    await taskPage.markTaskAsCompletedAndVerify({ taskName });
    const completedTaskInDashboard = page
      .getByTestId("tasks-completed-table")
      .getByRole("row", { name: taskName });

    await completedTaskInDashboard
      .getByTestId("completed-task-delete-link")
      .click();

    await expect(completedTaskInDashboard).toBeHidden();
    await expect(
      page
        .getByTestId("tasks-pending-table")
        .getByRole("row", { name: taskName })
    ).toBeHidden();
  });

  test.describe("Starring tasks feature", () => {
    test.describe.configure({ mode: "serial" });

    test("should be able to star a pending task", async ({
      page,
      taskPage,
    }) => {
      page.goto("/");
      await taskPage.createTaskAndVerify({ taskName });
      await taskPage.starTaskAndVerify({ taskName });
    });

    test("should be able to un-star a pending task", async ({
      page,
      taskPage,
    }) => {
      page.goto("/");
      await taskPage.createTaskAndVerify({ taskName });
      await taskPage.starTaskAndVerify({ taskName });
      const starIcon = page
        .getByTestId("tasks-pending-table")
        .getByRole("row", { name: taskName })
        .getByTestId("pending-task-star-or-unstar-link");
      await starIcon.click();
      await expect(starIcon).toHaveClass(/ri-star-line/);
    });
  });

  test("should create a new task with a different user as the assignee", async ({
    page,
    browser,
    taskPage,
  }) => {
    await page.goto("/");
    await taskPage.createTaskAndVerify({ taskName, userName: "Sam Smith" });

    // Creating a new browser context and a page in the browser without restoring the session
    const newUserContext = await browser.newContext({
      storageState: { cookies: [], origins: [] },
    });
    const newUserPage = await newUserContext.newPage();

    // Initializing the login POM here because the fixture is configured to use the default page context
    const loginPage = new LoginPage(newUserPage);

    await newUserPage.goto("/");
    await loginPage.loginAndVerifyUser({
      email: "sam@example.com",
      password: "welcome",
      username: "Sam Smith",
    });
    await expect(
      newUserPage
        .getByTestId("tasks-pending-table")
        .getByRole("row", { name: taskName })
    ).toBeVisible();

    await newUserPage.close();
    await newUserContext.close();
  });
});
```

In the above code, we have added in a new test `should create a new task with a different user as the assignee` which deals with the logic to sign in as multiple users. Here apart from the default page fixture we get from the test, we also initialize a new browser context and page for logging in as a separate user. Note that we have passed in an empty `storageState` into the browser context. This is because we have configured this test group with a global `storageState` in the `playwright.config.ts` file (Refer section: [Adding tests for tasks and global setup](https://courses.bigbinaryacademy.com/learn-qa-automation-using-playwright/adding-tests-for-tasks-and-global-setup/#adding-a)).

This configures Playwright to restore the `storageState` in all the tests under the group whenever a new browser context is defined. So we have to manually define an empty `storageState` to prevent our application from being logged in before our tests begin in a new page. An empty storageState means:

1. Empty cookies
2. Empty origins. This also empties the local storage.

Let's run these tests now.

```bash
yarn playwright test --headed
```

Great! All tests are passing. Let's commit these changes now.

```bash
git add -A
git commit -m "Added all tests for tasks and multi tab test for role based test"
```
