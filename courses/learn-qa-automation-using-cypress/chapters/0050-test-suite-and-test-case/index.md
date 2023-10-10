## Test Suite

- **_describe_** is a Cypress method for grouping one or more related tests.
- Each **_describe_** block represents a test suite. Every time we start writing
  a new suite of tests for a functionality, we wrap it in a **_describe_**
  block.

```javascript
describe("Test suite", () => {
  ...
  ...

});
```

- As we can see **_describe_** block takes two arguments: a _string_ for
  description of the test suite, and a _callback function_ for wrapping the
  actual test.

## Test Case

- A test case can be written using **_it_** block.
- A test suite can contain one or more test cases. A test suite can consist
  positive and negative test cases related to a functionality. This means that
  **_describe_** can have one or more **_it_** blocks.

```javascript
describe("Members", () => {
  beforeEach(() => {
    ....
  });

  afterEach(() => {
    ....
  })

  it("should verify member operations", () => {
    .....

  });
});
```

## Conventions for _describe_ and _it_ block

- The description of a `describe` block must start with uppercase
- The description of **_describe_** block should be short.
- Avoid using “_should_” or long statements in describe block.
- It can simply be the functionality name.

e.g. If we are testing 'signup' functionality, then the **_describe_** block
should look like:

```javascript
describe("Signup", () => {
  ...
  ...

});
```

e.g. If we are testing 'login' functionality, then the **_describe_** block
should look like:

```javascript
// Incorrect

describe("Verify login functionality", () => {
  ...
  ...

});

// Correct

describe("Login", () => {
  ...
  ...

});
```

- The description of a `it` block should always be in lowercase.
- The description of **_it_** block can be more specific.
- We can start the description with _should_ or _must_. However, it's not
  mandatory to start with these keywords, just ensure that it is meaningful.

e.g. If we are handling 'customers' in a test suite, our test should look like:

```javascript
// correct

describe("Manage customers", () => {
  it("should verify customer operations", () => {
    ..
    ...

    // expected to cover create, edit and delete operations in this test case.

  });
});
```

- Avoid using vague or generic description.

```javascript
//Incorrect

it("should verify customer", () => {
  ..
  ...

});
```
