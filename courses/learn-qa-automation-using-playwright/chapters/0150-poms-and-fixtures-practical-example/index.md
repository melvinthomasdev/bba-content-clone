## Writing tests for the user registration page

Let's continue with our project by automating the registration page. We are already familiar with how to find a locator and write the tests for a page which we will use here.

<image>playwright-granite-signup-page.png</image>

The steps required to automate the registration process would be.

1. Go to the login page
2. Click on the `Register Now` link
3. Enter the name
4. Enter the email
5. Enter the password
6. Confirm the password
7. Click on the `Register` button
8. In the login page, enter the email
9. Enter the password
10. Click on the `Login` button
11. Confirm the username in navbar
12. Confirm the `LogOut` button in navbar

So let's write the tests for this scenario.

```bash
touch e2e/tests/register.spec.ts
```

```ts
//register.spec.ts

import { test, expect } from "@playwright/test";

test.describe("Register page", () => {
  test("should register a new user", async ({ page }) => {
    await page.goto("http://localhost:3000/");
    await page.getByTestId("login-register-link").click();
    await page.getByTestId("signup-name-field").fill("Local User");
    await page.getByTestId("signup-email-field").fill("localuser@example.com");
    await page.getByTestId("signup-password-field").fill("welcome");
    await page
      .getByTestId("signup-password-confirmation-field")
      .fill("welcome");
    await page.getByTestId("signup-submit-button").click();
    await page.getByTestId("login-email-field").fill("localuser@example.com");
    await page.getByTestId("login-password-field").fill("welcome");
    await page.getByTestId("login-submit-button").click();
    await expect(page.getByTestId("navbar-username-label")).toContainText(
      "Local User"
    );
    await expect(page.getByTestId("navbar-logout-link")).toBeVisible();
  });
});
```

Now execute this test. Great! This passes.

But try executing this again. It will fail with the error stating the `Email has already been taken.`

## Using faker to generate random data

Lets modify the test to use faker. Faker creates randomized values for real-world entities which resemble their original counter-parts. Using faker solves the issue of the same email being used again for the registration process. For this add faker into our Playwright project.

```bash
yarn add @faker-js/faker
```

Now lets use faker to generate the user credentials.

```ts
//register.spec.ts

import { test, expect } from "@playwright/test";
import { faker } from "@faker-js/faker";

test.describe("Register page", () => {
  test("should register a new user", async ({ page }) => {
    const newUserName = faker.person.fullName();
    const newUserEmail = faker.internet.email();
    const newUserPassword = faker.internet.password();

    await page.goto("http://localhost:3000/");
    await page.getByTestId("login-register-link").click();
    await page.getByTestId("signup-name-field").fill(newUserName);
    await page.getByTestId("signup-email-field").fill(newUserEmail);
    await page.getByTestId("signup-password-field").fill(newUserPassword);
    await page
      .getByTestId("signup-password-confirmation-field")
      .fill(newUserPassword);
    await page.getByTestId("signup-submit-button").click();
    await page.getByTestId("login-email-field").fill(newUserEmail);
    await page.getByTestId("login-password-field").fill(newUserPassword);
    await page.getByTestId("login-submit-button").click();
    await expect(page.getByTestId("navbar-username-label")).toContainText(
      newUserName
    );
    await expect(page.getByTestId("navbar-logout-link")).toBeVisible();
  });
});
```

Now the tests should pass in all the runs.

## Introducing POMs

If we observe the test for register, we see that the last five steps are the same as the steps in the login spec. We should try and uphold the Do not Repeat Yourself (DRY) convention as much as possible. This is where Page Objects Models come into play. Lets extract the logic for the login spec into a POM.

For this create a new directory called `poms` and add a `login.ts` file in it.

```bash
mkdir e2e/poms
touch e2e/poms/login.ts
```

Now extract the logic for the login operation into the `login.ts` file.

```ts
// poms/login.ts
import { Page, expect } from "@playwright/test";

export default class LoginPage {
  page: Page;
  constructor(page: Page) {
    this.page = page;
  }

  loginAndVerifyUser = async ({
    email,
    password,
    username,
  }: {
    email: string;
    password: string;
    username: string;
  }): Promise<void> => {
    await this.page.getByTestId("login-email-field").fill(email);
    await this.page.getByTestId("login-password-field").fill(password);
    await this.page.getByTestId("login-submit-button").click();
    await expect(this.page.getByTestId("navbar-username-label")).toContainText(
      username
    );
    await expect(this.page.getByTestId("navbar-logout-link")).toBeVisible();
  };
}
```

