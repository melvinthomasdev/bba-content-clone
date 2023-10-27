- Cypress provides us with a feature to drive the data from external sources. We
  can draw a comparison to the Data-Driven Frameworks, which are one of the
  popular automation testing framework types. Cypress has provided the same
  functionality in its architecture, where we can read the data from external
  files known as fixture files.
- Fixtures are basically files which contains some data that we would like to
  use in our test.
- These files could be of any type (i.e
  `.json, .js, .txt, .csv, .jpg, .html and so on`). The default location to
  store these files is in fixtures folder which is already present under
  cypress.
- When no extension is passed to cy.fixture(), Cypress will search for files
  with the specified file name within the fixtures folder and resolve the first
  one in the following order:

```
fileName.json
fileName.js
fileName.txt
fileName.csv
fileName.png
fileName.jpg
fileName.jpeg
```

So, whenever we want to store an object in fixtures and use it in our test
cases, we can create a `json` file.

For example, consider a `json` file under cypress folder which holds credentials
for login into the application.

```javascript
// fixtures/credentials/admin.json

{
  email: "admin@example.com",
  password: "admin123"
}
```

This is how we will use the fixture file in our test:

```javascript
describe("Login", () => {
  test("should be able to login", () => {
    cy.visit("/");
    cy.fixture("credentials/admin").then(user => {
      cy.get("[data-cy='login-email-field']").type(user.email);
      cy.get("[data-cy='login-password-field']")
        .type(user.password);
    });
    cy.get("[data-cy='submit-button']").click();
  });
});
```

This approach is fine when we want to use data from fixture file at a single
place. But if we want to use file data multiple times, what we will do? We could
make our code do some ugly backflips using `let` to get access to it.

```javascript
// Don't do this

describe("Admin login", () => {
  let userDetails;

  beforeEach(() => {
    cy.fixture("credentials/admin").then(user => {
      userDetails = user;
    });
  });

  test("should be able to login", () => {
    cy.get("[data-cy='login-email-field']").type(userDetails.email);
    cy.get("[data-cy='login-password-field']").type(userDetails.password);
    cy.get("[data-cy='submit-button']").click();
  });
});
```

Fortunately, we don't have to make our code do backflips. With Cypress, we can
better handle these situations. We can use `aliases` for sharing context. To
alias something, we can use the `.as()` command.

Let's look at our previous example with aliases.

```javascript
// Proper method

describe("Admin login", () => {
  beforeEach(() => {
    cy.fixture("credentials/admin").as("userDetails");
  });

  test("should be able to login", () => {
    cy.get("@userDetails").then(userDetails => {
      cy.get("[data-cy='login-email-field']").type(userDetails.email);
      cy.get("[data-cy='login-password-field']")
        .type(userDetails.password);
      cy.get("[data-cy='submit-button']").click();
    });
  });
});
```

Remember that `.as()` is an asynchronous method. So we must use
other asynchronous commands such as `.then()` to access what we've aliased.

So now if we want to use fixture data in multiple tests, we can simply do that
by using the alias.
