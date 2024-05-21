## Using `Locator.check()` vs `Locator.click()` when checking a checkbox

When writing tests involving checkboxes, we have the option to use
`Locator.check()` as well as `Locator.click()` to check it. We can
use both these methods interchangeably. But there are cases when the
using `Locator.check()` won't work. These are the cases where the
checkbox is state controlled. In such cases, the developers might use
an `onClick` event listener to change the checked state of the
checkbox. This means that the checkbox will also have a state tracking
its `checked` property.

Here using the `Locator.check()` method doesn't check the checkbox
since its the click event that triggers the state change. So we should
use `Locator.click()` here instead.

## Avoid using `Locator.clear()` before `Locator.fill()`

The `Locator.fill()` replaces the contents of a textbox and doesn't
append to it. This means that calling `Locator.fill()` clears the
textbox by default and calling `Locator.clear()` before that is
redundant.

## Using `Expect.poll()` and `Expect.toPass()` to retry blocks of code

As mentioned in the best practices we should try and use web-first
assertions as much as possible. This is because they are auto-retrying
methods. This means that Playwright executes these assertions again
and again until they pass and marks them as failed if it exceeds the
timeout(defaults to 5 seconds).

Consider the case where the page elements are updating on load and the
element tends to be outside the viewport failing the visibility
assertions. In this case our code will look something like this.

```ts
const unstableButton = page.getByRole("button");
await unstableButton.scrollIntoViewIfNeeded();
await expect(unstableButton).toBeVisible();
```

In this codeblock the `toBeVisible()` assertion being auto-retrying checks for the visibility repeatedly until timeout. But the issue is
that the if the button is invisible because it has gone overflowed the
viewport, then it won't be visible again until the we use
`scrollIntoViewIfNeeded()` again. But this being an action is only
done once and not repeated during the assertion. This is where the
`.poll()` and `.toPass()` comes into play.

These methods makes a `GenericAssertion` into retrying assertions.
Let's see how the same code can be refactored using the `.poll()`
method.

```ts
const unstableButton = page.getByRole("button");
expect
  .poll(async () => {
    await unstableButton.scrollIntoViewIfNeeded();
    return unstableButton.isVisible();
  })
  .toBe(true);
```

This small change adds auto-retry to both the scroll and the
visibility assertion. Here we are returning a value for which we want
to add a generic assertion. Additionally we can add a timeout(default
5 seconds), a message to display if the assertion fails and also retry
intervals.

```ts
const unstableButton = page.getByRole("button");
expect
  .poll(
    async () => {
      await unstableButton.scrollIntoViewIfNeeded();
      return unstableButton.isVisible();
    },
    {
      message: "Couldn't find the button within the timeout",
      timeout: 25_000,
      intervals: [1000, 3000, 5000],
    }
  )
  .toBe(true);
```

This specifies that we should wait for a timeout of 25 seconds and
retry the assertion in the code block first after 1 second, next after
3 seconds and lastly in 5 second intervals.

This solves most of the issues, but the drawback of the poll method is
that we cannot chain web-first assertions with it. In this case we
need to use the `.toPass()` method. Let's see how we can rewrite the
same example using the `.toPass()` method.

```ts
const unstableButton = page.getByRole("button");
expect(async () => {
  await unstableButton.scrollIntoViewIfNeeded();
  await unstableButton.toBeVisible();
}).toPass({
  timeout: 25_000,
  intervals: [1000, 3000, 5000],
});
```

In the above example, by using the `.toPass()` method, we are
specifying that all the code within the `expect` block should pass and
we should keep retrying the code block until the given timeout and
intervals until the code block passes. Otherwise, it is marked as
failed. Note that we are able to use web-first assertions without any
issues within the expect block. If any of the assertions within the
code block fails, the execution of the block is stopped and it is
retried.
