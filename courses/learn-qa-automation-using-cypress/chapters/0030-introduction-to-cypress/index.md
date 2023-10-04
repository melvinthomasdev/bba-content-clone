## What is Cypress

Cypress is an end-to-end testing tool for the web.

## Features of Cypress

Cypress comes with lots of features fully baked into it. Let's go through some of them.

- **Time Travel:** Cypress takes snapshots as our tests run. Hover over
  commands in the
  [Command Log](https://docs.cypress.io/guides/core-concepts/cypress-app#Command-Log)
  to see exactly what happened at each step.

- **Debuggability:**
  [Debug directly](https://docs.cypress.io/guides/guides/debugging) from
  familiar tools like Developer Tools. The readable errors and stack traces make
  debugging lightning fast.

- **Automatic Waiting:** Never add waits or sleeps to our tests. Cypress
  automatically waits for commands and assertions before moving on. No more
  async hell.

- **Spies, Stubs, and Clocks:** Verify and control the behavior of functions,
  server responses, or timers. The same functionality we love from unit testing
  is right at our fingertips.

- **Network Traffic Control:** Easily
  [control, stub, and test edge cases](https://docs.cypress.io/guides/guides/network-requests)
  without involving our server. We can stub network traffic however we like.

- **Consistent Results:** The Cypress architecture doesn’t use Selenium or
  WebDriver. Say hello to fast, consistent and reliable tests that are
  flake-free.

- **Screenshots and Videos:** View screenshots taken automatically on failure,
  or videos of our entire test suite when run from the CLI. Record to
  [Cypress Cloud](https://docs.cypress.io/guides/cloud/introduction) to store
  them with our test results for zero-configuration debugging.

- **Cross browser Testing:** Run tests within Firefox and Chrome-family browsers
  (including Edge and Electron) locally and optimally in a Continuous
  Integration pipeline.

- **Smart Orchestration:** After setting up to record to Cypress Cloud, we can easily parallelize your test suite and prioritize the rerun of failed specs for tight feedback loops.

- **Flake Detection:** Discover and diagnose unreliable tests with Cypress
  Cloud's
  [Flaky test management](https://docs.cypress.io/guides/cloud/flaky-test-management).
