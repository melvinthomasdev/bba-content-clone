Playwright has a configuration file, typically named `playwright.config.ts`, where we can specify various options to configure how our tests are run.

We've configured Playwright for multiple environments using the dotenv package. The `isCI` constant here, indicates whether the test is running in a Continuous Integration (CI) environment.

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

Let's checkout some notable terms in the configuration above.

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

This configuration ensures a systematic execution order, with setup tests running before actual tests and cleanup occurring after all projects finish.

There is nothing to commit in this chapter. If you have made some changes to the project, clean them up by executing the following command.

```bash
git clean -fd
```