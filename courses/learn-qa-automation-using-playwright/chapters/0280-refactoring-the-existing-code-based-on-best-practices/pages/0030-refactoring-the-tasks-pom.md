In the login POM we can observe the following improvements that can be made:

1. Move all selectors to constants
2. Use the short-hand notation for initializing the class variables
3. Move all texts to constants
4. Avoid nth methods

Since we are already familiar with the first two action items, let's implement
them now.

```ts
// e2e/constants/selectors/createTask.ts

export const CREATE_TASK_SELECTORS = {
  taskTitleField: "form-title-field",
  memberSelectContainer: ".css-2b097c-container",
  memberOptionField: ".css-26l3qy-menu",
  createTaskButton: "form-submit-button",
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
};
```

```ts
// e2e/constants/selectors/index.ts

import { CREATE_TASK_SELECTORS } from "./createTask";
import { NAVBAR_SELECTORS, TASKS_TABLE_SELECTORS } from "./dashboard";
import { LOGIN_SELECTORS } from "./login";

export {
  NAVBAR_SELECTORS,
  LOGIN_SELECTORS,
  TASKS_TABLE_SELECTORS,
  CREATE_TASK_SELECTORS,
};
```

```ts
import { Page, expect } from "@playwright/test";
import {
  CREATE_TASK_SELECTORS,
  NAVBAR_SELECTORS,
  TASKS_TABLE_SELECTORS,
} from "../constants/selectors";

interface TaskName {
  taskName: string;
}

interface CreateNewTaskProps extends TaskName {
  userName?: string;
}

export class TaskPage {
  constructor(private page: Page) {}

  createTaskAndVerify = async ({
    taskName,
    userName = "Oliver Smith",
  }: CreateNewTaskProps) => {
    await this.page.getByTestId(NAVBAR_SELECTORS.addTodoButton).click();
    await this.page
      .getByTestId(CREATE_TASK_SELECTORS.taskTitleField)
      .fill(taskName);

    await this.page
      .locator(CREATE_TASK_SELECTORS.memberSelectContainer)
      .click();
    await this.page
      .locator(CREATE_TASK_SELECTORS.memberOptionField)
      .getByText(userName)
      .click();
    await this.page.getByTestId(CREATE_TASK_SELECTORS.createTaskButton).click();
    const taskInDashboard = this.page
      .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
      .getByRole("row", {
        name: new RegExp(taskName, "i"),
      });
    await taskInDashboard.scrollIntoViewIfNeeded();
    await expect(taskInDashboard).toBeVisible();
  };

  markTaskAsCompletedAndVerify = async ({ taskName }: TaskName) => {
    await expect(
      this.page.getByRole("heading", { name: "Loading..." })
    ).toBeHidden();

    const completedTaskInDashboard = this.page
      .getByTestId(TASKS_TABLE_SELECTORS.completedTasksTable)
      .getByRole("row", { name: taskName });

    const isTaskCompleted = await completedTaskInDashboard.count();

    if (isTaskCompleted) return;

    await this.page
      .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
      .getByRole("row", { name: taskName })
      .getByRole("checkbox")
      .click();
    await completedTaskInDashboard.scrollIntoViewIfNeeded();
    await expect(completedTaskInDashboard).toBeVisible();
  };

  starTaskAndVerify = async ({ taskName }: TaskName) => {
    const starIcon = this.page
      .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
      .getByRole("row", { name: taskName })
      .getByTestId(TASKS_TABLE_SELECTORS.starUnstarButton);
    await starIcon.click();
    await expect(starIcon).toHaveClass(/ri-star-fill/i);
    await expect(
      this.page
        .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
        .getByRole("row")
        .nth(1)
    ).toContainText(taskName);
  };
}
```

Now let's deal with the 3rd action item. Let's move all the hard-coded texts to
constants. For this let's create a directory called `texts` within the
`constants` directory. Since all the texts we're dealing with are on the
dashboard page, we will create a new file called `dashboard.ts` where we will
extract all the texts related to the dashboard page. Just like for the
selectors, we will create an `index.ts` file which will export all the
constants for easier imports across modules.

Additionally there are some texts which are common across multiple pages like
the username `Oliver Smith`. We will move such texts to a file called
`common.ts` within the `texts` directory.

```bash
mkdir e2e/constants/texts
touch e2e/constants/texts/dashboard.ts
touch e2e/constants/texts/index.ts
touch e2e/constants/texts/common.ts
```

