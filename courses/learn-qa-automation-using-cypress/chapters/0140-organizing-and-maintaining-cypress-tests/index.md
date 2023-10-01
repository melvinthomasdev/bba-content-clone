## Avoid adding empty line after each statement

Avoid adding empty line after each command. There should be logical separation
between the code statements.

Here is an example of a test case named "Test to add and delete an article".

### Incorrect method

```javascript
cy.get(navSelectors.articlesTab).click();

navigateToNewArticlePage();

cy.clearAndType(articleSelectors.titleField, faker.words);

cy.get(articleSelectors.saveChangeButton).click();

cy.get(navSelectors.articlesTab).click();
// delete article
deleteArticle(title);
```

### Correct method

```javascript
// add article
cy.get(navSelectors.articlesTab).click();
navigateToNewArticlePage();
cy.clearAndType(articleSelectors.titleField, title);
cy.get(articleSelectors.saveChangeButton).click();

// delete article
cy.get(navSelectors.articlesTab).click();
deleteArticle(title);
```

Here we have introduced a new line to separate code blocks having different test
logic, and have combined cypress commands pertaining to the same test logic.

## Avoid writing comments

Avoid writing comments in the code unless it is really needed. The code should
be self explanatory.

## Importing external files before internal files

Always keep import statements for external libraries before importing internal
files.

```javascript
import faker from "faker";

import {
  navSelectors,
  headerSelectors,
} from "../../constants/selectors/common";
import { groupsSelectors } from "../../constants/selectors/groups";
import { groupIndexTexts } from "../../constants/texts/groups";
```

## Avoiding Repetitive Code

There are different ways we can avoid repetitive code. Consider using following
ways to avoid repetitive code:

- Custom commands e.g. cy.login() for most of the application's functionalities
  login is the first step
- Utility functions
- Loops (If the same assertion logic is used for multiple elements)

## Maintaining API paths

We can create a separate file for storing all the routes and import them
whenever required. For storing them, we can create `routes.js` file under the constants folder.

```javascript
// cypress/constants/routes.js

const apiRoutes = {
  articles: {
    index: "/api/v1/articles",
    show: id => `/api/v1/articles/${id}`,
    bulkUpdate: "/api/v1/articles/bulk_update",
  },
  groups: {
    index: "/api/v1/groups",
    show: id => `/api/v1/groups/${id}`,
  },
  settings: "/api/v1/settings",
};

export default apiRoutes;
```

```javascript
// Usage
import apiRoutes from "Constants/routes";
// ...
cy.apiRequest({ method: "GET", url: apiRoutes.articles.index });
cy.apiRequest({ method: "DELETE", url: apiRoutes.articles.show("1234") });
```

## Add files that we don't want to commit or track in .gitignore

We would want to ignore some files that are created along with time or during the installation of Cypress like _node_modules_`, `videos`, `screenshots`_ etc. These files are important but can be ignored while committing our changes to the repository. Such files can be added in `.gitignore`.

## Use webpack aliases

`webpack.config.js` file, which describes how the cypress files and assets
should be transformed and what kind of output should be generated.

```javascript
// Incorrect
import { agentsSelectors } from "../../constants/selectors/agents.js";
import { agentsTexts } from "../../constants/texts/agents.js";

// Correct
import { agentsSelectors } from "Selectors/agents.js";
import { agentsTexts } from "Texts/agents.js";
```

## Importing fakers from fixtures

Often we need to use some random data to perform integration testing. And there
comes a npm package,`faker` which helps us to generate random data very easily.
Instead of directly importing `faker` into the test file, we can create a
`fake.js` file in the fixtures folder and import the fake data into our tests.

```javascript
// Fixtures/faker.js
import faker from "faker";

const fake = {};

const streetAddress = () => faker.address.streetAddress();
const url = () => faker.internet.url();
const city = () => faker.address.city();

Object.defineProperty(fake, "streetAddress", { get: streetAddress });
Object.defineProperty(fake, "url", { get: url });
Object.defineProperty(fake, "city", { get: city });

export default fake;
```

```javascript
// e2e/test.spec.js
import fake from "Fixtures/fake";

describe("Create new tags", () => {
  it("should be able to create new tags", () => {
    const streetAddress = fake.streetAddress;
    const url = fake.url;
    const city = fake.city;

    cy.get('[data-cy="cityInputField"]').type(city);
    cy.get('[data-cy="streetNameInputField"]').type(streetAddress);
    cy.get('[data-cy="urlInputField"]').type(url);
  });
});
```

## Use `within()` for narrowing the scope of cypress

Whenever multiple elements with the same selector are present, we can select the desired element using `within()` to narrow the scope. e.g. Let's say, there is a table of canned responses list. Each row has an edit, and delete button. So, to select one of them, we first need to get the element with the name and then use
`within()` to narrow down the scope. Each row contains only one edit button, so
the correct edit button is selected.

![Alt Text](https://i.imgur.com/wGoGG5Z.png "Use within() for narrowing the scope")

```javascript
cy.contains(cannedResponseSelectors.tableRow, cannedResponseName).within(() => {
  cy.get(cannedResponseSelectors.editButton).click();
});
```

## Group variables based on the context

Let's say we have a test to create and edit an article. So we need one article's details for creating an article and another article's details for editing. So, we can group them based on the context.

```javascript
describe("Articles", () => {
  // Incorrect
  const title1 = faker.words();
  const title2 = faker.words();
  const description1 = faker.sentence();
  const description2 = faker.sentence();

  // Correct
  const article = {
    title: faker.words(),
    description: faker.sentence(),
  };
  const updatedArticle = {
    title: faker.words(),
    description: faker.sentence(),
  };

  it("should be able to create an article", () => {
    articleUtils.createArticle(article);
  });
});
```

In the above snippet, if we use `title1`, and `title2` in the same test, it will be difficult to understand which article's details are being used. But, if we use `article.title` and `updatedArticle.title`, it will make the test case more readable.