Now lets create an instance of this class in the `register.spec.ts` file.We will have to pass in the page context during the object instantiation since fixtures are not accessible outside test files.

```ts
// register.spec.ts

import { test, expect } from "@playwright/test";
import { faker } from "@faker-js/faker";
import LoginPage from "../poms/login";

test.describe("Register page", () => {
  test("should register a new user", async ({ page }) => {
    const username = faker.person.fullName();
    const email = faker.internet.email();
    const password = faker.internet.password();
    const login = new LoginPage(page);

    await page.goto("http://localhost:3000/");
    await page.getByTestId("login-register-link").click();
    await page.getByTestId("signup-name-field").fill(username);
    await page.getByTestId("signup-email-field").fill(email);
    await page.getByTestId("signup-password-field").fill(password);
    await page.getByTestId("signup-password-confirmation-field").fill(password);
    await page.getByTestId("signup-submit-button").click();
    await login.loginAndVerifyUser({ email, password, username });
  });
});
```

We can also replace the steps in `login.spec.ts` with our new POM as well.

```ts
import { test } from "@playwright/test";
import LoginPage from "../poms/login";

test.describe("Login page", () => {
  test("should login with the correct credentials", async ({ page }) => {
    const login = new LoginPage(page);
    await page.goto("http://localhost:3000");
    await login.loginAndVerifyUser({
      email: "oliver@example.com",
      password: "welcome",
      username: "Oliver Smith",
    });
  });
});
```

Let's run all the tests

```bash
yarn playwright test --headed register login
```

## The need for fixtures

We have successfully avoided code repetition. POMs can be used to extract out any repeating logic specific to a page. The only downside is that the fixtures aren't accessible in the POMs by default. In cases such as the code above, where the number of fixtures used is less in number, it is fine to instantiate a new POM object by passing in the required fixtures. What about the case where a POM requires 4 or 5 fixtures for their proper working? We will have to pass them in during each use of the POM which is not very "DRY".

These are the cases where POMs as fixtures make a lot of sense. Let's convert the POM above into a fixture and see the difference.

Start by creating a fixtures directory and adding an index file.

```bash
mkdir e2e/fixtures
touch e2e/fixtures/index.ts
```

Lets convert the POM into a fixture.

```ts
// fixtures/index.ts

import { test as base } from "@playwright/test";
import LoginPage from "../poms/login";

interface ExtendedFixtures {
  loginPage: LoginPage;
}

export const test = base.extend<ExtendedFixtures>({
  loginPage: async ({ page }, use) => {
    const loginPage = new LoginPage(page);
    await use(loginPage);
  },
});
```

Now import the extended `test` from the fixtures in our tests and use the POM as a fixture.

```ts
// login.spec.js

import { test } from "../fixtures";

test.describe("Login page", () => {
  test("should login with the correct credentials", async ({
    page,
    loginPage,
  }) => {
    await page.goto("http://localhost:3000");
    await loginPage.loginAndVerifyUser({
      email: "oliver@example.com",
      password: "welcome",
      username: "Oliver Smith",
    });
  });
});
```

```ts
// register.spec.js

import { test } from "../fixtures";
import { faker } from "@faker-js/faker";

test.describe("Register page", () => {
  test("should register a new user", async ({ page, loginPage }) => {
    const username = faker.person.fullName();
    const email = faker.internet.email();
    const password = faker.internet.password();

    await page.goto("http://localhost:3000/");
    await page.getByTestId("login-register-link").click();
    await page.getByTestId("signup-name-field").fill(username);
    await page.getByTestId("signup-email-field").fill(email);
    await page.getByTestId("signup-password-field").fill(password);
    await page.getByTestId("signup-password-confirmation-field").fill(password);
    await page.getByTestId("signup-submit-button").click();
    await loginPage.loginAndVerifyUser({ email, password, username });
  });
});
```

Now let's see if the tests are running as expected

```bash
yarn playwright test --headed register login
```

Excellent, the tests are working as expected but with a much cleaner code. To summarize, if we have a page specific logic repeating in multiple places, we can create a Page Object Model for the page and extract the logic there. Since POMs do not have access to the test fixtures, we have to pass them in during the object instantiation. To avoid this process and make the code look cleaner, we can convert the POMs into fixtures from where we can use them without repeating the instantiation process.

Let's commit these changes.

```bash
git add -A
git commit -m "Added tests for Register page and created POMs and fixtures for Login"
```
