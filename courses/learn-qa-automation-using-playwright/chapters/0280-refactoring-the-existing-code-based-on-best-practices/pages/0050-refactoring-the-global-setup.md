This is the first test file where there is some refactoring possible. Here we
can observe the following improvements that can be made:

1. Move hard-coded strings to texts.
2. Use relative URLs instead of absolute URLs.
3. Move sensitive credentials to env variables.
4. Wrap the steps in proper test blocks.

We're already familiar with the first two action items. So let's implement
them.

```ts
// e2e/tests/login.setup.ts

import { STORAGE_STATE } from "../../playwright.config";
import { COMMON_TEXTS } from "../constants/texts";
import { test } from "../fixtures";

test.describe("Login page", () => {
  test("should login with the correct credentials", async ({
    page,
    loginPage,
  }) => {
    await page.goto("/");
    await loginPage.loginAndVerifyUser({
      email: "oliver@example.com",
      password: "welcome",
      username: COMMON_TEXTS.defaultUserName,
    });
    await page.context().storageState({ path: STORAGE_STATE });
  });
});
```

Let's take a look at the third action item. We need to move the sensitive
credentials to environment variables as mentioned in [this chapter](https://courses.bigbinaryacademy.com/learn-qa-automation-using-playwright/environment-variables/).
Since our app is running in a development mode and these credentials won't
work in other environments, we will extract these to a `.env` file which we
will check-in to our project. This will ensure that anyone with access to the
repository can easily run the tests in the development environment and also
enables the provisions in the code to override the login credentials with the 
sensitive data when we deploy the application.

To achieve this, let's create a new directory called `config` within the `e2e`
directory and create a new file called `.env` within that.

```bash
mkdir e2e/config
touch e2e/config/.env
```

Now let's extract the email and password to the `.env` file.

```
ADMIN_EMAIL=oliver@example.com
ADMIN_PASSWORD=welcome
```

As mentioned in the [Environment variables chapter](https://courses.bigbinaryacademy.com/learn-qa-automation-using-playwright/environment-variables/),
we need to use the [dotenv package](https://www.npmjs.com/package/dotenv) to
access the environment variables in Playwright. So let's install the package
now.

```bash
yarn add dotenv
```

Now let's use the `dotenv` package to initialize the ENV variables in the
Playwright configuration.

```ts
// playwright.config.ts

import { defineConfig, devices } from "@playwright/test";
import dotenv from "dotenv";

export const STORAGE_STATE = "./auth/session.json";

dotenv.config({ path: "./e2e/config/.env" });

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

Now let's replace the hard-coded credentials in the login setup with the
environment variables.

```ts
// e2e/tests/login.setup.ts

import { STORAGE_STATE } from "../../playwright.config";
import { COMMON_TEXTS } from "../constants/texts";
import { test } from "../fixtures";

test.describe("Login page", () => {
  test("should login with the correct credentials", async ({
    page,
    loginPage,
  }) => {
    await page.goto("/");
    await loginPage.loginAndVerifyUser({
      email: process.env.ADMIN_EMAIL,
      password: process.env.ADMIN_PASSWORD,
      username: COMMON_TEXTS.defaultUserName,
    });
    await page.context().storageState({ path: STORAGE_STATE });
  });
});
```

Now we will encounter a TypeScript error in the places we used the ENV
variables with the following message.

```
Type 'string | undefined' is not assignable to type 'string'.
```

The reason for this error is because ENV variables may or may not be defined.
They are only defined if we set them up properly in the environment in where
we intend to use them. So it is very important to make sure that all ENV
variables are properly defined when setting up a new project in a new
environment.

In our case though, we have defined the variables in a `.env` file which has
been checked into git. So it is guaranteed that they won't be undefined.
So we will use the [not-null assertion operator](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-2-0.html#non-null-assertion-operator) (!) in TypeScript to let it know
that the value will always be defined.

```ts
// e2e/tests/login.setup.ts

import { STORAGE_STATE } from "../../playwright.config";
import { COMMON_TEXTS } from "../constants/texts";
import { test } from "../fixtures";

test.describe("Login page", () => {
  test("should login with the correct credentials", async ({
    page,
    loginPage,
  }) => {
    await page.goto("/");
    await loginPage.loginAndVerifyUser({
      email: process.env.ADMIN_EMAIL!,
      password: process.env.ADMIN_PASSWORD!,
      username: COMMON_TEXTS.defaultUserName,
    });
    await page.context().storageState({ path: STORAGE_STATE });
  });
});
```

Let's look at the last action item which is to use proper step blocks in the
tests. We should also ensure to avoid redundant awaits while performing this
refactoring.

```ts
import { STORAGE_STATE } from "../../playwright.config";
import { COMMON_TEXTS } from "../constants/texts";
import { test } from "../fixtures";

test.describe("Login page", () => {
  test("should login with the correct credentials", async ({
    page,
    loginPage,
  }) => {
    await test.step("Step 1: Visit login page", () => page.goto("/"));
    await test.step("Step 2: Login and verify admin user", () =>
      loginPage.loginAndVerifyUser({
        email: process.env.ADMIN_EMAIL!,
        password: process.env.ADMIN_PASSWORD!,
        username: COMMON_TEXTS.defaultUserName,
      })
    );

    await page.context().storageState({ path: STORAGE_STATE });
  });
});
```

We have not wrapped the step where we define the storage state in a step block
because its not actually a part of the test. Its a setup that supports the
upcoming steps.