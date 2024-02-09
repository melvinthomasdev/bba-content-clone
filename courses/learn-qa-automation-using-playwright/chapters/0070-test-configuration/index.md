Playwright has a configuration file, typically named `playwright.config.ts`, where we can specify various options to configure how our tests are run.

We've configured Playwright for multiple environments using the dotenv package. The `isCI` constant here, indicates whether the test is running in a Continuous Integration (CI) environment.

**STORAGE_STATE:** This constant variable points to the file path where user session related cookies are stored.

**testDir:** Specifies the directory where the test files are located.

**timeout:** Sets the maximum time a test can run. A value of 0 removes any upper time limit.

**fullyParallel:** If true, all tests in all files run in parallel.

**forbidOnly:** If true, CI build fails if `test.only` is accidentally left in the source code.

**retries:** Maximum number of retry attempts per test.

**workers:** Maximum number of concurrent worker processes for parallelizing tests.

**reporter:** Controls how test results are displayed or saved.

**use:** Specifies test options shared across all projects.

**baseURL:** Sets the base URL used in actions like await page.goto('/').

**testIdAttribute:** Custom attribute used in `page.getByTestId()`.

**trace**: Records trace for each test (defaults to off).

**video**: Records video for each test (defaults to off).

**screenshot**: Automatically captures a screenshot after each test (defaults to off).

The projects configuration includes three projects:

- **Setup:** Performs a global setup before all projects are run. We have configured the login functionality of the application in this setup.

- **Chromium:** Actual tests are run in this project. The setup project is a dependency, ensuring it runs before the Chromium project tests.

- **Cleanup Credentials:** Performs a global teardown after all projects are run. We have configured the clearing of user session details in this project.

Following is the configuration we have used.

```js
import dotenv from "dotenv";

import { defineConfig, devices } from "@playwright/test";

import { STORAGE_STATE } from "./constants";

dotenv.config({
  path: `./e2e/config/.env.${process.env.TEST_ENV ?? "development"}`,
});

const currentsConfig = {
  ciBuildId: process.env.NEETO_CI_JOB_ID,
  recordKey: process.env.RECORD_KEY,
  projectId: process.env.PROJECT_ID,
  tag: [process.env.TAG],
};

const isCI = ["staging", "review"].includes(
  process.env.TEST_ENV ?? "development"
);

export default defineConfig({
  testDir: "./e2e/tests",
  fullyParallel: false, // Run tests in files in parallel
  forbidOnly: isCI, // Fail the build on CI if you accidentally left test.only in the source code.
  retries: isCI ? 1 : 0, // Retry on CI only
  timeout: 0, // Infinite timeout for tests
  workers: 1, // Opt out of parallel tests
  reporter: isCI ? [["@currents/playwright", currentsConfig]] : [["line"]],
  // Shared settings for all the projects
  use: {
    baseURL: process.env.BASE_URL, // Base URL to use in actions like `await page.goto('/')`.
    testIdAttribute: "data-cy", // Using getByTestId returns the selector with the data-cy label instead of the data-testid
    trace: "on", // Record trace for each test
    video: { mode: "on", size: { width: 1200, height: 1200 } }, // Record video for each test
    screenshot: "on", // Record screenshot for each test.
  },

  // Configure projects for major browsers
  projects: [
    {
      name: "setup",
      testMatch: "global.setup.ts",
      teardown: "cleanup credentials",
    },
    {
      name: "chromium",
      use: { ...devices["Desktop Chrome"], storageState: STORAGE_STATE },
      dependencies: ["setup"],
    },
    { name: "cleanup credentials", testMatch: "global.teardown.ts" },
  ],
});
```

This configuration ensures a systematic execution order, with setup tests running before actual tests and cleanup occurring after all projects finish.


### Environment variables

Environment variables or ENV variables are dynamic values that are set outside of an application and are accessible to it during runtime.
They provide a way to customize and configure the behavior of an application without modifying its code. Environment
variables are typically set at the operating system level or by deployment platforms and are accessed by the
application's code through an API provided by the programming language or runtime environment.

These variables are useful for storing sensitive information like API keys, database credentials, or configuration settings
that may vary between different environments (such as development, testing, and production). Using environment variables
enhances security by keeping sensitive information out of source code repositories and allows for greater flexibility.

In many programming languages and frameworks, accessing environment variables is straightforward, often through built-in
functions or libraries provided by the language runtime. Developers can read and use these variables within their applications
to adjust behavior dynamically based on the environment in which the application is running. The following command sets the `TEST_ENV` environment
variable to `development` in the local terminal.

```bash
# Unix (Linux and Mac)
export TEST_ENV=development

# Windows
set TEST_ENV=development
```

Additionally, we can store all the environment variables in a `.env` file. This allows us to define the variables based on the environment from
different files. JavaScript doesn't have native support for accessing environment variables in a `.env` file. For accessing these variables we have
to use the `dotenv` package. This package reads all the ENV variables in the specified `.env` file and adds them to the `process.env` object (default configuration). All
the OS level environments will be present on the `process.env` object when we start a NodeJS application (depending on the framework). In the
configuration above, we have defined the environment variables in files called `.env.staging`, `.env.development`, `.env.production` etc. as follows.

```
# .env.development

NEETO_CI_JOB_ID=ABCD123
RECORD_KEY=ABCD123
PROJECT_ID=ABCD123
TAG=development
BASE_URL=http://localhost:3000

# .env.staging

NEETO_CI_JOB_ID=EFG456
RECORD_KEY=EFG456
PROJECT_ID=EFG456
TAG=staging
BASE_URL=https://subdomain.neetoapp.net

# .env.review

NEETO_CI_JOB_ID=XYZ789
RECORD_KEY=XYZ789
PROJECT_ID=XYZ789
TAG=review
BASE_URL=https://subdomain.neetoapp.com
```

The following code snippet loads the environment variables defined in a `.env` file based on OS level `TEST_ENV` variable we set earlier.

```ts
dotenv.config({
  path: `./e2e/config/.env.${process.env.TEST_ENV}`, // Since TEST_ENV was set to development, this will load the contents of .env.development
});
```

Now we can access the variables defined in the `.env` files as `process.env.BASE_URL`, `process.env.NEETO_CI_JOB_ID` etc.