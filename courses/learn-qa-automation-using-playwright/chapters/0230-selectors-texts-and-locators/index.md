In the previous chapter we learned about [extracting hardcoded selectors and texts to constants](https://courses.bigbinaryacademy.com/learn-qa-automation-using-playwright/best-practices/#9-move-hardcoded-selectors-and-texts-to-respective-constant-folders).
But what is the difference between a selector and a text? And how are they different from a
[locator](https://courses.bigbinaryacademy.com/learn-qa-automation-using-playwright/locators/)?

Let's see the difference between these three with the help of an example. Consider this button in
the UI.

<image alt="Button on the UI on top and its HTML code on the bottom">
  playwright-button-with-dom-structure.png
</image>

In the image above, we can see a button on the UI with its HTML code on the bottom. In this
button:

- `[data-testid="login-submit-button"]` is the selector.
- `Sign In` is the text.
- `page.locator('[data-testid="login-submit-button"]')` is the locator.

By this example we can understand the following:

- A selector is similar to a search query to locate an element on the DOM tree. In the above
  example, the button has a data-testid of `login-submit-button` which can be used to uniquely
  identify the element on the DOM tree. If we set `data-testid` as our test ID
  attribute in the Playwright configuration (which it is by default), then `login-submit-button`
  will be the selector for the element. If we use a different test ID attribute then the
  selector would be `[data-testid="login-submit-button"]`.

- A text is something which is visually presented to the user on the UI. It can be a
  paragraph or the label of a button or an input box. In the example above, the button has a
  label of `Sign In`. This means that the text in this case is `Sign In`.

- A locator is an alias we use in Playwright which is used to reference one or more elements on
  a page in Playwright. It has a `Locator` datatype and has a set of methods and actions associated with
  them, which when used can have an impact on the Playwright script or the application itself. We use a
  selector or a text to construct a locator. In the example above we can use the selector to construct
  the locator using the line `page.locator('[data-testid="login-submit-button"]')` or
  `page.getByTestId("login-submit-button")` depending on the data test ID attribute we have
  configured.

So a test which asserts the label of the above button will look like this:

```ts
// constants/selectors/login.ts

export const LOGIN_SELECTORS = {
  loginButton: "login-submit-button",
};

// constants/texts/login.ts

export const LOGIN_TEXTS = {
  loginButton: "Sign In",
};

// tests/login.spec.ts

import { test, Locator, expect } from "@playwright/tests";

import { LOGIN_SELECTORS } from "../constants/selectors/login.ts";
import { LOGIN_TEXTS } from "../constants/texts/login.ts";

test("should verify the label of the button", async ({ page }) => {
  const loginLocator: Locator = page.getByTestId(LOGIN_SELECTORS.loginButton);
  await expect(loginLocator).toHaveText(LOGIN_TEXTS.loginButton);
});
```

The example given above is a case where we use invisible attributes such as
data test IDs or CSS selectors such as classname, id etc. to locate an element.
In some other cases, we don't have this convenience and might have to resort to
text based locator resolution methods such as `getByText` or `getByPlaceholder`.
Let's take the same example as above but without the `data-testid` attribute.

<image alt="Button without a test id on the UI on top and its HTML code on the bottom">
  playwright-button-with-dom-structure-without-test-id.png
</image>

In this case the best way to resolve the button would be using the `getByRole`
method and use the name option to filter the button. The following statement
can be used to implement the same in Playwright. 

```ts
page.getByRole("button", { name: "Sign In" });
```

Here the text `Sign In` acts as a text as well as a selector. So should we
extract it out as a selector or a text?

The answer is in the definition of the term `text` given above.
**_A text is something which is visually presented to the user on the UI._** This means
that `Sign In` should still be categorized as a text since its "visually
presented to the user". So the Playwright code to verify the button will look
like this.

```ts
// constants/texts/login.ts

export const LOGIN_TEXTS = {
  loginButton: "Sign In",
};

// tests/login.spec.ts

import { test, Locator, expect } from "@playwright/tests";

import { LOGIN_TEXTS } from "../constants/texts/login.ts";

test("should verify the label of the button", async ({ page }) => {
  const loginLocator: Locator = page.getByRole("button", {
    name: LOGIN_TEXTS.loginButton,
  });

  // Not asserting toHaveText here because we have already filtered the element using the text.
  await expect(loginLocator).toBeVisible();
});
```

There is nothing to commit in this chapter. If you have made some changes to the code
then reset it by executing the following command.

```bash
git clean -fd
```