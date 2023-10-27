## Use tags to selectively run spec files

We can run specs selectively using tags. There is an option to add tags to the test suite.
For this, we are using the plugin [@cypress/grep](https://www.npmjs.com/package/@cypress/grep).

Here is an example. Let's say we are running the test cases in 2 different environments.
One is the review-app environment and the other is the staging environment. And we need
to run the test cases selectively in these environments. For this, we can add some tags to
the test suites.

- **review**: For review-app environment
- **nightly**: For staging environment
  _(we can use any name for this tags)_

```js
describe("Members", { tags: "review" }, () => {
...
});
```

```js
describe("Signup", { tags: "nightly" }, () => {
  ...
});
```

```js
describe("Login", { tags: ["review" ,"nightly"]}, () => {
...
});
```

In the `cypress.config.js file`, we can specify the tags to be run in the current environment.

```js
{
  ...
  "env": {
    ...
    "grepTags": "review"
  },
  ...
}
```

In this case, cypress will filter the test suites with the tag **review** and run only those test
suites. That means, it will run all the test cases inside the suits `Members` and `Login`. Since
`Login` suit contains both tags, it will be included in both environments.

Another way is to pass the value via the command line.

```bash
yarn cy:run --env grepTags=review # Run test suites with 'review' tag
yarn cy:run --env grepTags=nightly # Run test suites with 'nightly' tag
```

If the `grepTags` is not specified, or if there are no matching test cases found, then Cypress will
run all the test cases.

## How to skip test cases

When we update/add new tests/features, and run Cypress, some of the unrelated test suites may fail.
So we will have to skip these tests from running until the known issue has been resolved. For this
and other cases where we have to skip a test, we can use the `it.skip` method.

```js
describe("Members", { tags: "review" }, () => {
  it.skip("should verify member operations", () => {
    ...
  });
});
```

In some cases, when we change the method from `it` to `it.skip`, the entire file may change due to
indentation. To avoid this, we can create aliases for `it` and `it.skip` methods. Add the following
snippet in the `e2e.js` file.

```js
// e2e.js

globalThis.test = it;
globalThis.skip = it.skip;
```

Now we can use the methods `test()` and `skip()`

```js
describe("Members", { tags: ["review", "nighty"] }, () => {
  test("should verify member operations", () => {
    ...
  });
});

// for skipping
describe("Blogs", { tags: ["review", "nighty"] }, () => {
  skip("should verify blogs operations", () => {
    ...
  });
});
```
