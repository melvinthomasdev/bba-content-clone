In this spec, we can observe the following improvements that can be made:

1. Move hard-coded strings to selectors.
2. Use relative URLs instead of absolute URLs.
3. Wrap the steps in proper test blocks.
4. Use proper beforeEach hook to handle the test setup.

Since we are familiar with all four of these best practices, let's implement
them in our code.

```ts
// e2e/constants/selectors/login.ts

export const LOGIN_SELECTORS = {
  emailField: "login-email-field",
  passwordField: "login-password-field",
  loginButton: "login-submit-button",
  registerButton: "login-register-link",
};
```

```ts
// e2e/constants/selectors/signup.ts

export const SIGNUP_SELECTORS = {
  nameField: "signup-name-field",
  emailField: "signup-email-field",
  passwordField: "signup-password-field",
  passwordConfirmationField: "signup-password-confirmation-field",
  signupButton: "signup-submit-button",
};
```

```ts
// e2e/constants/selectors/index.ts

import { CREATE_TASK_SELECTORS } from "./createTask";
import { NAVBAR_SELECTORS, TASKS_TABLE_SELECTORS } from "./dashboard";
import { LOGIN_SELECTORS } from "./login";
import { SIGNUP_SELECTORS } from "./signup";

export {
  NAVBAR_SELECTORS,
  LOGIN_SELECTORS,
  TASKS_TABLE_SELECTORS,
  CREATE_TASK_SELECTORS,
  SIGNUP_SELECTORS,
};
```

```ts
// e2e/tests/register.spec.ts

import { LOGIN_SELECTORS, SIGNUP_SELECTORS } from "../constants/selectors";
import { test } from "../fixtures";
import { faker } from "@faker-js/faker";

test.describe("Register page", () => {
  let username: string, email: string, password: string;

  test.beforeEach(() => {
    username = faker.person.fullName();
    email = faker.internet.email();
    password = faker.internet.password();
  });

  test("should register a new user", async ({ page, loginPage }) => {
    await test.step("Step 1: Visit register page", async () => {
      await page.goto("/");
      await page.getByTestId(LOGIN_SELECTORS.registerButton).click();
    });

    await test.step("Step 2: Fill user details and credentials", async () => {
      await page.getByTestId(SIGNUP_SELECTORS.nameField).fill(username);
      await page.getByTestId(SIGNUP_SELECTORS.emailField).fill(email);
      await page.getByTestId(SIGNUP_SELECTORS.passwordField).fill(password);
      await page
        .getByTestId(SIGNUP_SELECTORS.passwordConfirmationField)
        .fill(password);
      await page.getByTestId(SIGNUP_SELECTORS.signupButton).click();
    });

    await test.step("Step 3: Verify newly created user", () =>
      loginPage.loginAndVerifyUser({ email, password, username }));
  });
});
```
