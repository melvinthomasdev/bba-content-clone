## Session Command

- Cypress session allows the tester to manage multiple sessions in isolation.
- Each session has a unique Id. It can be of type string, number, object or array.
- On the first session request it will perform all actions and store the details of `cookies`, `local storage` and `session storage` also known as `Session Details`.
- For the next session request with the same Id, it will simply restore all the `Session Details` created during the previous session.

## How does it work?

- Here is how it is being used in an example

```javascript
const login = (email, password) => {
  cy.session(["Login", email], () => {
    // perform login
    cy.visit("/login");
    cy.clearAndType(loginSelectors.emailTextField, email);
    cy.clearAndType(loginSelectors.passwordTextField, password);
    cy.get(loginSelectors.submitButton).click();
  });
};

it("test", () => {
  login("user1@test.com", "password1");
  // perform some actions for user1
  login("user2@test.com", "password2");
  // perform some actions for user2
  login("user1@test.com", "password1");
  // perform some actions for user1
});
```

- For the first time for `user1` and `user2` it will perform steps inside the session function.
- For the second time when we call the login function with `user1`, instead of repeating steps from the session function it will use the `session details` created during the first login with `user1` making execution faster and eliminating repeating steps.

## How was it used?

```javascript
export const login = (email, password) => {
  // clear session details
  Cypress.session.clearAllSavedSessions();

  // perform login
  cy.visit("/login");
  cy.clearAndType(loginSelectors.emailTextField, email);
  cy.clearAndType(loginSelectors.passwordTextField, password);
  cy.get(loginSelectors.submitButton).click();
};
```

- Here, for each user login, we need to clear session details from the previous user.
- Also, logging in with another user will perform all the authentication steps from scratch.

## How is it used now?

- First of all, to enable the session in Cypress we need to add the below entry in `cypress.config.js`.

```javascript
experimentalSessionAndOrigin: true;
```

- Now we can write authentication with the session command

```javascript
export const login = (email, password) => {
  cy.session(["Login", email], () => {
    // perform login
    cy.visit("/login");
    cy.clearAndType(loginSelectors.emailTextField, email);
    cy.clearAndType(loginSelectors.passwordTextField, password);
    cy.get(loginSelectors.submitButton).click();
  });
};
```

- For each email, new session details will be created and stored in memory.
- If we try to re-authenticate with the same email, instead of performing authentication steps it will reuse session details from the previous authentication.

`Note:` Each session request needs to be followed by `cy.visit("/<Some URL>")` since the session command will clear the current content on the page.
