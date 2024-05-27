In order to make the tests more readable and manageable, we can follow the practices listed below.

# General best practices

## 1. Make tests behavioral

We can test anything on a page from the script execution, the CSS
properties used or any other technical detail using Playwright. The
question we should ask ourselves is whether it is necessary. We
should avoid testing the implementation details of an application
and instead test how a regular end user would interact with the
product. The end-user can only interact with the contents rendered in
the screen.

Consider an example scenario where, upon clicking the `Buy Now` button on a page, a new order is created."

```html
<button onclick="createOrder()">Buy Now</button>
```

Here, we should not be checking whether the `createOrder` method
executes when we click the button. Instead we should check whether a
new order was created when we click it. This is what the end user
expects when they do the same steps on the page.

Another aspect of behavioral tests is that we should not test
for every minute details. Asserting too many things can cause early
failure of a test preventing us from catching bugs on the actual
functionality.

Consider the same example as above. Assume we added a test to assert
that the button contains the text `Buy Now` and that we have asserted
that clicking the button creates a new order. Sometime during the
development, the developer changed the text of the button to `Buy`
from `Buy Now`. Our tests will fail stating the mismatch in the
assertion between the button texts. Here creation of a new order is
the actual functionality we need to check. If the order creation
process fails at some point of time, then we won't be able to catch it
because the tests have already exited due to an assertion error which
does not even matter to the end user.

## 2. Make tests isolated

An isolated test is one which is not affected by other tests and will
not affect the execution of other tests. This means that we should
avoid writing a test under the assumption that some setup or cleanup
has been done in another test.

For example consider that we have the following tests

```ts
// Incorrect

import { test } from "@playwright/test";

test.describe("Orders page", () => {
  test("should create an order", async ({ page, ordersPage }) => {
    await page.goto("/orders");
    // No orders have been created now. So create a new order.
    await ordersPage.createNewOrder();
  });

  test("should have the correct order count", async ({ page }) => {
    page.goto("/orders");
    await expect(page.getByTestId("order")).toHaveCount(1);
  });
});
```

In this test, the `Check order count` test is working in the
expectation that the `Create order` test has created a new order.
This is not recommended because, if due to some reason the
`Create order` test fails to execute completely, the `Check order count` test will also fail because the assertion that one order
exists fails.

```ts
// Correct

import { test } from "@playwright/test";

test.afterEach(({ ordersPage }) => {
  ordersPage.deleteAllOrders();
});

test.describe("Orders page", () => {
  test("should create an order", async ({ page, ordersPage }) => {
    await page.goto("/orders");
    // No orders have been created now. So create a new order.
    await ordersPage.createNewOrder();
  });

  test("should have the correct order count", async ({ page, ordersPage }) => {
    page.goto("/orders");
    await ordersPage.createNewOrder();
    await expect(page.getByTestId("order")).toHaveCount(1);
  });
});
```

In the above modification, we are deleting all orders after each test
and creating a new order in the `Check order count`. This cancels all
the dependencies between the tests.

Making tests independent can help us to:

- Prevent unexpected test failures
- Prevent flakiness in tests
- Run tests in parallel.

## 3. Avoid testing third-party dependencies

Only test what you control. Don't try to test links to external sites
or third party servers that you do not control. Not only is it time
consuming and can slow down your tests but also you can not control
the content of the page you are linking to, or if there are cookie
banners or overlay pages or anything else that might cause your test
to fail.

