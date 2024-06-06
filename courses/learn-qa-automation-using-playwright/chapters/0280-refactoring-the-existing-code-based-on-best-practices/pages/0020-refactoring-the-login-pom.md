In the login POM we can observe two improvements that can be made:

1. Move all selectors to constants
2. Convert the parameter type to an interface

Let's start with the first one. In the method `loginAndVerifyUser` we are dealing
with two pages. The login page and the dashboard where we verify the navbar to
ensure we have properly logged in. So let's create a `constants` directory,
create a `selectors` directory within that and create two files called `login.ts`
and `dashboard.ts` where we will be moving all these constants. We will also
create an `index.ts` file inside the `selectors` directory which will export all
the selector exports from a single file to make the imports easier.

```bash
mkdir e2e/constants
mkdir e2e/constants/selectors
touch e2e/constants/selectors/login.ts
touch e2e/constants/selectors/dashboard.ts
touch e2e/constants/selectors/index.ts
```

Now lets start moving all the constants there.

```ts
// e2e/constants/selectors/dashboard.ts

export const NAVBAR_SELECTORS = {
  usernameLabel: "navbar-username-label",
  logoutButton: "navbar-logout-link",
};
```

```ts
// e2e/constants/selectors/login.ts

export const LOGIN_SELECTORS = {
  emailField: "login-email-field",
  passwordField: "login-password-field",
  loginButton: "login-submit-button",
};
```

```ts
// e2e/constants/selectors/index.ts

import { NAVBAR_SELECTORS } from "./dashboard";
import { LOGIN_SELECTORS } from "./login";

export { NAVBAR_SELECTORS, LOGIN_SELECTORS };
```

```ts
// e2e/poms/login.ts

import { Page, expect } from "@playwright/test";
import { LOGIN_SELECTORS, NAVBAR_SELECTORS } from "../constants/selectors";

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
    await this.page.getByTestId(LOGIN_SELECTORS.emailField).fill(email);
    await this.page.getByTestId(LOGIN_SELECTORS.passwordField).fill(password);
    await this.page.getByTestId(LOGIN_SELECTORS.loginButton).click();

    await expect(
      this.page.getByTestId(NAVBAR_SELECTORS.usernameLabel)
    ).toContainText(username);
    await expect(
      this.page.getByTestId(NAVBAR_SELECTORS.logoutButton)
    ).toBeVisible();
  };
}
```

Now let's deal with the second action item. Let's convert the parameter type to
an interface. It's always better to define the types of objects as interfaces
when dealing with objects having more than two keys since it can improve the
code readability.

```ts
// e2e/poms/login.ts

import { Page, expect } from "@playwright/test";
import { LOGIN_SELECTORS, NAVBAR_SELECTORS } from "../constants/selectors";

interface LoginPageProps {
  email: string;
  password: string;
  username: string;
}

export default class LoginPage {

  page: Page;
  
  constructor(page: Page) {
    this.page = page;
  }

  loginAndVerifyUser = async ({
    email,
    password,
    username,
  }: LoginPageProps): Promise<void> => {
    await this.page.getByTestId(LOGIN_SELECTORS.emailField).fill(email);
    await this.page.getByTestId(LOGIN_SELECTORS.passwordField).fill(password);
    await this.page.getByTestId(LOGIN_SELECTORS.loginButton).click();

    await expect(
      this.page.getByTestId(NAVBAR_SELECTORS.usernameLabel)
    ).toContainText(username);
    await expect(
      this.page.getByTestId(NAVBAR_SELECTORS.logoutButton)
    ).toBeVisible();
  };
}
```

There is one additional item we can improve in this code which is regarding the
declaration and initialization of class variables. In the code above we have
written 3 lines of code just for declaring and initializing the `page` class
variable. TypeScript provides us a short-hand notation to avoid this repetition
by just adding an access modifier to the constructor parameter.

```ts
// e2e/poms/login.ts

import { Page, expect } from "@playwright/test";
import { LOGIN_SELECTORS, NAVBAR_SELECTORS } from "../constants/selectors";

interface LoginPageProps {
  email: string;
  password: string;
  username: string;
}
export default class LoginPage {
  constructor(private page: Page) {}

  loginAndVerifyUser = async ({
    email,
    password,
    username,
  }: LoginPageProps): Promise<void> => {
    await this.page.getByTestId(LOGIN_SELECTORS.emailField).fill(email);
    await this.page.getByTestId(LOGIN_SELECTORS.passwordField).fill(password);
    await this.page.getByTestId(LOGIN_SELECTORS.loginButton).click();

    await expect(
      this.page.getByTestId(NAVBAR_SELECTORS.usernameLabel)
    ).toContainText(username);
    await expect(
      this.page.getByTestId(NAVBAR_SELECTORS.logoutButton)
    ).toBeVisible();
  };
}
```

We can see that we avoided a lot of boilerplate code by this short-hand.

The reason why we specify a `private` modifier instead of `public` here is because
the `page` class variable is not usually accessed outside the POM. So there is
no need to make it public. If need arises that we need to access some class
variables outside the POM, then we have to define the constructor parameter with
a `public` access modifier.

Another thing to note is that this short-hand is only applicable for constructors
with positional parameters like the one above and NOT in constructors with named
parameters. (Refer [this article](https://ee2e/xploringjs.com/es6/ch_parameter-handling.html#sec_named-parameters) to learn more about positional and names
parameters)
