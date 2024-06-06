Now that we have performed all the refactoring work, we can look
back at our previous code by using the `git diff` command.

```bash
git diff path/to/file

# eg: git diff e2e/tests/tasks.spec.ts
```

We can see a clear difference in the quality of code. We have
reduced code repetition as much as possible, optimized the
code logic for faster execution and also added in proper
annotations in the code such that even a non-technical
user can read the code and understand what is happening in
the tests.

Now that we have all the changes ready, let's execute the tests
one last time to make sure all the tests are working as expected.

```
yarn playwright test --headed
```

Great! All tests are passing and we can see an improvement in the execution
time as well.

<image>playwright-performance-comparison.png</image>

Let's commit this code now.

```bash
git add -A
git commit -m "Refactored code based on best practices"
```
