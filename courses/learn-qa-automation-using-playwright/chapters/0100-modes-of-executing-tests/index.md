There are different modes of running the playwright tests.

## Headless mode

This is the default mode, where no browser window is opened while running the tests and results are shown in the terminal. It’s particularly useful for automated testing scenarios, especially in continuous integration (CI) environments or server environments where there is no need for a graphical user interface. We can run the tests in headless mode by using the following command.

```bash
npx playwright test
```

<image>playwright-headless-mode.png</image>

## Headed mode

This mode allows us to see how playwright interacts with the application by opening a browser window. We can run the tests in headed mode by using the following command.

```bash
npx playwright test --headed
```

## UI mode

This mode provides a better developer experience by opening a graphical user interface where we can walk through each step of the test, see the DOM snapshots, screenshots and videos, use the locator picker, and more. We can run the tests in UI mode by using the following command.

```bash
npx playwright test --ui
```

<image>playwright-ui-mode.png</image>

## Debug mode

This mode in Playwright provides a way to pause the execution of our tests and enter a debugging session, allowing us to inspect the state of the browser, step through our test code, set breakpoints, and diagnose any issues. We can run the tests in debug mode by using the following command.

```bash
npx playwright test --debug
```

<image>playwright-debug-mode.png</image>

## VS Code extension

The VS Code extension for Playwright allows us to run our tests right in VS Code, see error messages, create breakpoints, and live debug our tests. We can install the extension from the [marketplace](https://marketplace.visualstudio.com/items?itemName=ms-playwright.playwright) or from the extensions tab in VS Code.

With this extension, we have the capability to execute individual or multiple tests. Additionally, we can display active browsers, initiate runs with trace viewer and more.

For a deeper understanding of this extension's features and functionalities, refer their [official documentation](https://playwright.dev/docs/getting-started-vscode#debugging-tests).

## Custom scripts

In BigBinary we have defined custom scripts for executing the tests in each of these modes.

- **Headless mode:** `yarn playwright:headless`
- **Headed mode:** `yarn playwright:headed`
- **UI mode:** `yarn playwright:ui`
- **Debug mode:** `yarn playwright:debug`

This is a theoretical chapter. There is nothing to commit in here. If you have made some changes to the project, clean them up by executing the 
following command.

```bash
git clean -fd
```