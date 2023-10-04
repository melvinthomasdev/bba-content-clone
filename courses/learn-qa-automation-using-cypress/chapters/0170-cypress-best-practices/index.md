## Login programmatically

To test most of the functionalities, many of the web applications need the user
to be logged in.

- **Anti Pattern:** Sharing page objects, using UI to log in, and not taking
  shortcuts.
- **Best Practice:** Test specs in isolation, programmatically log into the
  application, and take control of the application's state.

```javascript
cy.loginViaUI("username", "password"); // incorrect
cy.login("username", "password"); // correct, we are logging in programmatically here
```

## Use proper selectors

Every test we write will include selectors for elements. The CSS classes might
change or be removed. We must use selectors that are resilient to changes.

- **Anti-Pattern:** Using highly brittle selectors that are subject to change.
- **Best Practice:** Use data-cy attributes to provide context to the selectors
  and isolate them from CSS or JS changes.

The
[Selector Playground](https://docs.cypress.io/guides/core-concepts/test-runner#Selector-Playground)
automatically follows these best practices. When determining a unique selector
it will automatically prefer elements with: data-cy data-test

We shall use data-cy to keep the consistency because it has the highest
priority.

**_When should we use cy.contains()?_**

Sometimes, we need to select element with the text present in the page. In such
scenarios, we might need to use `cy.contains()`. However, we need to ensure that
the selected text is always present.

If the content of the element gets changed, would we want the test to fail?

- If the answer is yes: use cy.contains()
- If the answer is no: use a data attribute.

```javascript
cy.contains("[data-cy='sign-up-link']", "Sign up for free").click();
```

Here our test fails if the content of an element within the selected DOM element
doesn't contain the string "Sign up for free". Hence we can ensure the test
passes only when an element containing the necessary content exists within the
selected DOM element.

## Don’t assign command’s return values

Don’t assign command’s return values to variables.

- **Anti-Pattern:** Trying to assign the return value of commands with const,
  let, or var.
- **Best Practice:** Use closures to access and store what commands yield.

```javascript
// DON’T DO THIS. IT DOES NOT WORK
const a = cy.get("a");

cy.visit("https://example.cypress.io");

// nope, it fails
a.first().click();
```

## Don't test external sites

- **Anti-Pattern:** Trying to visit or interact with sites or servers which we
  do not control.
- **Best Practice:** Only test what we can control. When necessary, always use
  cy.request() to talk to 3rd party servers via their APIs.

## Make every test independent of each other

- **Anti-Pattern:** Coupling multiple tests together i.e. making tests depend on
  previous/other tests.
- **Best Practice:** Tests should always be able to be run independently from
  one another and still pass. In Cypress, we can run tests in parallel. All the
  tests can pass only if they are not dependent on each other.

## Avoid single assertion tests

We are testing behavior of the application, we are doing integration testing,
not unit testing.

**Anti-Pattern:** Acting like we're writing unit tests. **Best Practice:** Add
multiple assertions and don't worry about it.

## Don’t clean state using `after` or `afterEach` hooks

- **Anti-Pattern:** Using `after` or `afterEach` hooks to clean up state.
- **Best Practice:** Clean up state before tests are run.

## Don't use wait for arbitrary time period

- **Anti-Pattern:** Waiting for arbitrary time periods using cy.wait(Number).
- **Best Practice:** Use intercepts (route aliases are deprecated) or assertions
  to guard Cypress from proceeding until an explicit condition is met.

```javascript
// Non-Deterministic as we can't predict time taken
// Doesn't convey what are we waiting for
cy.wait(1000);

// Deterministic as we are waiting for a request to complete
cy.intercept("url").as("requestInterceptor");
cy.wait("@requestInterceptor");
```

## Start Web Servers prior to running cypress

**Anti-Pattern:** Trying to start a web server from within Cypress scripts with
cy.exec() or cy.task() **Best Practice:** Start a web server prior to running
Cypress.

## Set a global baseUrl

- **Anti-Pattern:** Using cy.visit() without setting a baseUrl.
- **Best Practice:** Set a baseUrl in the configuration file (cypress.json by
  default)

```javascript
// cypress-tests/cypress.config.js

{
  "baseUrl": "http://spinkart.lvh.me:9005",
  ...
}
```

## Avoid `{ force: true }`

Cypress is an automation tool where it simulates the user behavior. If we use
`force: true` on any event, it overrides the actionable checks Cypress applies
by default i.e. visible, exist etc. If we try to automate without considering
the user behavior, some issues might be identified later because these tests
will pass even if application is not behaving as expected. There are some
exceptions where we might need to use `force: true`. However, mostly we should
avoid using it. To avoid `force: true`, we can assert for the parent or
surrounding elements first before actually asserting the element. And even if it
still doesn't work, we can try a plugin called
[Cypress Real Events](https://github.com/dmtrKovalenko/cypress-real-events).

## Use `cy.contains()` along with a selector

When we use `cy.contains()` to select an element with some text or to assert.

For example,

```javascript
cy.contains("Sign up for free").click();
```

But if the `Sign up for free` link is present multiple times on the same page,
our test case might fail. To avoid our test case from failing, we can add a
'selector' with `cy.contains()`, so cypress would know exactly which string to
consider. So whenever possible pass the selector with the text inside the
contains function.

For example,

```javascript
cy.contains("[data-cy='sign-up-link']", "Sign up for free").click();
```

## Avoid chaining of array elements with `.eq()`, `.first()` etc. in the test case

Whenever there's an array of elements and we want to use any specific element
from that array, let's say first or last element we can specify it in with the
selector itself instead of chaining the commands with `.eq()`, `.first()`,
`.last()`, etc. There are chances of getting an `Element detached from DOM`
error with this.

For example,

```javascript
// Incorrect

cy.get("[data-cy=check-box]").eq(0).should("be.visible").check();
```

```javascript
// Correct

cy.get("[data-cy=check-box]:eq(0)").should("be.visible").check();

// OR

cy.get("[data-cy=check-box]:nth-child(1)").should("be.visible").check();
```

## Use `scrollIntoView()` to detect partially visible elements

Cypress sometimes fails to detect an element even if it exists and maybe
partially visible as well. In such cases, we can use `scrollIntoView` with
option as shown:

```javascript
// without option
cy.get(clientsPageConfig.submitButton).scrollIntoView().click();

// with option
cy.get(clientsPageConfig.submitButton).scrollIntoView({ easing: "linear" });
```

## Use `loginPath` instead of `rootUrl` for login test

While writing login test visit **loginPath** instead of **rootUrl** as visiting
**rootUrl** for testing login functionality might not work in every environment
because not all application redirects to the login page when visiting the
rootUrl. Even if it redirects to login, we can still reduce the time required
for the login page redirection.

```javascript
import { loginPath } from "Constants/routes";

describe("Login", () => {
  beforeEach(() => {
    cy.visit(loginPath);
  });
});
```

## No need of common assertions for actionable elements before performing actions

Whenever we want to perform any action on elements like button or input field
e.g. `click` or `type` on them respectively. Asserting on them with
`.should("be.visible")` or `.should("exist")` are not necessary. Cypress
internally does this, so we don't need to do it explicitly. More at
[cypress](https://docs.cypress.io/guides/core-concepts/interacting-with-elements)

```javascript
// incorrect
cy.get("[data-cy=submit-modal-button]").should("be.visible").click();

// correct
cy.get("[data-cy=submit-modal-button]").click();
```

## Custom commands should be purely functional and should not have code pertaining to verifications

<image>custom-commands-functional.png</image>

**18. Assertions should check that the element is “visible” on page rather than
“exists” on page**

Exist only checks that the element is present in DOM and not necessarily that
the element is visible. We need to ensure in our assertions that the element is
visible on page.

<image>use-visible-instead-of-exist.png</image>

## Enable Retries

Retries should be enabled. This helps in determining the tests which are flaky.
We can set this configuration in cypress.json like this.

```json
{
  "retries": {
    "runMode": 2,
    "openMode": 2
  }
}
```

Ensure that we are using `beforeEach` and not `before` hooks in our tests, as
`before` hooks are not retried.

## GitHub related

- Ensure to pull the latest code (always should be in sync) from github before
  creating a branch.
- Always rebase branch with base branch (main / develop as the case may be) at
  regular intervals to be in sync with the base branch.
- Run all specs in local and also on CI pipeline (if possible) and ensure all
  specs are passing before working on any new cypress spec by creating a branch
  from the latest.
- Raise Pull Request and assign it to a single person for review.
