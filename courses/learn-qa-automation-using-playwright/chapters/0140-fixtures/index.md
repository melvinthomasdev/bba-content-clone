## Introduction

Fixtures set up the right environment, providing the test with exactly what it needs and nothing more. They are isolated between tests and operate on an on-demand basis, allowing us to define as many as needed. Playwright Test will then set up only the fixtures required by our specific test, optimizing efficiency.

## Built-in fixtures

Playwright comes with several built-in fixtures that we are likely to use most of the time. Following are few of them.

**page:** Isolated page for the test run.

**context:** Isolated context for the run. The page fixture belongs to this context.

**browser:** Provides necessary resources for the test to run. Browsers are shared across tests to optimize resources.

**browserName:** The name of the browser currently running the test.

```js
import { test, expect } from "@playwright/test";

test("Verify members", async ({ page, context, browser }) => {
  ...
});
```

It is important to note that fixtures can only be used by destructuring them. This is because the lifecycle of the fixtures start when we destructure them in a test. 
If we use fixtures without destructuring them, Playwright throws an error.

```ts
test("Verify members", async ({ page, context, browser }) => { // Correct
  ...
});

test("Verify members", async (fixtures) => { // Incorrect. Playwright throws an error.
  ...
});
```

## Custom fixtures

We can create custom fixtures for any data or helpers we might need in a test. For doing this we can make use of the `.extend` method. Each fixture
has a setup and teardown phase separated by the `await use()`. The `use` function is passed as an argument to the fixture function, and is used to
provide the fixture object to the test function. To utilize the fixture in our tests, import the extended `test` we have created into our test files instead of importing it
directly from `@playwright/test`.

### Fixture Lifecycle

The lifecycle of a fixture can be classified into three steps. The setup, usage and teardown step. To understand it better consider the following sample fixture.

```ts

import { test } from "@playwright/test";

interface {
  customValue: string;
}

const sampleFixture = test.extend<customValue>({
  customValue: async ({}, use) => {
    /* Setup starts */
    console.log("Setting up customValue fixture");
    /* Setup ends */

    await use("This is the value of the customValue fixture"); // Usage

    /* Teardown starts */
    console.log("Tearing down customValue fixture");
    /* Teardown ends */
  }
})

sampleFixture(async ({ customValue }) => {
  console.log("Test begins");
  console.log(customValue);
  console.log("Test ends")
})
```

The output when executing the above tests will be as follows.

```
# output
$ npx playwright test sample.spec.ts

Setting up customValue fixture
Test begins
This is the value of the customValue fixture
Test ends
Tearing down customValue fixture
```

As seen from the output above, the fixture lifecycle is dependent on the test lifecycle. The lifecycle is as follows.

1. Setup: Here we can write all the logic to setup our custom fixture. Some common usage includes initializing a POM and 
setting up the page for using the fixture. This step takes place before the test begins. Playwright goes through all the 
fixtures we have destructred in a test and sets them up.

2. Usage: This is the step where we actually use the fixture. In the fixture we can provide any useful data or helper to
the tests through the `use` command. Doing this replaces all the occurrences of the fixture name
in the tests with the value we pass in the `use` command.

3. Teardown: This is the final step in the fixture lifecycle which can be used to execute some cleanup actions. This can 
be used to do something like cleaning up the test data from a site after testing in it. The teardown of a fixture is 
executed only after the dependent test has completed execution.

This approach spares us from the need to include the repeating logic within individual tests, promoting cleaner and 
more efficient test code.

## Page Object Models as fixtures

Imagine a Page Object Model named `TodoPage` representing the todo page of the application and that it includes methods that facilitate navigating to the page, adding additional todos, and removing existing ones.

```ts
// todo.ts

import type { Page } from "@playwright/test";

export class TodoPage {
  constructor(page: Page) {
    this.page = page;
    this.todoItems = this.page.getByTestId("todo-item");
  }

  goto = async () => await this.page.goto("https://demo/todo-page");

  addToDo = async (todoName: string) => {
    await this.page.getByPlaceholder("Enter todo").fill(todoName);
    await this.page.getByRole("button", { name: "Submit" });
  };

  removeAll = async () => {
    while ((await this.page.getByTestId("todo-item").count()) > 0) {
      await this.todoItems.first().hover();
      await this.todoItems.getByLabel("Delete").first().click();
    }
  };
}
```

In the provided code snippet, it's important to highlight that a class variable named todoItems has been introduced. This addition was made because of the need to access the todo item multiple times within the class.

In the below code snippet, a fixture has been set up, creating an instance of TodoPage, which is then shared with tests through the `await use(todoPage)` function call.

```ts
// fixture.ts

import { test as base } from "@playwright/test";
import { TodoPage } from "./todo";

type Poms = { todoPage: TodoPage };

export const test = base.extend<Poms>({
  todoPage: async ({ page }, use) => {
    // Set up the fixture.
    const todoPage = new TodoPage(page);
    await todoPage.goto();
    await todoPage.addToDo("item1");

    // Use the fixture value in the test.
    await use(todoPage);

    // Clean up the fixture.
    await todoPage.removeAll();
  },
});
```

Hence, to employ the todo page methods in our test, we can effortlessly import the test function from `fixture.ts`.

Note that custom fixture names should start with a letter or underscore, and can contain only letters, numbers and underscores.
