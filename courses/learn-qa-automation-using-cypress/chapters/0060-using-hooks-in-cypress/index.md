Hooks are helpful to manage tests in an efficient way. It helps us to set
conditions before/after test conditions and also reduce the redundant code.

## before() Hook

- **_before()_** : If we want to execute some steps **only once** before all the
  test cases in a test suite, we can use the before() cypress hook to group all
  those test steps. It can contain some setup steps that are needed to perform
  before kicking off the test execution. Please note, this block is not executed
  again even if the test fails. Its syntax looks like below:

```javascript
describe("Test suite", () => {
  before(() => {
    ...
    ...

  });
});
```

## beforeEach() Hook

- **_beforeEach()_** : If we want to execute some steps **before each** of the
  test cases in a Test Suite, we can use the beforeEach() block to group all
  those test steps. It can be something like bringing the application to a
  specific state before running each test case. Its syntax looks like below:

```javascript
describe("Test suite", () => {
  beforeEach(() => {
    ...
    ...

  });
});
```

## afterEach() Hook

- **_afterEach()_** : If we want to execute some steps **after each** of the
  test cases in a test suite. We can use the afterEach() block to group all
  those test steps. It can contain some teardown steps which we need to perform
  after finishing the execution of each of the test cases. It can be something
  like bringing the application or database to a specific state after each test
  case. Its syntax looks like below:

```javascript
describe("Test suite", () => {
  afterEach(() => {
    ...
    ...

  });
});
```

## after() Hook

- **_after()_** : If we want to execute some steps **only once** after all the
  test cases. We can use the after() block to group all those test steps. It can
  contain some teardown steps that are needed to perform after finishing the
  execution of all the test cases. Its syntax looks like below:

```javascript
describe("Test suite", () => {
  after(() => {
    ...
    ...

  });
});
```