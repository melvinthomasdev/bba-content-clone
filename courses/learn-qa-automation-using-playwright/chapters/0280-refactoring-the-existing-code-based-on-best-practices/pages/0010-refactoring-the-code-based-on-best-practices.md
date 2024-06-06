Now that we are familiar with some the best practices that we should be following,
let's refactor the Playwright code we have written for the granite project till
now by applying this newfound knowledge.

You can try this refactoring work on your own and see how much of the best
practices you were able follow.

We have a total of six files that can be improved:

- poms
  - login.ts
  - tasks.ts
- tests
  - global.teardown.ts
  - login.setup.ts
  - register.spec.ts
  - tasks.spec.ts

Let's go through each of them and identify what can be improved in them. Make
sure to execute the tests after each refactoring work to ensure that we are
not breaking any functionality in the process.