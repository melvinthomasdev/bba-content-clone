Playwright locators are a way of finding and interacting with elements on a web page. These can be used to perform actions, such as clicking, filling, checking, etc., or assertions, such as expecting text, visibility, or state.

## Built in locators

**page.getByRole():** To locate by explicit and implicit accessibility attributes.

```js
await page.getByRole("button", { name: "Submit" }).click();
```

**page.getByText():** To locate by text content.

```js
const header = await page.getByText("Welcome");
```

**page.getByLabel():** To locate a form control by associated label's text.

```js
await page.getByLabel("Email").fill("oliver@example.com");
```

**page.getByPlaceholder():** To locate an input by placeholder.

```js
await page.getByPlaceholder("Enter email").fill("oliver@example.com");
```

**page.getByAltText():** To locate an element, usually image, by its text alternative.

```js
await page.getByAltText("logo").click();
```

**page.getByTitle():** To locate an element by its title attribute.

```js
await expect(page.getByTitle("Issues count")).toHaveText("25 issues");
```

**page.getByTestId():** To locate an element based on its data-testid attribute (other attributes can be configured).

```js
await page.getByTestId("button").click();
```

Testing by test ids is the most resilient way of testing as even if the text or role of the attribute changes, test will still pass.
By default, `page.getByTestId()` will locate elements based on the `data-testid` attribute, but we can configure it in our test config.

In BigBinary, we've consistently applied the `data-cy` label to nearly every element as part of automating tests using Cypress. And for the same reason, we have configured the testing setup to utilize this attribute for reliable and consistent test identification.

```js
// playwright.config.ts

import { defineConfig } from "@playwright/test";

export default defineConfig({
  // ...other configurations
  use: {
    testIdAttribute: "data-cy",
  },
});
```

If we absolutely must use CSS locators in the absence of `data-cy` attributes, we can use `page.locator()` to create a locator that takes a selector describing how to find an element in the page.

```js
const parentElement = page.locator("#parent");
```

This is a theoretical chapter. There is nothing to commit in here. If you have made some changes to the project, clean them up by executing the 
following command.

```bash
git clean -fd
```