Now that we have created all the files and directories, let's extract the
texts and refactor the code.

```ts
// e2e/constants/texts/common.ts

export const COMMON_TEXTS = {
  defaultUserName: "Oliver Smith",
};
```

```ts
// e2e/constants/texts/dashboard.ts

export const DASHBOARD_TEXTS = {
  loading: "Loading...",
  starredTaskClass: /ri-star-fill/i,
};
```

```ts
// e2e/constants/texts/index.ts

import { DASHBOARD_TEXTS } from "./dashboard";
import { COMMON_TEXTS } from "./common";

export { DASHBOARD_TEXTS, COMMON_TEXTS };
```

```ts
// e2e/poms/tasks.ts

import { Page, expect } from "@playwright/test";
import {
  CREATE_TASK_SELECTORS,
  NAVBAR_SELECTORS,
  TASKS_TABLE_SELECTORS,
} from "../constants/selectors";
import { COMMON_TEXTS, DASHBOARD_TEXTS } from "../constants/texts";

interface TaskName {
  taskName: string;
}

interface CreateNewTaskProps extends TaskName {
  userName?: string;
}

export class TaskPage {
  constructor(private page: Page) {}

  createTaskAndVerify = async ({
    taskName,
    userName = COMMON_TEXTS.defaultUserName,
  }: CreateNewTaskProps) => {
    await this.page.getByTestId(NAVBAR_SELECTORS.addTodoButton).click();
    await this.page
      .getByTestId(CREATE_TASK_SELECTORS.taskTitleField)
      .fill(taskName);

    await this.page
      .locator(CREATE_TASK_SELECTORS.memberSelectContainer)
      .click();
    await this.page
      .locator(CREATE_TASK_SELECTORS.memberOptionField)
      .getByText(userName)
      .click();
    await this.page.getByTestId(CREATE_TASK_SELECTORS.createTaskButton).click();
    const taskInDashboard = this.page
      .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
      .getByRole("row", {
        name: new RegExp(taskName, "i"),
      });
    await taskInDashboard.scrollIntoViewIfNeeded();
    await expect(taskInDashboard).toBeVisible();
  };

  markTaskAsCompletedAndVerify = async ({ taskName }: TaskName) => {
    await expect(
      this.page.getByRole("heading", { name: DASHBOARD_TEXTS.loading })
    ).toBeHidden();

    const completedTaskInDashboard = this.page
      .getByTestId(TASKS_TABLE_SELECTORS.completedTasksTable)
      .getByRole("row", { name: taskName });

    const isTaskCompleted = await completedTaskInDashboard.count();

    if (isTaskCompleted) return;

    await this.page
      .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
      .getByRole("row", { name: taskName })
      .getByRole("checkbox")
      .click();
    await completedTaskInDashboard.scrollIntoViewIfNeeded();
    await expect(completedTaskInDashboard).toBeVisible();
  };

  starTaskAndVerify = async ({ taskName }: TaskName) => {
    const starIcon = this.page
      .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
      .getByRole("row", { name: taskName })
      .getByTestId(TASKS_TABLE_SELECTORS.starUnstarButton);
    await starIcon.click();
    await expect(starIcon).toHaveClass(DASHBOARD_TEXTS.starredTaskClass);
    await expect(
      this.page
        .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
        .getByRole("row")
        .nth(1)
    ).toContainText(taskName);
  };
}
```

Great! Now we have to deal with the final action item for the POM. This
involves removing all the nth methods. But our use-case here is to ensure
that the starred task is moved to the top of the list. That means we need to
ensure that the **first** row of the table is the starred task. This is a
genuine use case for the nth methods and it cannot be avoided. So instead of
removing it, let's add a comment in the code stating our intentions for
breaking a best practice.

```ts
// e2e/poms/tasks.ts

starTaskAndVerify = async ({ taskName }: TaskName) => {
  const starIcon = this.page
    .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
    .getByRole("row", { name: taskName })
    .getByTestId(TASKS_TABLE_SELECTORS.starUnstarButton);
  await starIcon.click();
  await expect(starIcon).toHaveClass(DASHBOARD_TEXTS.starredTaskClass);
  await expect(
    this.page
      .getByTestId(TASKS_TABLE_SELECTORS.pendingTasksTable)
      .getByRole("row")
      .nth(1) // Using nth methods here since we want to verify the first row of the table
  ).toContainText(taskName);
};
```