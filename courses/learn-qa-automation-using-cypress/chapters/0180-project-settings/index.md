## Cypress configuration

Cypress configs are located in `cypress/cypress.config.js`. The following is the
configuration we use for most of the projects.

```javascript
// cypress/cypress.config.js
const { defineConfig } = require("cypress");

module.exports = defineConfig({
  projectId: "xxxxxx",
  execTimeout: 1800000,
  defaultCommandTimeout: 5000,
  requestTimeout: 5000,
  pageLoadTimeout: 40000,
  responseTimeout: 10000,
  viewportWidth: 1200,
  viewportHeight: 960,
  chromeWebSecurity: false,
  env: {
    grepFilterSpecs: true,
    grepOmitFiltered: true,
  },
  retries: {
    runMode: 1,
    openMode: 1,
  },
  e2e: {
    setupNodeEvents(on, config) {
      return require("./cypress/plugins/index")(on, config);
    },
    baseUrl: "http://yourlocalappurl:portNumber",
    specPattern: "cypress/e2e/**/*.spec.js",
    // experimentalSessionAndOrigin flag will be removed when migrating to
    // Cypress v12.x, as it will become a global feature
    experimentalSessionAndOrigin: true,
    experimentalRunAllSpecs: true,
  },
});
```

## Browser

- _**chromeWebSecurity**_ allows enable Chromium-based browser's Web Security
  for same-origin policy and insecure mixed content.

Set the value as `false`, as some of specs we may write have to navigate to any
superdomain without cross-origin errors with or without `cy.origin()`.

## Retries

- _**runMode**_ allows you to define the number of test retries when running
  cypress run.
- _**openMode**_ allows you to define the number of test retries when running
  cypress open.

Set the value as `1` for both of them. By default the value is `0`. **Do not
increase the value as that adds to the cost of running the tests on CI.**

## Timeouts

- _**execTimeout**_ is the time, in milliseconds, to wait for a system command
  to finish executing during a `cy.exec()` command.
- _**defaultCommandTimeout**_ is the time in milliseconds, to wait until most
  DOM based commands are considered timed out.
- _**requestTimeout**_ is the time, in milliseconds, to wait for a request to go
  out in a `cy.wait()` command.
- _**pageLoadTimeout**_ is the time, in milliseconds, to wait for page
  transition events or `cy.visit()`, `cy.go()`, `cy.reload()` commands to fire
  their page load events.
- _**responseTimeout**_ is the time, in milliseconds, to wait until a response
  in a `cy.request()`, `cy.wait()`, `cy.fixture()` commands.

Set _defaultCommandTimeout_ and _requestTimeout_ to `5000` (5 seconds),
_execTimeout_ to `1800000` (30 minutes), _pageLoadTimeout_ to `40000` (40
seconds), _requestTimeout_ to `10000` (10 seconds).

**The values for these timeouts should not be increased to higher value as that
adds to our cost of running the tests on CI.**

## Viewport

- _**viewportHeight**_ is the height in pixels for the application under tests'
  viewport. Default value is `660`.
- _**viewportWidth**_ is the width in pixels for the application under tests'
  viewport. Default value is `1000`.

The values for these viewport differs from requirement and is set to `960`
_viewportHeight_ and `1200` _viewportWidth_ in the config.

## E2E Options

- _**setupNodeEvents**_ is a function in which node events can be registered and
  config can be modified. Used to setup Cypress plugins like @cypress/grep.
- _**baseURL**_ is URL used as prefix for `cy.visit()` or `cy.request()`
  command's URL.
- _**specPattern**_ is the String or Array of glob patterns of the test files to
  load.
- _**experimentalSessionAndOrigin**_ is used to enable cross-origin and improved
  session support, including the `cy.origin()` and `cy.session()` commands. Only
  available in end-to-end testing.
- _**experimentalRunAllSpecs**_ is used to enable the "Run All Specs" UI
  feature, allowing the execution of multiple specs sequentially.

There are also different config files that are used to override some options
based on development environment. The config files are:

- `cypress/cypress-test/config/cypress.development.json`
- `cypress/cypress-test/config/cypress.review.json`
- `cypress/cypress-test/config/cypress.staging.json`

## Project settings on cypress dashboard

### Run failed specs first

It is often helpful to be aware of test failures earlier within a CI test run so
that debugging and iterations can resume and progress much faster. Being able to
catch issues sooner within the CI process can save valuable time in
troubleshooting failures and deploying fixes.

Enable this feature in Cypress dashboard by:

1. Go to your project from cypress dashboard.
2. Click "Project Settings" on the left sidebar.
3. Scroll to the Smart Orchestration section.
4. Toggle "**Run failed specs first**" on.

### Cancel test run when a test fails

Continuous Integration (CI) pipelines are typically costly processes that can
demand significant compute time. When a test failure occurs in CI, it often does
not make sense to continue running the remainder of a test suite since the
process has to start again upon merging of subsequent fixes and other code
changes.

Enable this feature in Cypress dashboard by:

1. Go to your project from cypress dashboard.
2. Click "Project Settings" on the left sidebar.
3. Scroll to the Smart Orchestration section.
4. Toggle "**Cancel run on test failure**" on.