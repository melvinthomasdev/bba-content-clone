- We can divide our test case into three to four logical parts.

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

The simplest example could be to write a test case to add a customer:

```javascript
describe("Customers", () => {
  it("should add a customer", () => {
    /* Setup */
    //navigate to customers page
    /* Exercise */
    // Commands to add customer
    /* Assertion */
    // Assert that customer is added.
    /* Teardown if any */
  });
});
```

All the test scenarios (both positive and negative) for a functionality can be
written in a single test case. We can separate the test scenarios by a comment
and empty line.

### Reasons to keep all the scenarios in a single test case?

1. To reduce the overall test execution time. Most of the applications which we
   work on are powered by front-end frameworks like react. So to test all the
   scenarios we don't need to refresh the page, and hence it takes less time.
2. Cypress dashboard treats each `it` block as a separate test. Cypress
   dashboard service charges us for each test. If we have less tests, we will be
   charged less comparatively.

Refer to the example in the following section to get the proper idea.

For example,

Suppose we want to create a new task, we can write a test case covering all the
scenarios:

We can start with the cancel functionality, validations, create a new task, edit
a new task and delete a new task.

Please refer to the code below to get a proper idea.

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

describe("New task", () => {
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

  it("should verify new task operations", () => {
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
    cy.contains(tasksSelectors.nameRow, editTaskName).should("not.exist");
  });
});
```

As mentioned before we wrote only 1 test, namely, 'should verify new task
operations' which contains all the test scenarios.