In unavoidable cases we can use
[Playwright Network API](https://playwright.dev/docs/network#handle-requests)
and guarantee the response needed by mocking it so that we
can safely continue with the rest of the tests.

## 4. Locators

While using locators, we should prefer using them in the following
order from most preferred to least preferred.

1. `getByTestId` (Most preferred)
2. `getByTitle`
3. `getByRole`
4. `getByLabel`
5. `getByPlaceholder`
6. `getByAltText`
7. `getByText`
8. `locator` (Avoid if possible)

We should try and use `getByTestId` in all cases possible. This
is because testing by `data-?` label (`data-testid`, `data-test`,
`data-cy` etc.) is the most resilient way to write a test as it
remains constant even when all other label values tend to change.

Similarly, we should try to avoid locating an element using the
classnames or ID locators because they are the most volatile parts of
a tag and can change even when the test is running. If a proper
`data-?` label is not available, we should try locating the element
using `getByRole` and then filtering the elements from there.

We can also chain locators to narrow down the search to the target
element as well as use filter method to get the desired element from
a set of elements. Let's see an example on how we can locate the same
element using both these approaches.

```html
<div data-testid="parent-one">
  <span title="child-element">Child 1</span>
</div>
<div data-testid="parent-two">
  <span title="child-element">Child 2</span>
</div>
```

```ts
page.getByTestId("parent-one").getByTitle("child-element"); // Returns Child 1
page.getByTitle("child-element").filter({ hasText: "Child 2" }); // Returns Child 1
```

We can always use the [Playwright codegen tool](https://playwright.dev/docs/codegen#generating-locators) to find the best
selector for an element and edit it according to our needs.

## 5. Use web first assertions

We should try and use [web first assertions](https://playwright.dev/docs/test-assertions)
as much as possible instead of asserting the
values. For example consider that a we have a success toast message
after submitting a form. We can assert its presence in two ways.

```ts
// Correct
await expect(page.getByText("success")).toBeVisible();

// Incorrect
expect(await page.getByText("success").isVisible()).toBe(true);
```

In the above example, we prefer the web first assertion
`toBeVisible()` over the value based assertion of `toBe(true)` because
the `toBeVisible()` assertion is an auto-retrying assertion. This
means that even if there is a slight delay in the toast message to
render on the screen, the `toBeVisible()` assertion retries it a few
times until a timeout. The `toBe(true)` assertion however expects the
immediate value that its asserting to be true, meaning if the toast
message did not render when the locator was initialized, the
assertion fails. So we should always prefer web first assertions to
prevent unwanted failures in tests.

## 6. Add assertions to each test

When writing a test block, we should have at least one assertion in
it. This is because writing a test without asserting anything
nullifies the whole point of testing, rendering it as good as a task
automation. Every test block should be testing something and should
not be just a series of actions.

```ts
// Incorrect

test("test without assertion", async ({ page }) => {
  await page.getByTestId("add-task-button").click();
});

// Correct

test("test without assertion", async ({ page }) => {
  await page.getByTestId("add-task-button").click();
  await expect(page.getByTestId("task-item")).toHaveCount(1);
});
```

## 7. Avoid too many nested describe, test and step blocks

Playwright provides us with the ability to define as many nested
describe or test blocks as we want. While this is useful in some
cases, abusing this feature can make the code unreadable. Limit the
maximum nesting of blocks to `two`.

## 8. Beware of missing await

Most of the methods in Playwright return a promise. This means that
we should properly await them when writing the tests. Failing to do
so can lead to flaky tests and even unexplainable errors.

## 9. Avoid conditional logic within tests

Conditional logic in tests is usually an indication that a test is
attempting to cover too much, and not testing the logic it intends
to. Each branch of code executing within a conditional statement will
usually be better served by a test devoted to it.

## 10. Avoid using element handles

Playwright page provides the element handles (`page.$` and `page.$$`)
which returns the DOM element directly instead of returning a locator
element. These methods should be avoided because they are deprecated
and also because locators provide a much broader set of actions as
compared to the elements.

```ts
// Incorrect

const buttonHandle = await page.$("button");
await buttonHandle.click();

// Correct
const buttonLocator = page.locator("button");
await buttonLocator.click();
```

## 11. Avoid using { force: true }

In some cases, the element we are trying to interact with might not
be interactable. In such cases, we might have a urge to use
`{ force: true }` in the options to get the test working. But this is
not actually testing the application from a user's standpoint. When
using the `force` option, we are instructing Playwright to execute the
user event even if the element is not visible, or it is being covered
by another element or even if it is disabled. This can lead to false
positives in tests where the tests might be passing but the feature
might be failing for an end-user.

## 12. Avoid waiting for networkidle

In cases when we wait for a page to load in we should not use the
`networkidle` option as shown below.

```ts
// Avoid

await page.waitForLoadState("networkidle");
await page.waitForURL("...", { waitUntil: "networkidle" });
await page.goto("...", { waitUntil: "networkidle" });
```

The `networkidle` option waits until there are no network connections
for at least 500 ms. This is not realistic since we can have web
sockets or background APIs in applications and this can cause the
tests to remain idle indefinitely.

## 13. Avoid using nth-methods

```ts
// Avoid

page.locator("button").first();
page.locator("button").last();
page.locator("button").nth(3);
```

The above mentioned methods are the nth methods. We should avoid
using them in tests since DOM updates can trigger re-ordering of
elements causing the tests to fail or become flaky. We can instead
use filters and chaining to find an element.

## 14. Double check before using negative assertions

Consider an example where we want to check whether an element is not
visible on the screen. We may write the test like this.

```ts
// Incorrect

await expect(locator).not.toBeVisible();
```

This works fine, but there is a better alternative available.

```ts
// Correct

await expect(locator).toBeHidden();
```

This looks good in terms of readability. But there are cases when
negative assertions can be wrong as well. Not all assertions are
boolean. For example consider a test where we are asserting that not
even one element matching a locator exists. We can write it in two
ways.

```ts
// Incorrect

await expect(locator).not.toHaveCount(1);

// Correct

await expect(locator).toHaveCount(0);
```

If no element if present on the screen both the assertions pass. But
if more than one element is present on the screen, then the first
assertion passes, throwing a false positive, and the second one fails.

## 15. Avoid waitForTimeout

We should avoid hard timeouts wherever possible as it delays the test
execution unnecessarily. We can use web first assertions to check for
some other dependent factor for continuing with our tests so that we
can move along with the test as soon as a dependency is resolved.

## 16. Prefer strict equality assertions

```ts
// Incorrect

await expect({ a: "a", b: undefined }).toEqual({ a: "a" }); // true

// Correct

await expect({ a: "a", b: undefined }).toStrictEqual({ a: "a" }); // false
```

Consider the above example. When using the `toEqual` method on an
object, it returns true if the structure is similar. (Setting the
value of a key to undefined evaluates the object to not have that
key). Instead Using the `toStrictEqual` operator can catch the
differences in the object shapes much more reliably.

## 17. No need of common assertions for actionable elements before performing actions

Playwright makes sure that an element is actionable before performing a user event on it. So we can avoid code like:

```ts
// Incorrect

await expect(locator).toBeVisible();
await locator.click();

// Correct

await locator.click();
```

## 18. Prefer `{exact: true}` for locator matching

When using locator methods such as `getByRole`, we usually use an additional parameter such as name for matching the
elements with precision.

Eg: `page.getByRole("button", {name: "Submit"});`

While this narrows down the locators significantly, it still is not perfect since it matches the substring of the name
we provide by default. This means that if we use the method above to match a button in a page containing two buttons
having texts `Submit Answer` and `Submit Quiz` respectively, it will resolve to two elements instead of one resulting in test
failure. To avoid this, we can pass in the `{exact: true}` option which will only consider the elements that
exactly match the criteria we specify.

```ts
// Incorrect
page.getByRole("button", { name: "Submit" }); // Resolves to "Submit Answer" and "Submit Quiz" buttons

// Correct
page.getByRole("button", { name: "Submit Answer", exact: true }); // Resolves only to "Submit Answer"
```

Consider an orders page in an application. It might contain the elements to place a new order, show the history of
delivered orders and much more. In such cases using exact matching helps us resolve to the desired element easily.

```ts
// Incorrect
page.getByText("Order"); // Resolves to all texts containing the term Order, Orders, New Orders, Delivered Orders etc.

// Correct

page.getByText("Order", { exact: true }); // Resolves only to texts containing the exact term Order.
```

# BigBinary best practices

## 1. Use proper step blocks

We should try and use proper `step` blocks to describe what a group of
statements do in a step. We should prefix the step description
with the proper step number as well. This helps us to identify the
test failures much easily and also generates the reports in a format
that even people unfamiliar with Playwright can read.

```ts
test("should be able to place an order", ({ page, loginPage, ordersPage }) => {
  await test.step("Step 1: Login to the application", loginPage.loginViaUI);
  await test.step("Step 2: Create new order", () =>
    ordersPage.createOrders({ item: "Smartphone" }));
  await test.step("Step 3: Assert a new order was created", async () => {
    const orders = page.getByTestId("order");
    await expect(orders).toHaveCount(1);
  });
});
```

## 2. Wait for the API responses

In a case that we have an API request associated with a user event,
we should wait for the API response to arrive before moving on with
the tests to avoid flakiness. There can also be cases where we have
multiple API calls associated with a user action. In such cases we
have created a custom method called `interceptMultipleResponses`
which can intercept and wait for the completion of multiple request
to the same URL pattern.

```ts
const fetchOrder = page.waitForResponse(/orders/i);
await page.getByTestId("submit-order-button").click();
await fetchOrder;
```

```ts
const fetchOrders = neetoPlaywrightUtilities.interceptMultipleResponses({
  url: "/orders/",
});
await page.getByTestId("submit-order-button").click();
await fetchOrders;
```

## 3. Use utils and methods from neeto-playwright-commons

We have a set of utils and helper methods which have been defined in
[neeto-playwright-commons](https://github.com/bigbinary/neeto-playwright-commons) npm package.
We should try and reuse this existing logic instead of repeating it,
in each application. If a logic is applicable to multiple products we
should extract it to the package as well.

## 4. Use i18n locales when asserting texts

In BigBinary, we have setup i18n in Playwright using the same
translation strings that are being used in the products. When asserting
strings, we should always use translations instead of hardcoded
texts. This is because, the texts on screen are prone to
changes as the application matures. This can lead to
unintentional test failures for minor changes in the product
leaving any major bugs in the product being uncaught due to
early failures. Using i18n translations for textual assertions
can make the tests more resilient towards minor changes in the
product texts causing test failures.

```ts
// Incorrect

await expect(this.page.getByTestId("orders-count-label")).toContainText(
  "1 Order"
);

// Correct

await expect(this.page.getByTestId("orders-count-label")).toContainText(
  this.t("common.countOf.pendingOrders", { count: 1 })
);
```

The above example shows how the same code can be written with
and without i18n translations. Consider the case that the
developer decides to change the text from **"1 Order"** to
**"1 pending Order"**. They should be making this minor change
in the same translation string. This means that once this
change occurs, asserting without i18n will cause the tests to
fail requiring intervention from the automation team whereas
the second approach using i18n will take this change into
account automatically.

## 5. Avoid string interpolation with translations

Suppose we have a sentence - I have a {color} car. If we try to asssert this text on the UI with interpolation of translations as shown below, we will get flaky results:

```js
await expect(page.getByTestId(HOME_SELECTORS.header)).toHaveText(
  `${t("common.iHaveA")} ${color} ${t("comon.car")}`
);
```

This arrangement can be problematic when translating from one language to another because the order of words may change. For example, if the variable color has the value red and we are translating the corresponding sentence into Spanish keeping the same word order, it will be Tengo un rojo coche. However, this translation is incorrect since the adjective rojo (red) precedes the noun coche (car), which goes against the usual word order in Spanish. Adjectives in Spanish typically come after the noun whereas in English, they typically come before the noun.

Therefore we should stick to using a single translated string which inturn contains the interpolation.

```js
await expect(page.getByTestId(HOME_SELECTORS.header)).toHaveText(
  t("common.iHaveAColorCar", { color: t("common.red") })
);
```

```js
// English
// en.json
{
  "iHaveACar": "I have a {{color}} car"
}

// Spanish
//es.json
{
  "iHaveACar": "Tengo un coche {{color}}"
}
```

## 6. Avoid redundant awaits when nesting async methods

Consider you have an asynchronous POM method called `createNewUser` in the `userPage` fixture which creates a new user. This can be called likewise.

```ts
test("should create new user", async ({ page, userPage }) => {
  await userPage.createNewUser();
  await expect(page.getByTestId("user-profile-icon")).toBeVisible();
});
```

We have already learned that we should add the proper steps to describe what each action is doing. So we can refactor the code with the proper step blocks.

```ts
test("should create new user", async ({ page, userPage }) => {
  await test.step("Step 1: Create new user", async () => {
    await userPage.createNewUser();
  });
  await test.step("Step 2: Assert profile icon to be visible", async () => {
    await expect(page.getByTestId("user-profile-icon")).toBeVisible();
  });
});
```

**The above code demonstrates redundant awaits and is incorrect.**

Let's see how we can write some of the commonly found blocks without redundant awaits.

```ts
// Incorrect

test("should create new user", async ({ page, userPage }) => {
  await test.step("Step 1: Create new user", async () => {
    await userPage.createNewUser();
  });
});

// Correct
test("should create new user", async ({ page, userPage }) => {
  await test.step("Step 1: Create new user", userPage.createNewUser);
});
```

In the example given above, we are calling a method `createNewUser` from the step block which
accepts no parameters. Since the second parameter of the step block has to be a function type,
instead of defining an [IIFE](https://courses.bigbinaryacademy.com/learn-javascript/immediately-invoked-function-expression/iife/)
we can directly pass the `createNewUser` method into the step block.

```ts
// Incorrect

test("should create new user", async ({ page, userPage }) => {
  await test.step("Step 1: Create new user", async () => {
    await userPage.createNewUser({ name: "Oliver Smith" });
  });
});

// Correct
test("should create new user", async ({ page, userPage }) => {
  await test.step("Step 1: Create new user", () =>
    userPage.createNewUser({ name: "Oliver Smith" }));
});
```

In the example given above, we are calling an async method called `createNewUser`
which expects an argument to be passed in. Since we cannot specify the arguments if
we directly pass the method as the second parameter of the step block, we have to wrap
it in an IIFE. But instead of making the IIFE an async method and awaiting the promise
within it, we can return the called method from the IIFE which would give us the same
result avoiding the redundant awaits.

```ts
// Correct

test("should create new user", async ({ page, userPage }) => {
  await test.step("Step 1: Create new user", async () => {
    await userPage.createNewUser({ name: "Oliver Smith" });
    await expect(page.getByTestId("user-profile-icon")).toBeVisible();
  });
});
```

In the example above, we are dealing with two promises which need to be executed in
order. The profile icon will only be visible if the user was created. So we have to wait
till the first promise has completed execution before we begin the second one, hence
the need for two await statements.

```ts
// Incorrect

test("should create new user", async ({ page, userPage }) => {
  await test.step("Step 1: Create new user", async () => {
    await expect(page.getByTestId("user-profile-icon")).toBeVisible();
    await expect(page.getByTestId("user-name")).toHaveText("Oliver Smith");
  });
});
```

```ts
// Correct

test("should create new user", async ({ page, userPage }) => {
  await test.step("Step 1: Create new user", async () =>
    Promise.all([
      expect(page.getByTestId("user-profile-icon")).toBeVisible(),
      expect(page.getByTestId("user-name")).toHaveText("Oliver Smith"),
    ]));
});
```

In the above example, we have two promises which are independent of each
other. This means the order of execution of statements does not matter.
In such cases, instead of awaiting for each promise to complete execution
before moving to the next, we can use the `Promise.all` method to execute
both the Promises in parallel and move forward when both of them finish
execution. `Promise.all` method accepts an array of promises and returns
a promise itself which is resolved when all the promises in the array are
resolved and rejected if any of the promises are rejected.

Doing this makes sure that we are not unnecessarily waiting for the completion
of a Promise to move on with the next one which increases the performance.
This also allows us to remove redundant awaits making the code cleaner.

Checkout this [video](https://s-varun.neetorecord.com/watch/2b4d390a-2df2-4661-881d-a46f8a0a0a5d)
demonstrating how we can avoid redundant awaits.

## 7. Avoid adding sensitive data into git tracked env files

In BigBinary, we deal with a lot of automation tests involving
integrations and logins. For these tests we need access to sensitive
information such as API keys and login credentials which should not be
git tracked files. In such cases we should add them as environment
variables. These environment variables should not be added in any git
tracked files because checking in these secrets in a git repository
defeats the purpose of it being a secret.

Instead we should add these variables as the environment variables in
the CI environment ([neetoCI](https://www.neeto.com/neetoci) in our
case). This will make sure that these secrets are visible only to the
people with proper permissions.

In the development environment have made an additional configuration
to merge all the env variables with the variables defined in the
`.env.local` file. This file is not tracked by git in any of the neeto
products and we can add any sensitive information we need to add for
local testing in this file.

## 8. Avoid destructuring fixtures in tests

Consider a case where we have a POM fixture call `loginPage` and it
has the method `loginNewUser()` to login a new user. When writing the
test we might have the tendency to do something like this.

```ts
// Incorrect

test("should login a new user", async ({
  page,
  loginPage: { loginNewUser },
}) => {
  await test.step("Step 1: Login new user", loginNewUser);
  await test.step(
    "Step 2: Assert that user has logged in",
    expect(page.getByTestId("user-profile-icon")).toBeVisible
  );
});
```

While this seems perfectly fine for a small test such the one shown
above, this becomes too complicated too fast due to the following
reasons.

- In larger tests we will have to depend on multiple fixtures for
  multiple methods. This will drastically increase the amount of methods
  we destructure in the test definition to the point where it becomes
  unreadable.

- When dealing with multiple fixtures, there might be a chance that
  there are methods with the same name defined in them. For example
  consider that there are two fixtures for `ordersPage` and
  `productsPage` and both of them have the same method
  `searchAndVerifyItem`. To avoid a conflict we will have to destructure
  the methods using property assignment and the test definition will be
  filled with destructuring logic.

```ts
test("should create a new order", async ({
  productsPage: { searchAndVerifyItem: searchAndVerifyProduct },
  ordersPage: { searchAndVerifyItem: searchAndVerifyOrders },
}) => {});
```

- One of the main reasons to avoid destructing is readability and
  context. Using the fixture method without destructing gives the person
  reading the test a better idea about the page in which each operation
  is taking place. This is much more important when dealing with
  multi-page tests since its vital to keep track of which page each the
  operations are taking place especially in bigger specs.

```ts
// Incorrect

test("should login a new user", async ({
  productsPage: { searchAndVerifyItem },
  ordersPage: { createNewItem },
}) => {
  await searchAndVerifyItem();
  await createNewItem();
  /*
   * Here the person reading the code has to go through the test
   * definition to understand whether the searchAndVerifyItem() method
   * is being done for the products or for the orders.
   */
});

// Correct

test("should login a new user", async ({ productsPage, ordersPage }) => {
  await productsPage.searchAndVerifyItem();
  await ordersPage.createNewItem();
  /*
   * Here the person reading the code has clear understanding that
   * the searchAndVerifyItem() method is being executed for the
   * products page and the createNewItem() method is being executed
   * for the orders page.
   */
});
```

## 9. Move hardcoded selectors and texts to respective constant folders.

It's a good practice to centralize constants like selectors and texts in dedicated folders or files.
This approach offers several benefits:

- Reuse: We can easily reuse constants across different parts of your application.

- Maintainability: By keeping all selectors and texts in one place, it becomes easier to update them. If there's a change in a selector or text, we only need to update it in one location rather than hunting through our codebase for every instance.

- Readability: Using meaningful names for constants improves code readability. It's easier to understand what the code is doing without needing to decipher hardcoded values.

We frequently encounter different types of constants in our code, including routes, hardcoded strings, links, and selectors. Organizing these constants properly within a project is essential for maintainability and clarity.

- Routes: Store all route related constants in a file named `constants/routes.ts`.

```ts
test("should navigate to admin URL", async ({ page }) => {
  await page.goto(ADMIN_URL);
  // ...
});

// constants/routes.ts
export const ROUTES = { ADMIN_URL: "/admin" };
```

- Hardcoded strings: Place hardcoded string constants in individual files within a directory named `constants/texts`. For example, we could have files like `home.ts`, `about.ts`, etc within this directory, each containing strings specific to that page.

```ts
test("should verify save changes button", async ({ page }) => {
  await page.getByRole("button").toHaveText(HOME_TEXTS.saveChanges);
});

// constants/texts/buttons.ts
export const HOME_TEXTS = { saveChanges: "Save changes" };
```

If certain texts are shared among different pages, we can add them to a file named `constants/texts/common.ts`.

- Links: Store link constants in a file named `constants/links.ts`.

```ts
test("should verify save changes button", async ({ page }) => {
  // ....
  await expect(page.getByTestId(EXAMPLE_SELECTORS.saveChanges)).toHaveAttribute(
    "href",
    LINKS.example
  );
});

// constants/links.ts
export const LINKS = { example: "https://example.com" };
```

- Selectors: Place selector constants in individual files within the `constants/selectors` directory. Similar to hardcoded strings, we can have files named after specific pages or features, such as `home.ts`, `about.ts` etc within this directory, each containing selectors specific to that page.

```ts
test("should verify save changes button", async ({ page }) => {
 await page.getByTestId(HOME_SELECTORS.saveChanges)click();
});

// constants/selectors/buttons.ts
export const HOME_SELECTORS = { saveChanges: "save-changes-button" }
```

If certain selectors are shared among different pages, we can add them to a file named `constants/selectors/common.ts`.

Grouping related constants within a single object provides clarity and organization. It makes it clear that these constants are all related to a specific page or feature, which can be especially helpful when working with large codebases.

```ts
// Correct

//constants/texts/buttons.ts
export const HOME_TEXTS = {
  saveChanges: "Save changes",
  cancelButton: "Cancel button",
};

// Incorrect

//constants/texts/buttons.ts
export const saveChanges = "Save changes";
export const cancelButton = "Cancel button";
```

This structured approach not only keeps our constants organized but also makes it easier to locate and manage them as our project grows.

This is a theoretical chapter. There is nothing to commit in here. If you have made some changes to the project, clean them up by executing the
following command.

```bash
git clean -fd
```
