## Importance of cleanup after tests

So far in our book we have written a lot of tests and learned a lot of concepts.
To understand the concepts and fix the mistakes, we have run the tests several
times. At this point of time, if we look at our dashboard, it will be cluttered
with tasks similar to this screenshot.

<image alt="Cluttered tasks dashboard due to lack of cleanup">
  playwright-project-cluttered-dashboard.png
</image>

This is one of the major reasons why proper cleanup is required after each test. Some other
reasons include:

1. **Preventing flakiness**: The outcome of a test execution is heavily dependent
   on the data which is present on the screen. Let's take a simple test scenario which
   makes sure that the dashboard contains no data at the beginning of the test. If we
   do not add in the proper measures to cleanup the data which we created during the tests,
   then the dashboard won't be empty at the beginning of the next run. It will contain the
   artifacts from the previous runs. This can cause the test to pass sometime and fail on others.
   Another scenario which can be affected by improper cleanup is the data creation. Even though it
   is recommended that we use randomized data for creating entities during test-runs, it
   is still possible that the multiple runs may contain the same data. If this scenario does occur
   and the artifacts from the previous runs were not properly cleaned up, the tests can fail due to
   unique constraints on the data.

2. **Improving resistance to failure on parallel runs**: This reason is very similar to the previous
   one but how it affects us is in a different way. Each test should be independent and able to run in
   isolation. Proper cleanup ensures that each test starts with a clean state, free from any side-effects
   or artifacts left by previous tests. Improper cleanup can lead to tests affecting each other leading to
   failure of test-cases due to no fault in the application. While this may seem like a very easy trade-off
   for additional test logic that needs to be added in for the cleanup, the impact of debugging such failures
   can be very expensive as the project grows in size since identifying whether a test-case failed due to a
   fault in the test or a bug in the application is a time and resource intensive process.

3. **False positives**: While the previous two points were on false negatives, meaning test-cases failing
   due to no fault in the application, there are chances for false positives as well which can be even more
   dangerous. Consider that a feature requires an entity to be created for proper working. We might have
   added a `beforeEach` block which would create this entity. But consider that a bug in the application
   led to the entity not being created. If the entity created in the previous run was carried over as a
   test artifact to the current run, the test might pass without any issues which gives the developer a false
   sense of security. This can lead to the bug being introduced in the production where a client might
   encounter it which can lead to a lot of problems. These are problems which could have been easily avoided
   if the bug had been caught early by the automation tests.

4. **Data integrity**: Software is very volatile. Depending on the requirements and situations, the
   entire structure of the application might have to be changed from time to time. This means that an entity with
   one required attribute might be updated to have two required attributes in the future. If test artifacts are
   carried over after each run, then this change in structure can cause the entire application to break even before
   the tests begin since the carried over data follows the old structure. Cleaning up the data at that point will be
   a manual chore which will consume a lot of time and energy which could have been avoided if proper cleanup was
   implemented from the beginning.

5. **Resource management**: Automation tests may consume resources such as memory, disk space, or network
   bandwidth. Without cleanup, these resources can be left in use, potentially impacting other tests or processes
   running on the same system. This accumulation of resources can increase the operation costs and impact the efficiency
   of the application in the long run.

## Implementing cleanup after tests in Playwright

In Playwright we use the after-hooks for cleaning up the test artifacts after each test. These hooks are defined within
the describe block just like the before-hooks we used earlier in the course. There are two kinds of after-hooks:

