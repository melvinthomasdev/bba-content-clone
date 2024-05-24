Playwright provides a set of annotations that we can use to control the behavior of our tests. Annotations can be used on a single test or a group of tests and can be conditional, in which case they apply when the condition is truthy.

Here’s a more detailed look at these annotations.

## test.skip()

This annotation is used when you want to skip a test. The test will not be run by Playwright. Skipping tests is not recommended and should only be used in unavoidable cases.

```js
test.skip("skipped test", async ({ page }) => {
  // ...
});
```

A test can be skipped under specific conditions, and you can optionally include a description if necessary.

```js
test("skipped in WebKit", async ({ page, browserName }) => {
  test.skip(browserName === "webkit", "This feature is skipped on Safari");
  // ...
});
```

`test.skip()` can also take a predicate as its first argument. The test will be skipped if it returns true.

```js
test.skip(({ browserName }) => browserName === "webkit");
```

## test.only()

This annotation is used to focus on a specific test. When there are focused tests, only these tests will run. This is useful when you want to run a single test or a group of tests exclusively.

```js
test.only("focus this test", async ({ page }) => {
  // ...
});
```

## test.fail()

This annotation is used to mark a test as failing. Playwright will run this test and ensure it does indeed fail. If the test does not fail, Playwright will complain. This is useful for documentation purposes to acknowledge that some functionality is broken until it is fixed.

```js
test("failing test", async ({ page }) => {
  test.fail();
  // ...
});
```

We can label a test as failing based on certain conditions, and if needed, provide an optional description as well.

```js
test("failing in WebKit", async ({ page, browserName }) => {
  test.fail(browserName === "webkit", "This feature is failing on Safari");
  // ...
});
```

`test.fail()` can also take a predicate as its first argument. The failing label will be applied if it returns true.

```js
test.fail(({ browserName }) => browserName === "webkit");
```

## test.fixme()

Marks a test as fixme, with the intention to fix it. Test is immediately aborted when you call test.fixme().

```js
test("test to be fixed", async ({ page }) => {
  test.fixme();
  // ...
});
```

We can label a test as fixme based on certain conditions, and if needed, provide an optional description too.

```js
test("fix in WebKit", async ({ page, browserName }) => {
  test.fixme(browserName === "webkit", "This feature is broken on Safari");
  // ...
});
```

`test.fixme()` can also take a predicate as its first argument. The fixme label will be applied if it returns true.

```js
test.fixme(({ browserName }) => browserName === "webkit");
```

## test.step()

It allows for the breakdown of individual actions within a test and grouping of relevant steps together, thus enhancing the readability of test reports.

```js
test("test", async ({ page }) => {
  await test.step("step 1", async () => {
    // ...
  });

  await test.step("step 2", async () => {
    // ...
  });
});
```

## test.slow()

This annotation is used to mark a test as slow. Playwright will triple the test timeout. This is useful when a test takes longer to run.

```js
test("slow test", async ({ page }) => {
  test.slow();
  // ...
});
```

We can label a test as slow based on certain conditions, and if needed, provide an optional description too.

```js
test("slow in WebKit", async ({ page, browserName }) => {
  test.slow(browserName === "webkit", "This feature is slow on Safari");
  // ...
});
```

`test.slow()` can also take a predicate as its first argument. The slow label will be applied if it returns true.

```js
test.slow(({ browserName }) => browserName === "webkit");
```

This is a theoretical chapter. There is nothing to commit in here. If you have made some changes to the project, clean them up by executing the 
following command.

```bash
git clean -fd
```