- Sometimes, the piece of code is redundant and we don't require it in all the
  test cases. We can create utility functions and move such code there.
- Like custom commands, it's also easy to work with utility functions.
- We can create a separate folder as `utils` in `support` folder and store our
  functions in a file in that folder.

Consider the following example of utility function for login.

```javascript
//cypress/support/utils/common.js

export const loginViaUI = (username, password) => {
  cy.visit("/login");
  cy.get(dataCy("login-email-field")).type(username);
  cy.get(dataCy("login-password-field")).type(password);
  cy.get(dataCy("submit-button")).submit();
};
```

This is how we can use utility function in our test case:

```javascript
import { loginViaUI } from "Support/utils/common.js";

describe("Login", () => {
  test("should allow user to log in", () => {
    loginViaUI("username", "password");
  });
});
```

## Commands vs Utility Functions

Doesn't it seem that both `utility function` or a `command` does the similar
thing? Maybe yes. But which one to prefer `utility function` or a `command` ?

The thumb rule: If the code being used in almost every test suite, we can create
a custom command for it. The benefit of this is that we don't have to import the
js file to use the command, it is available directly on `cy` object i.e.
`cy.loginViaUI()`.

But, this doesn't mean that we should use `commands` for everything. If the code
is used in only some of the test suite, we can create a `utility function` and
`import` it whenever needed.
