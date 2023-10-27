- In Cypress, a user can create a new command or overwrite an existing command.
  These are called as custom commands.
- These custom commands are used to create the test steps that are repeated in
  an automation flow.
- The custom commands can be created in `cypress/support/commands.js`.

Let's see some examples of custom commands:

The following is a custom command for the login purpose.

```javascript
import { loginPath } from "Constants/routes";

const authHeaders = {
  Authorization: `Token ${Cypress.env("AUTH_TOKEN")}`,
};

Cypress.Commands.add("loginViaUI", (username, password) => {
  cy.get("[data-cy='login-email-field']").type(username);
  cy.get("[data-cy='login-password-field']").type(password);
  cy.get("[data-cy='submit-button']").click();
});

Cypress.Commands.add(
  "login",
  (email = "oliver@example.com",
   password = "welcome",
   path = "/") => {
    cy.request({
      url: loginPath,
      method: "POST",
      form: true,
      body: {
        user: {
          email: email,
          password: password,
        },
      },
      headers: {
        Accept: "application/json",
        ...authHeaders,
      },
    });
    cy.visit(path);
  }
);

Cypress.Commands.add(
  "loginAndVisit",
  (path = "/", email = "oliver@example.com", password = "welcome") => {
    cy.login(email, password, path);
  }
);
```

Both the custom commands i.e. `loginViaUI` and `login` are used for different
purposes. For testing the login functionality we use the `loginViaUI` command.
Please note that the command `loginViaUI` here is just for an example. We don't
need to create it as a command always unless it's needed in many places.

In most of the web applications, the user needs to be logged in. If we write
tests using `loginViaUI`, for every test it's going to take much more time to
run the tests. So, we use `login` custom command which will skip the UI and log
in programmatically via request.

Let's take another test step that is often repeated in the automation flow:

```javascript
Cypress.Commands.add("clearAndType", (selector, text) => {
  cy.get(selector).clear().type(text);
});

// Usage
cy.clearAndType("login-email-field", "a-random-email@gmail.com");
```

This custom command clears out the previously written text and then typing the
new text inside any text field.
