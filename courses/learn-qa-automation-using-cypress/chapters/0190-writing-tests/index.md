Now that we’ve learnt how to work with cypress, let us see how we can build
tests for features. As an example lets take a **Form** component existing within
a **Pane** as the feature to be tested.

<image alt="Pane Form Component">pane-form-component.png</image>

Before writing the tests, take a moment to think how exactly manual testing of
such UI features are done. Our objective with writing automated cypress tests is
to mimic such manual testing techniques. We may not be able to automate every
feature test as there may be unanticipated edge cases but the tests must account
for all the features necessary for it to function properly.

Keep in mind when writing code to test a feature, have all it’s tests within a
single `it` block so as to reduce the cost of running automated cypress tests as
is mentioned in the **Test Suite and Test Case** chapter.

## Setup

Before testing a feature there are some necessary steps that should be taken.
All these steps must be contained within a `beforeEach` block or `before` block.
In this example before testing the feature we must actually navigate to the page
wherein the feature lies, then we must also add a tag beforehand to test
uniqueness validation of tags. These steps also include assertions of everything
contained within the setup so as to verify whether the setup itself is proper.

```javascript
beforeEach(() => {
  tags.addTagViaRequest(tagName);
  cy.get(navSelectors.tagsTab).click();
  cy.get(commonSelectors.heading).should("have.text", tagsTexts.articleTags);
  tags.clickNewTagButtonAndVerifyCreateTagPane();
});
```

## Test body

When writing tests, figure out the basic functionalities of the feature to be
tested and ensure that the tests account for all these functionalities. Since we
are testing a **Form** component existing within a **Pane**, its basic
functions would be

- Creating a tag
- Editing a tag
- Deleting a tag

## Testing Create tag function

```javascript
// verify create tag pane view
tags.clickNewTagButtonAndVerifyCreateTagPane();
cy.get(commonSelectors.paneHeading).should("have.text", tagTexts.newTagHeading);
cy.get(tagsSelectors.tagName).should("have.text", tagTexts.name);
cy.get(tagsSelectors.closeButton).click();
cy.get(tagsSelectors.tagNameTextField).should("not.exist");
tags.clickNewTagButtonAndVerifyCreateTagPane();
cy.get(tagsSelectors.cancelButton).click();
cy.get(tagsSelectors.tagNameTextField).should("not.exist");

// create tag
tags.clickNewTagButtonAndVerifyCreateTagPane();
tags.verifyMandatoryFieldValidation();
tags.verifyExistingTagValidation(tagName);
cy.recursiveType(tagsSelectors.tagNameTextField, newTagName);
cy.get(tagsSelectors.submitButton).click();
cy.verifyToastMessage(tagsTexts.tagCreatedMessage);
cy.interceptApi("fetchAndUpdateRequest");
cy.clearAndType(tagsSelectors.searchTextField, newTagName);
cy.wait("@fetchAndUpdateRequest");
cy.contains(tagsSelectors.tableRow, newTagName).within(() => {
  cy.get(tagsSelectors.tagName).should("contain.text", newTagName);
});
```

Here we have tested :-

- The `close`/`cancel` button functionality of create tag Pane.
- The Mandatory fields validations.
- The uniqueness validation of the tags by asserting the toastr message content
  when we try to add a non unique tag.

<image alt="Pane Form Component">name-taken-toastr-message.png</image>

- The `create tag` function. We have asserted whether the added tag exists
  within the table to ensure that the `create tag` feature works properly.

Keep in mind if any of the actions results in a **toastr** message or is
expecting a **toastr** message, it's always good practice to assert the content
of said message.

Here we can see that verifying the tag details might be used elsewhere, so let
us move that into a utils function.

```javascript
// support/utils/tags

export const verifyTagDetails = tagName => {
  cy.interceptApi("fetchAndUpdateRequest");
  cy.clearAndType(tagsSelectors.searchTextField, tagName);
  cy.wait("@fetchAndUpdateRequest");
  cy.contains(tagsSelectors.tableRow, tagName).within(() => {
    cy.get(tagsSelectors.tagName).should("contain.text", tagName);
  });
};
```

## Testing Edit tag function

```javascript
// edit tag
tags.clickEditButtonAndVerifyEditTagModal(newTagName);
tags.verifyMandatoryFieldValidation();
tags.verifyExistingTagValidation(tagName);
cy.recursiveType(tagsSelectors.tagNameTextField, editTagName);
cy.get(tagsSelectors.submitButton).click();
cy.verifyToastMessage(tagsTexts.tagUpdatedMessage);
verifyTagDetails(editTagName);
cy.clearAndType(tagsSelectors.searchTextField, newTagName);
cy.contains(tagsSelectors.tagName, newTagName).should("not.exist");
```

Here we have tested :-

- The `close`/`cancel` button functionality of edit tag Pane.
- The Mandatory fields validations.
- The uniqueness validation of the tags.
- The `edit tag` function. This is done as usual by asserting the toastr
  message. Furthermore it also checks whether the tag does not exist in its
  **past state** and also checks the present tag details to be conforming with
  what we have entered in the form.

## Testing the delete function

<image alt="Delete tag modal">delete-tag-modal.png</image>

```javascript
// verify cancel button functionality of delete alert modal
tags.clickDeleteButtonAndVerifyAlertModal(editTagName);
cy.get(commonSelectors.alertCancelButton).click();

// delete tag
clickDeleteButtonAndVerifyAlertModal(editTagName);
cy.get(commonSelectors.alertSubmitButton).invoke("click");
cy.verifyToastMessage(tagsTexts.tagDeletedMessage);
cy.clearAndType(tagsSelectors.searchTextField, editTagName);
cy.contains(tagsSelectors.tagName, editTagName).should("not.exist");
```

Here we have tested :-

- The `cancel` button functionality of delete alert modal
- The `delete tag` function. As usual we assert the toastr message content, then
  we search for the deleted tag and asserts that it doesn't exist.

## Teardown

As we've already learned after each test we must restore the state of the app.
This is very important because, if we skipped this step, then other tests might
be adversely affected. Whatever we have added/ modified must be reverted to its
original state. After each test, we must assess what all have been mutated and
then take careful steps to revert the changes. In this example, the teardown is
rather simple; Here all that we've done is add a new tag in each test, so
basically, all that we've left to do after each test is to delete the added tag.
The code to revert the changes shouldn't be within the test body but rather it
should be within the `afterEach` or `after` block.

```javascript
afterEach(() => {
  tags.deleteTag(tagName);
});
```

## Point to remember

<image alt="Form with required category">form-with-required-category-field.png</image>

Take a look at the above screenshot. Here we can see there exist a field for
selecting category, this implies that before we create/publish an article there
must exist at least one category. So in effect whilst writing tests for this
`form`, there must exist a function to add and assert the existence of a
category in the setup. Taking these steps ensures a comprehensive and proper initiation of feature testing.


## Additional resources
- [Writing your first end-to-end-test](https://docs.cypress.io/guides/end-to-end-testing/writing-your-first-end-to-end-test)
- [Cypress official tutorials](https://docs.cypress.io/examples/tutorials)
