```bash
$ cd playwright-tests
$ tree
.
├── constants.ts
├── e2e
│   ├── auth
│   ├── config
│   ├── constants
│   │   ├── common.ts
│   │   ├── routes.ts
│   │   ├── selectors
│   │   └── texts
│   ├── fixtures
│   ├── poms
│   ├── tests
│   └── utils
├── package.json
├── playwright.config.ts
├── tsconfig.json
└── yarn.lock
```

- **constants.ts:** Stores constants that are to be available within the playwright-tests folder.

- **auth:** Stores credentials and session details with which users have logged into the application. This comes in handy when writing tests that require these credentials or when we use session restore to avoid logging in multiple times.

- **config:** Stores files required to customize the configuration of Playwright in various environments.

- **constants:** Contains constants used in Playwright tests.

  - **selectors:** Includes selectors for all components to be interacted with.
  - **texts:** Contains messages and constant texts used in the application.
  - **routes.ts:** This file is used to store route constants.

- **utils:** This folder contains essential utility functions that are made accessible for the tests.

- **tests:** This folder includes all the test files. These files are written with a `.spec.ts` extension, following the format of `testName.spec.ts`.

- **fixtures:** This folder contains all the custom fixtures. More about fixtures will be provided in the upcoming chapters.

- **poms:** These contain the page object models, which are classes representing various components or sections of our application.

- **tsconfig.json:** This file is a TypeScript configuration file, used to specify compiler options. This is where we allow creating custom aliases instead of specifying the entire relative path.
