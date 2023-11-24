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

## How to use fixtures

Imagine a scenario where we need to console `Fixture setup` before every test, `Fixture Data` during the test and `Fixture teardown` after every test.

```ts
// fixtures.ts

import { Page, test as base } from "@playwright/test";

type Fixture = {
  sampleString: string;
};

export const test = base.extend<Fixture>({
  sampleString: async (use) => {
    console.log("Fixture setup");
    await use("Fixture Data")
    console.log("Fixture teardown");
  }.
})
```

The `extend` method is used to add additional functionality to the test object.
Each fixture has a setup and teardown phase separated by the `await use()`. The `use` function is passed as an argument to the fixture function, and is used to provide the fixture object to the test function.

To utilize the fixture in our tests, import this test into our test files instead of importing it directly from `@playwright/test`.

```js
import { test } from "./fixtures";

test("test", async ({ sampleString }) => {
  console.log(sampleString);
});
```

```bash
# output
$ npx playwright test sample.spec.ts

Fixture Setup
Fixture Data
Fixture Teardown
```

This approach spares us from the need to include the logic to console within every individual test, promoting cleaner and more efficient test code.

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
