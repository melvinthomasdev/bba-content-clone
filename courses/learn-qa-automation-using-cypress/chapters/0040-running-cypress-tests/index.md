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
│   │   └── utils
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
- **support**: This folder contains e2e.js and commands.js files. The
  e2e.js file is run before every single spec file. The support folder is a
  great place to put reusable behavior such as custom commands and utility functions.
- **plugins**: This folder includes the index.js file. This file will be
  automatically imported every time before the execution of every spec(test)
  file. Plugins enable us to tap into, modify, or extend the internal behavior
  of Cypress.

## Running Cypress tests on a neeto project

After setting up the project, run the application. Move into the cypress-tests
directory in the root of our project directory. Then run `yarn install` to
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
see the spec files created in the e2e folder. Click on any of the listed specs.

<image>cypress-test-window.png</image>

This will open up our default browser and start running the tests.
