**1. Avoid adding empty line after each statement**

Avoid adding empty line after each command. There should be logical separation
between the code statements.

e.g. Test to add and delete an article

```javascript
// incorrect method

cy.get(navSelectors.articlesTab).click();

navigateToNewArticlePage();

cy.clearAndType(articleSelectors.titleField, faker.words);

cy.get(articleSelectors.saveChangeButton).click();

cy.get(navSelectors.articlesTab).click();
// delete article
deleteArticle(title);

// correct method

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

**2. Avoid writing comments**

Avoid writing comments in the code unless it is really needed. The code should
be self explanatory.

**3. Importing external files before internal files**

Always keep import statements for external libraries before importing internal
files.

e.g.

```javascript
import faker from "faker";

import {
  navSelectors,
  headerSelectors,
} from "../../constants/selectors/common";
import { groupsSelectors } from "../../constants/selectors/groups";
import { groupIndexTexts } from "../../constants/texts/groups";
```

**4. Avoiding Repetitive Code**

There are different ways we can avoid repetitive code. Consider using following
ways to avoid repetitive code:

- Custom commands e.g. cy.login() for most of the application's functionalities
  login is first step
- Utility functions
- Loops (If same assertion logic is used for multiple elements)

**5. Maintaining paths**

We can create a separate file for storing all the routes and import them
whenever required. For storing them, we can create `routes.js` file under
constants folder. Remember these will be `variables` or functions and not an
`object`. Please refer the below example:

```javascript
// cypress/constants/routes.js

export const newSignupPath = "/signups/new";
export const signupOtpPath = "/api/v1/signups/otp_generation";
export const loginPath = "/login";
```

**6. Add files which we don't want to commit or track in `.gitignore`**

We would want to ignore some files that are created along with time or during
the installation of cypress like _`node_modules`, `videos`, `screenshots`_ etc.
These files are important but can be ignored while committing our changes into
the repository. Such files can be added in `.gitignore`.

**7. Use webpack aliases**

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

**8. Importing fakers from fixtures**

Often we need to use some random data to perform integration testing. And there
comes a npm package,`faker` which helps us to generate random data very easily.
Instead of directly importing `faker` into the test file, we can create a
`fake.js` file in fixtures folder and import the fake data in our tests.

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

**9. Use `within()` for narrowing the scope of cypress**

Whenever multiple elements with same selector is present, we can select the
desired element using `within()` to narrow the scope. e.g. Let's say, there is
table of canned responses list. Each row has an edit, and delete button. So, to
select one of them, we first need to get the element with name and then use
`within()` to narrow down the scope. Each row contains only one edit button, so
the correct edit button is selected.

![Alt Text](https://i.imgur.com/wGoGG5Z.png "Use within() for narrowing the scope")

```javascript
cy.contains(cannedResponseSelectors.tableRow, cannedResponseName).within(() => {
  cy.get(cannedResponseSelectors.editButton).click();
});
```