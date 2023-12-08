In order to make the tests more readable and manageable, we can follow the practices listed below.

## General best practices

### 1. Make tests behavioral

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

### 2. Make tests isolated

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
    await assert(page.getByTestId("order")).toHaveCount(1);
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
    await assert(page.getByTestId("order")).toHaveCount(1);
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

### 3. Avoid testing third-party dependencies

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

### 4. Locators

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
page.getByTitle("child-element").filter({ hasText: "Product 2" }); // Returns Child 1
```

We can always use the [Playwright codegen tool](https://playwright.dev/docs/codegen#generating-locators) to find the best
selector for an element and edit it according to our needs.

### 5. Use web first assertions

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

### 6. Add assertions to each test

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
  await assert(page.getByTestId("task-item")).toHaveCount(1);
});
```

### 7. Avoid too many nested describe, test and step blocks

Playwright provides us with the ability to define as many nested
describe or test blocks as we want. While this is useful in some
cases, abusing this feature can make the code unreadable. Limit the
maximum nesting of blocks to `two`.

### 8. Beware of missing await

Most of the methods in Playwright return a promise. This means that
we should properly await them when writing the tests. Failing to do
so can lead to flaky tests and even unexplainable errors.

### 9. Avoid conditional logic within tests

Conditional logic in tests is usually an indication that a test is
attempting to cover too much, and not testing the logic it intends
to. Each branch of code executing within a conditional statement will
usually be better served by a test devoted to it.

### 10. Avoid using element handles

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

### 11. Avoid using { force: true }

In some cases, the element we are trying to interact with might not
be interactable. In such cases, we might have a urge to use
`{ force: true }` in the options to get the test working. But this is
not actually testing the application from a user's standpoint. When
using the `force` option, we are instructing Playwright to execute the
user event even if the element is not visible, or it is being covered
by another element or even if it is disabled. This can lead to false
positives in tests where the tests might be passing but the feature
might be failing for an end-user.

### 12. Avoid waiting for networkidle

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

### 13. Avoid using nth-methods

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

### 14. Double check before using negative assertions

Consider an example where we want to check whether an element is not
visible on the screen. We may write the test like this.

```ts
// Incorrect

await assert(locator).not.toBeVisible();
```

This works fine, but there is a better alternative available.

```ts
// Correct

await assert(locator).toBeHidden();
```

This looks good in terms of readability. But there are cases when
negative assertions can be wrong as well. Not all assertions are
boolean. For example consider a test where we are asserting that not
even one element matching a locator exists. We can write it in two
ways.

```ts
// Incorrect

await assert(locator).not.toHaveCount(1);

// Correct

await assert(locator).toHaveCount(0);
```

If no element if present on the screen both the assertions pass. But
if more than one element is present on the screen, then the first
assertion passes, throwing a false positive, and the second one fails.

### 15. Avoid waitForTimeout

We should avoid hard timeouts wherever possible as it delays the test
execution unnecessarily. We can use web first assertions to check for
some other dependent factor for continuing with our tests so that we
can move along with the test as soon as a dependency is resolved.

### 16. Prefer strict equality assertions

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

### 17. No need of common assertions for actionable elements before performing actions

Playwright makes sure that an element is actionable before performing a user event on it. So we can avoid code like:

```ts
// Incorrect

await expect(locator).toBeVisible();
await locator.click();

// Correct

await locator.click();
```

## BigBinary best practices

### 1. Use proper step blocks

We should try and use proper `step` blocks to describe what a group of
statements do in a step. We should prefix the the step description
with the proper step number as well. This helps us to identify the
test failures much easily and also generates the reports in a format
that even people unfamiliar with Playwright can read.

```ts
test("should be able to place an order", ({ page, loginPage, ordersPage }) => {
  await test.step("Step 1: Login to the application", loginPage.loginViaUI);
  await test.step("Step 2: Create new order", () =>
    ordersPage.createOrders({ item: "Smartphone" })
  );
  await test.step("Step 3: Assert a new order was created", async () => {
    const orders = page.getByTestId("order");
    await expect(orders).toHaveCount(1);
  });
});
```

### 2. Wait for the API responses

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

### 3. Use utils and methods from neeto-playwright-commons

We have a set of utils and helper methods which have been defined in
[neeto-playwright-commons](https://github.com/bigbinary/neeto-playwright-commons) npm package.
We should try and reuse this existing logic instead of repeating it,
in each application. If a logic is applicable to multiple products we
should extract it to the package as well.