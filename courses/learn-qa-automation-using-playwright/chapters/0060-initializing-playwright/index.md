Let's start by setting up Playwright in our project. We'll be setting up Playwright in an independent directory which will have its own `package.json` file so that the changes in the project do not affect the Playwright tests and vice-versa. So let's start by creating a new directory for the Playwright tests.

```bash
mkdir playwright-tests
cd playwright-tests
```

Let's initialize playwright here.

```bash
yarn create playwright
```

As we're using typescript for writing Playwright tests, choose the following configuration in the initializer questionnaire.

```bash
Getting started with writing end-to-end tests with Playwright:
Initializing project in '.'
? Do you want to use TypeScript or JavaScript? …
❯ TypeScript
  JavaScript

? Where to put your end-to-end tests? › e2e

? Add a GitHub Actions workflow? (y/N) › N

? Install Playwright browsers (can be done manually via 'yarn playwright install')? (Y/n) › Y

```

We can see that a few files have been generated for us.

```
.
├── e2e
│   └── example.spec.ts
├── package.json
├── playwright.config.ts
├── tests-examples
│   └── demo-todo-app.spec.ts
└── yarn.lock
```

Now Playwright has been initialized in our project. We'll see what the entries in the config files mean in the next chapter.

We can see that Playwright has added a few sample specs in the initialized project. We can run them by executing the following command.

```bash
yarn playwright test --ui
```

We can commit these changes now.

```bash
git add -A
git commit -m "Added Playwright configuration"
```