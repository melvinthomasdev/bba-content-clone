We can divide our test case into three to four logical parts.

1. **_Setup_** - Action to be performed before actual test part. e.g navigate to
   a section via navbar. The common part of the `setup` can be added in `before`
   or `beforeEach`.
2. **_Exercise_** - The actual test part e.g. type text and click on submit
   button.
3. **_Assertion_** - Verifying the exercise part e.g. asserting the success
   message.
4. **_Teardown_** - This is done after performing assertion. This might not be
   needed for each of the test cases. Basically in teardown, we restore the
   state of the app.

An example could be to write a test case to add a customer.

```js
describe("Customers", { tags: ["review", "nightly"] }, () => {
  beforeEach(() => {
    /* Setup */
    //navigate to customers page
  });

  afterEach(() => {
    /* Teardown if any */
  });

  test("should add a customer operations", () => {
    /* Exercise */
    // Commands to add customer
    /* Assertion */
    // Assert that customer is added.
  });
});
```

All the test scenarios (both positive and negative) for a functionality can be
written in a single test case. We can separate the test scenarios by a comment
and empty line.

## Reasons to keep all the scenarios in a single test case

1. To reduce the overall test execution time. Most of the applications which we
   work on are powered by front-end frameworks like React.js. We can avoid unnecessary page refreshes for testing various scenarios, resulting in shorter testing times.
2. Cypress dashboard treats each `it` block as a separate test. Cypress
   dashboard service charges for each test. If we have less tests, we will be
   charged less.

For example, Suppose we want to create a new task, we can write a test case covering all the
scenarios. We can start with the cancel functionality, validations, create a new task, edit
a new task and delete a new task.

```js
import { fake } from "fixtures/fake";
import { tasksSelectors } from "selectors/defaultTasks";
import { commonSelectors } from "selectors/common";
import { tasksTexts } from "texts/defaultTasks";
import { commonTexts } from "texts/common";
import {
  verifyMandatoryFieldValidation,
  addNewTaskViaUI,
  navigateToNewTaskPage,
  navigateToEditTaskPage,
} from "utils/defaultTasks";

describe("New task", { tags: ["review", "nightly"] }, () => {
  const taskName = fake.uniqueDepartment;
  const editTaskName = fake.uniqueDepartment;

  beforeEach(() => {
    cy.login();

    cy.get(tasksSelectors.moreButton).click();
    cy.get(tasksSelectors.settingsTabs).click();
    cy.get(tasksSelectors.defaultTaskHeading).should(
      "have.inSensTrimmedText",
      tasksTexts.defaultTasks
    );

    navigateToNewTaskPage();
  });

  test("should verify new task operations", () => {
    // verify cancel button functionality
    cy.clearAndType(tasksSelectors.nameTextField, taskName);
    cy.get(tasksSelectors.cancelButton).click();

    cy.get(tasksSelectors.defaultTaskHeading).should(
      "have.inSensTrimmedText",
      tasksTexts.defaultTasks
    );

    // add new task
    navigateToNewTaskPage();
    verifyMandatoryFieldValidation();
    addNewTaskViaUI(taskName);

    // edit
    navigateToEditTaskPage(taskName);
    verifyMandatoryFieldValidation();
    cy.clearAndType(tasksSelectors.nameTextField, editTaskName);
    cy.get(tasksSelectors.submitButton).click();

    cy.verifyToastMessage(tasksTexts.taskUpdatedMessage);
    cy.contains(tasksSelectors.nameRow, editTaskName).should("exist");

    // delete
    cy.contains(tasksSelectors.tableRow, editTaskName).within(() => {
      cy.get(tasksSelectors.deleteButton).click();
    });

    cy.verifyToastMessage(tasksTexts.taskDeletedMessage);
    cy.contains(tasksSelectors.nameRow, editTaskName)
      .should("not.exist");
  });
});
```

Here we wrote only one test, namely,
**should verify new task operations**
which contains all the test scenarios.
