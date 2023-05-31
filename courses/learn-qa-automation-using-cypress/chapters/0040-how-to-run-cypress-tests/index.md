## Understanding the Cypress directory structure

The following is an example of the structure of the `cypress` directory:

```bash
$ cd cypress-tests/cypress
$ tree
.
├── cypress
│   ├── config
│   ├── constants
│   │   ├── selectors
│   │   ├── texts
│   │   └── routes.js
│   ├── fixtures
│   ├── e2e
│   ├── plugins
│   ├── support
│   ├── jsconfig.json
│   ├── resolve.js
│   └── webpack.config.js
├── node_modules
├── .eslintrc.js
├── cypress.json
├── package.json
└── yarn.lock
```

- **config**: Stores the files to customize the configuration of Cypress in
  various environments.
- **constants**: Contains the constants that are being used in Cypress tests.
  Here, the subdirectory selectors include selectors for all components to be
  interacted with. Subdirectory texts contain the messages and constant texts
  used in the application.
- **fixtures**: Fixtures are used to store test data which can then be used
  throughout the tests. Usually, the data is stored in JSON format.
- **e2e**: e2e folder includes all the test files. The test files are written
  with a .spec.js extension and the test file name format is testName.spec.js.
- **support**: This folder contains index.js and commands.js files. This
  index.js file is run before every single spec file. The support folder is a
  great place to put reusable behavior such as custom commands.
- **plugins**: This folder includes the index.js file. This file will be
  automatically imported every time before the execution of every spec(test)
  file. Plugins enable you to tap into, modify, or extend the internal behavior
  of Cypress.

## Running Cypress tests on wheel

Set up the [wheel](https://github.com/bigbinary/wheel) repository on your local
machine according to the local development setup section in the README.md file.

After setting up the project, run the application. Move into the cypress-tests
directory in the root of your project directory. Then run `yarn install` to
install the required dependencies.

```bash
cd cypress-tests
yarn install
```

Now, start Cypress from the command line using the following command.

```bash
yarn cy:open
```

We can see the Cypress window opening up. On the left side of the window, we can
see the spec files created in the e2e folder. Under the authentication, folder
click on login.spec.js.

<image>cypress-window.png</image>

This will open up your default browser and start running the tests.

## Using tags to selectively run spec files

There is an option to add tags to the test suite. In Bigbinary, we use the
following tags for categorizing specs.

- **Fixed**: For regression specs
- **Happy-Path**: For Happy path specs
- **WIP**: For work-in-progress specs.

We use **Fixed** tag for regression specs and **Happy-Path** for happy path
specs. When we update/add new tests, and run Cypress, some of the unrelated test
suites having **Fixed** tag may fail. So instead of fixing the problem in the
same GitHub issue, we change the tag of the failing tests to **WIP** tag and
create a new issue for the failing tests. The test suites having **WIP** tag
will be ignored when running Cypress and the failing tests must be resolved
later.

```js
describe("Login", { tags: ["Fixed"] }, () => {
...
});
```

If we open the cypress/config folder, we can see cypress configuration files for
different environments like development, review and staging.

To selectively run test suites in the development environment you can define
**grepTags** under the **env** key in config.development.json.

The following configuration selectively run test suites with **Fixed** tag.

```js
{
  ...
  "env": {
    ...
    "grepTags": "Fixed"
  },
  ...
}
```
