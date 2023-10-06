## What are flaky tests

Flaky tests are the tests which pass sometimes and fail sometimes. A test
failing consistently everytime can not be considered a flaky test. However, if
we have retries enabled in our project, if on the first try the test fails and
on the second try the test passes, then it is a flaky test.

## Causes of flaky tests

### DOM rerendered on request

When there is an API request happening for example on a button click and the DOM
gets updated or is re-rendered after the request. If we happen to click on any
element which will be updated, we will see this error.

This DOM element likely became detached somewhere between the previous and current command.

Common situations why this happens:

1. JS framework re-rendered asynchronously.
2. App code reacted to an event firing and removed the element.

We typically need to re-query for the element or add 'guards' which delay Cypress from running new commands.

To prevent the flakiness in these types of tests, we can add a delay by using
`intercept` command.

```javascript
//Incorrect

cy.get("btn").click();
cy.get("next-btn").click();

//Correct

cy.intercept("request-url").as("request");
cy.get("btn").click();
cy.wait("@request");

cy.get("next-btn").click();
```

### Race conditions

When a page is loaded, the DOM is rendered. Let's say that during that time t1,
an element got created. After that, the event listeners for the element are
attached, say at time t2. If between that time i.e t2 -t1, we `click` on the
element, we will see the same error as mentioned previously. To resolve this, we
can introduce a `wait` for (t2 - t1) time, but we cannot predict the time, as it
can be different on different envs, resulting into the flakiness and also it
causes the test to slow down. So we should not be using `cy.wait`.

To prevent this behaviour we should `invoke` a click, rather than to use `click`
command. The `invoke` command will wait on the function to exist on the subject
before running meaning it will implicitly take care of waiting till time t2.

Another way to resolve this error, is to use `then`.

```javascript
//Incorrect

cy.get("btn").click();

//Incorrect

cy.wait(10000);
cy.get("btn").click();

//Correct

cy.get("btn").invoke("click");

//Correct

cy.get("btn").then(el => el.trigger("click"));
```

There is also a plugin we can use in such cases i.e cypress-pipe.

If the element lies outside the re-rendering DOM or results in a new view being
rendered for e.g. `submit` button, we should use `click` command. The `cy.click`
is not retried.

When we need to fire the click element irrespective of it's state e.g. whether
it is disabled/enabled, we should use `click({force: true})`.

### Incorrect logic handling

These are the tests which will fail on the retries as well but will pass on some
builds and fails on another. The assertions based on random data cause this
flakiness. In such instances, we will not be able to find the element or the
element will be placed at wrong position. In these tests we should handle the
other cases.

For instance, in the given below snippet we need to handle the two cases based
on whether the result set is greater than 2. In case we don't include the other
case, it will lead to failure sometimes.

```javascript
cy.get(contactsPageSelectors.tableRowCheckBox).then(checkboxes => {
  if (checkboxes.length > 2) {
    cy.get(contactsPageSelectors.tableRowCheckBox).eq(0).click();
    cy.get(contactsPageSelectors.tableRowCheckBox).should("be.checked");
    cy.get(contactsPageSelectors.tableRowCheckBox).eq(0).click();
    cy.get(contactsPageSelectors.tableRowCheckBox).should("not.be.checked");
    cy.get(contactsPageSelectors.tableRowCheckBox).eq(1).click();
  } else {
    cy.get(contactsPageSelectors.tableRowCheckBox).eq(0).click();
    cy.get(contactsPageSelectors.tableRowCheckBox).should("not.be.checked");
    cy.get(contactsPageSelectors.tableRowCheckBox).eq(1).click();
  }
});
```

**4. External libraries**

If we are using an external library, like faker in our project, it can also
cause test failures. For instance, special characters need to be correctly
handled.