1. [**afterEach**](https://playwright.dev/docs/api/class-test#test-after-each): This hook is executed after each test
   block is stopped in a describe block. This means that if there are N tests in a describe block, then the `afterEach`
   block will be executed N times, once for each test.

2. [**afterAll**](https://playwright.dev/docs/api/class-test#test-after-all): This hook is executed once after all the
   test blocks in a describe block are stopped. This means that if there are N tests in a describe block, then the
   `afterAll` block will be executed only once, after all the N tests are stopped.

One important thing to note regarding the after-hooks is that they will fire regardless of whether the tests run to
completion or not. This is the main reason why we rely on after-hooks for cleanup over adding the steps for cleaning up
at the end of a test. This makes sure that the artifacts created during failed runs are also cleaned up properly.

This also allows us to uphold the DRY convention. Since a describe block groups together similar tests, the artifacts
generated by them would be similar and the logic for cleaning them up would also be similar. Using the after-hooks like
`afterEach` allow us to write this logic once and execute it at the end of each test without having to repeat them.

Let's see a quick example showing the order of execution of the before-hooks and after-hooks.

```ts
test.describe("Sample page", () => {
  test.beforeAll(() => {
    console.log("This executed before all tests");
  });

  test.beforeEach(() => {
    console.log("This executed before each test");
  });

  test.afterAll(() => {
    console.log("This executed after all tests");
  });

  test.afterEach(() => {
    console.log("This executed after each test");
  });

  test("should verify first feature", async () => {
    console.log("This executed in the first test");
  });

  test("should verify second feature", async () => {
    console.log("This executed in the second test");
  });
});
```

```
# Output

This executed before all tests
This executed before each test
This executed in the first test
This executed after each test
This executed before each test
This executed in the second test
This executed after each test
This executed after all tests
```

Now that we understand the importance of cleanup and how the after-hooks work, let's use this
knowledge to refactor all our existing tests to cleanup the artifacts generated by them.

## Refactoring the tests to cleanup the artifacts

We currently have four spec files:

1. login.setup.ts
2. global.teardown.ts
3. register.spec.ts
4. tasks.spec.ts

Here the `login.setup.ts` and `global.teardown.ts` specs do not have any artifact creation associated with them.
So we will leave them out. The `register.spec.ts` spec does have an artifact creation associated with it. We
create/register a new user there. Unfortunately, the application does not allow us to delete a user. So we have to
skip that as well. So let's take the `tasks.spec.ts` file.

The tasks spec creates a new task at the beginning of each test which is an artifact which is getting accumulated after
each run. Since we have a new artifact being created at the end of each test, we have to delete them at the end of each
test as well. Therefore, we should be using the `afterEach` hook instead of the `afterAll` hook here.

We have already created the logic to delete a task in the `"should be able to delete a completed task"` test. We just have
to reuse that logic on the `afterEach` hook. So we will implement the `afterEach` block reusing the same logic.

```ts
import { test } from "../fixtures";
import { expect } from "@playwright/test";
import { faker } from "@faker-js/faker";
import LoginPage from "../poms/login";

test.describe("Tasks page", () => {
  let taskName: string;

  test.beforeEach(() => {
    taskName = faker.word.words({ count: 5 });
  });

  // afterEach block added in to implement cleanup

  test.afterEach(async ({ page, taskPage }) => {
    await page.goto("/");
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

Let's run the tests and see if everything works as intended.

```bash
yarn playwright test --headed
```

Oh no! Two tests are failing due to this additional logic. Let's examine the test failures and
find out the reason.

1. **"should be able to mark a task as completed"**: This test failed in the `afterEach` block because we had
   already marked the task as completed in the test body. So the `await taskPage.markTaskAsCompletedAndVerify({ taskName })`
   method is failing because Playwright cannot find the `Mark as completed` checkbox for this task.

2. **"should be able to delete a completed task"**: This test failed in the `afterEach` block because we had already
   deleted this task in the test body. So Playwright cannot find the task in the tasks page to delete it.

Let's try and solve both these issues. For the first test, we need to make a change in the `markTaskAsCompletedAndVerify`
POM method such that the task is marked as completed only if it hasn't been marked as completed already. Let's try to
implement this logic in the `poms/tasks.ts` file.

```ts
// poms/tasks.ts (line no: 37)

markTaskAsCompletedAndVerify = async ({ taskName }: TaskName) => {
  await expect(
    this.page.getByRole("heading", { name: "Loading..." })
  ).toBeHidden();

  const completedTaskInDashboard = this.page
    .getByTestId("tasks-completed-table")
    .getByRole("row", { name: taskName });

  const isTaskCompleted = await completedTaskInDashboard.count();

  if (isTaskCompleted) return;

  await this.page
    .getByTestId("tasks-pending-table")
    .getByRole("row", { name: taskName })
    .getByRole("checkbox")
    .click();
  await completedTaskInDashboard.scrollIntoViewIfNeeded();
  await expect(completedTaskInDashboard).toBeVisible();
};
```

The only difference we have made in the code above is that we skip the action to mark the task
as completed if it has already been marked as completed. Everything else remains the same.

For the second test, our work is even simpler. Since we're are verifying that a completed task can be
deleted at the end of each test, we need not have a dedicated test just for verifying the deletion
feature. So let's remove that entire test. Now our spec will look like this.

```ts
import { test } from "../fixtures";
import { expect } from "@playwright/test";
import { faker } from "@faker-js/faker";
import LoginPage from "../poms/login";

test.describe("Tasks page", () => {
  let taskName: string;

  test.beforeEach(() => {
    taskName = faker.word.words({ count: 5 });
  });

  test.afterEach(async ({ page, taskPage }) => {
    await page.goto("/");
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

  test.describe("Starring tasks feature", () => {
    test.describe.configure({ mode: "serial" });

    test("should be able to star a pending task", async ({
      page,
      taskPage,
    }) => {
      await page.goto("/");
      await taskPage.createTaskAndVerify({ taskName });
      await taskPage.starTaskAndVerify({ taskName });
    });

    test("should be able to un-star a pending task", async ({
      page,
      taskPage,
    }) => {
      await page.goto("/");
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

Let's try running the tests again now.

```bash
yarn playwright test --headed
```

Great! All our tests are passing and none of the test artifacts are retained either.

## Bonus: Refactoring the tests with the beforeEach block

We have learned about the execution order of the before-hooks and after-hooks and the order in which
they execute. Now looking back at our tests, there's room for improvement. We see that the following
two lines are repeated at the beginning of each test.

```ts
await page.goto("/");
await taskPage.createTaskAndVerify({ taskName });
```

If they are repeating at the beginning of each test block then why not extract it to the `beforeEach`
block? Let's refactor our code with the `beforeEach` block and remove all the extracted logic from
the tests.

```ts
import { test } from "../fixtures";
import { expect } from "@playwright/test";
import { faker } from "@faker-js/faker";
import LoginPage from "../poms/login";

test.describe("Tasks page", () => {
  let taskName: string;

  test.beforeEach(async ({ page, taskPage }) => {
    taskName = faker.word.words({ count: 5 });

    await page.goto("/");
    await taskPage.createTaskAndVerify({ taskName });
  });

  test.afterEach(async ({ page, taskPage }) => {
    await page.goto("/");
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

  test("should create a new task with creator as the assignee", () => {}); // This test is empty

  test("should be able to mark a task as completed", async ({ taskPage }) => {
    await taskPage.markTaskAsCompletedAndVerify({ taskName });
  });

  test.describe("Starring tasks feature", () => {
    test.describe.configure({ mode: "serial" });

    test("should be able to star a pending task", async ({ taskPage }) => {
      await taskPage.starTaskAndVerify({ taskName });
    });

    test("should be able to un-star a pending task", async ({
      page,
      taskPage,
    }) => {
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
    await taskPage.createTaskAndVerify({ taskName, userName: "Sam Smith" }); // This is assigned to a different user

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

Here as well, we can see issues with two tests.

1. **"should create a new task with creator as the assignee"**: All the logic associated with this
   test has been extracted out.

2. **"should create a new task with a different user as the assignee"**: We are assigning the created task
   to a different user and not Oliver Smith.

The issue with the test can be solved pretty easily. Just like in the cleanup, all the logic related to this
test is executed before each test block. So a dedicated test for this logic is unnecessary. So we will remove it.

The second issue is a bit tricky to solve. This is the only test that breaks the `beforeEach` pattern out of
all the tests. We can't just let the `beforeEach` block and the test create the same task because the uniqueness
constraint of the task title will throw an error. The only way around this, that we know of now, is to give up the
refactoring and just repeat the code multiple times just because of this one outlier. But we should be looking for
innovative solutions in such cases instead of giving up.

This is where the [testInfo](https://playwright.dev/docs/api/class-testinfo) util can help us out. The `testInfo`
util can give us the details about the current test in the before-hooks and after-hooks. This opens up a
lot of opportunities for us. If we can identify the current test which is executing then we can selectively skip
the `beforeEach` logic only for the "should create a new task with a different user as the assignee" test. We
could check for the entire test title and skip the `beforeEach` code for that case. But let's plan for the future
and assume that there will be other test-cases as well which would require us to skip the `beforeEach` block.
So let's declare for a title pattern for tests that do not need the `beforeEach` block to execute. Let's update the
title of our test to the following.

```diff
- "should create a new task with a different user as the assignee"
+ "should create a new task with a different user as the assignee [SKIP_SETUP]"
```

Now we can add a logic in our `beforeEach` block to skip the task creation logic if it contains the pattern
`[SKIP_SETUP]`.

```ts
test.beforeEach(async ({ page, taskPage }, testInfo) => {
  taskName = faker.word.words({ count: 5 });

  if (testInfo.title.includes("[SKIP_SETUP]")) return;

  await page.goto("/");
  await taskPage.createTaskAndVerify({ taskName });
});
```

The final spec file will look like this.

```ts
import { test } from "../fixtures";
import { expect } from "@playwright/test";
import { faker } from "@faker-js/faker";
import LoginPage from "../poms/login";

test.describe("Tasks page", () => {
  let taskName: string;

  test.beforeEach(async ({ page, taskPage }, testInfo) => {
    taskName = faker.word.words({ count: 5 });

    if (testInfo.title.includes("[SKIP_SETUP]")) return;

    await page.goto("/");
    await taskPage.createTaskAndVerify({ taskName });
  });

  test.afterEach(async ({ page, taskPage }) => {
    await page.goto("/");
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

  test("should be able to mark a task as completed", async ({ taskPage }) => {
    await taskPage.markTaskAsCompletedAndVerify({ taskName });
  });

  test.describe("Starring tasks feature", () => {
    test.describe.configure({ mode: "serial" });

    test("should be able to star a pending task", async ({ taskPage }) => {
      await taskPage.starTaskAndVerify({ taskName });
    });

    test("should be able to un-star a pending task", async ({
      page,
      taskPage,
    }) => {
      await taskPage.starTaskAndVerify({ taskName });
      const starIcon = page
        .getByTestId("tasks-pending-table")
        .getByRole("row", { name: taskName })
        .getByTestId("pending-task-star-or-unstar-link");
      await starIcon.click();
      await expect(starIcon).toHaveClass(/ri-star-line/);
    });
  });

  test("should create a new task with a different user as the assignee [SKIP_SETUP]", async ({
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

Let's try executing the tests now.

```bash
yarn playwright test --headed
```

Great! All our tests are passing and we have reduced code repetition as much as possible.

## When to use `beforeAll` and `afterAll` and when not to use them

Note: This section is theoretical and is not part of the application we are building. The code in this section should not
be committed.

In all the examples given above, we used the `beforeEach` and `afterEach` hooks. This makes us question
the use-case of the `beforeAll` and `afterAll` hooks. The short answer is that 90% of the time they might
not be needed. This is because they come with a set of disadvantages.
Since Playwright provides context isolation, i.e. the page and browser context is not shared between multiple
tests, we are not able to access any of the context-based fixtures in the `beforeAll` and `afterAll` hooks.
Consider this example.

```ts
import { test, expect } from "@playwright/test";

test.describe("Dashboard", () => {
  test.beforeAll(async ({ page }) => {
    await page.goto("/");
  });

  test("should navigate to proper URL", async ({ page }) => {
    await expect(page).toHaveURL("/dashboard");
  });
});
```

Executing this test will throw the following error.

```
Error: "context" and "page" fixtures are not supported in beforeAll. Use browser.newContext() instead.
```

Loosing access to the `page` and `context` fixtures closes the doors to most of the things we can do with Playwright.
This is why we usually go with `beforeEach` and `afterEach` hooks. Does this mean that there is no use-case for
the `beforeAll` and `afterAll` hooks?

There are some cases where it is necessary to use these hooks. Consider a spec where there are multiple tests
where, in each test we login as the same user to test the features. In this case we can use the `beforeAll` hook to
generate a unique email for all the tests and log the user into the application in the `beforeEach` hook.

```ts
import { test, expect } from "@playwright/test";
import { faker } from "@faker-js/faker";

test.describe("Dashboard", () => {
  let email: string;

  test.beforeAll(({}) => {
    email = faker.internet.email();
  });

  test.beforeEach(async ({ loginPage }) => {
    await loginPage.loginWithEmail(email);
  });

  test("should navigate to proper URL", async ({ page }) => {
    await expect(page).toHaveURL("/dashboard");
  });
});
```

As seen in the example, there are some cases where we need to execute the some methods only during
the entire test. In those niche cases, `beforeAll` and `afterAll` can be very effective for setup
and teardown respectively.

Let's commit these changes now.

```bash
git add -A
git commit -m "Refactored code using hooks and added code for cleaning up test artifacts"
```
