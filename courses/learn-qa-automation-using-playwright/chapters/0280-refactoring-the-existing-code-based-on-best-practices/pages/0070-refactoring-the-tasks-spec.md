In this spec, we can observe the following improvements that can be made:

1. Move hard-coded selectors to constants
2. Move hard-coded texts to constants
3. Move hard-coded credentials to environment variables
4. Use proper step blocks

Let's refactor the spec based on these best practices.

```ts
// e2e/constants/texts/common.ts

export const COMMON_TEXTS = {
  defaultUserName: "Oliver Smith",
  standardUserName: "Sam Smith",
  skipSetup: "[SKIP_SETUP]",
};
```

```ts
// e2e/constants/selectors/dashboard.ts
export const NAVBAR_SELECTORS = {
  usernameLabel: "navbar-username-label",
  logoutButton: "navbar-logout-link",
  addTodoButton: "navbar-add-todo-link",
};

export const TASKS_TABLE_SELECTORS = {
  pendingTasksTable: "tasks-pending-table",
  completedTasksTable: "tasks-completed-table",
  starUnstarButton: "pending-task-star-or-unstar-link",
  deleteTaskButton: "completed-task-delete-link",
};
```

```
# e2e/config/.env

ADMIN_EMAIL=oliver@example.com
ADMIN_PASSWORD=welcome
STANDARD_EMAIL=sam@example.com
STANDARD_PASSWORD=welcome

```

```ts
// e2e/tests/tasks.spec.ts

import { test } from "../fixtures";
import { expect } from "@playwright/test";
import { faker } from "@faker-js/faker";
import LoginPage from "../poms/login";
import { TASKS_TABLE_SELECTORS } from "../constants/selectors";
import { COMMON_TEXTS, DASHBOARD_TEXTS } from "../constants/texts";

test.describe("Tasks page", () => {
  let taskName: string;

  test.beforeEach(async ({ page, taskPage }, testInfo) => {
    taskName = faker.word.words({ count: 5 });

    if (testInfo.title.includes(COMMON_TEXTS.skipSetup)) return;

    await test.step("Step 1: Go to dashboard", () => page.goto("/"));
    await test.step("Step 2: Create new task", () =>
      taskPage.createTaskAndVerify({ taskName })
    );
  });

  test.afterEach(async ({ page, taskPage }) => {
    const completedTaskInDashboard = page
      .getByTestId(TASKS_TABLE_SELECTORS.completedTasksTable)
      .getByRole("row", { name: taskName });

    await test.step("Go to dashboard", () => page.goto("/"));
    await test.step("Mark task as completed", () =>
      taskPage.markTaskAsCompletedAndVerify({ taskName })
    );

    await test.step("Delete completed task", () =>
      completedTaskInDashboard
        .getByTestId(TASKS_TABLE_SELECTORS.deleteTaskButton)
        .click()
    );

    await test.step(
      "Assert deleted task has been removed from the dashboard",
      async () => {
        await expect(completedTaskInDashboard).toBeHidden();
        await expect(
          page
            .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
            .getByRole("row", { name: taskName })
        ).toBeHidden();
      }
    );
  });

  test("should be able to mark a task as completed", async ({ taskPage }) => {
    await test.step("Step 3: Mark task as completed and verify", () =>
      taskPage.markTaskAsCompletedAndVerify({ taskName })
    );
  });

  test("should be able to un-star a pending task", async ({
    page,
    taskPage,
  }) => {
    await test.step("Step 3: Star task and verify", () =>
      taskPage.starTaskAndVerify({ taskName })
    );

    await test.step("Step 4: Unstar task and verify", async () => {
      const starIcon = page
        .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
        .getByRole("row", { name: taskName })
        .getByTestId(TASKS_TABLE_SELECTORS.starUnstarButton);

      await starIcon.click();
      await expect(starIcon).toHaveClass(DASHBOARD_TEXTS.starredTaskClass);
    });
  });

  test(`should create a new task with a different user as the assignee ${COMMON_TEXTS.skipSetup}`, async ({
    page,
    browser,
    taskPage,
  }) => {
    await test.step("Step 1: Go to dashboard", () => page.goto("/"));
    await test.step("Step 2: Create task for standard user and verify", () =>
      taskPage.createTaskAndVerify({
        taskName,
        userName: COMMON_TEXTS.standardUserName,
      })
    );

    // Creating a new browser context and a page in the browser without restoring the session
    const newUserContext = await browser.newContext({
      storageState: { cookies: [], origins: [] },
    });
    const newUserPage = await newUserContext.newPage();

    // Initializing the login POM here because the fixture is configured to use the default page context
    const loginPage = new LoginPage(newUserPage);

    await test.step("Step 3: Visit login page as standard user", () =>
      newUserPage.goto("/")
    );

    await test.step("Step 4: Login as standard user", () =>
      loginPage.loginAndVerifyUser({
        email: process.env.STANDARD_EMAIL!,
        password: process.env.STANDARD_PASSWORD!,
        username: COMMON_TEXTS.standardUserName,
      })
    );

    await test.step(
      "Step 5: Assert assigned task to be visible for the standard user",
      () =>
        expect(
          newUserPage
            .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
            .getByRole("row", { name: taskName })
        ).toBeVisible()
    );

    await newUserPage.close();
    await newUserContext.close();
  });
});
```

In the code above we did one additional refactoring. In the nested
describe block for the `"Starring tasks feature"` tests, we removed the
test for verifying the starring feature. This is because starring a task
is a part of the unstarring task test which makes it redundant to have a
dedicated test just for that feature. This additionally allows us to
remove the serial configuration and the describe block since there is
only a single test coming under the suite.

