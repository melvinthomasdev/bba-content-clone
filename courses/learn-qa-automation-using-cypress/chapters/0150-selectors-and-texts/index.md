Create a separate folder "constants" under cypress. In the "constants" folder,
create two folders - "selectors" and "texts" and store all the selectors and
texts respectively in those folders. Please refer:

![](https://i.imgur.com/xIMQtdo.png)

## Selectors

- In a selector file, create an object for storing all the related DOM selectors
  and export that object in other files where we need to use it.
- Always use meaningful variable names for storing selectors, and also keys in
  the object. It helps us to locate them easily and make the tests more
  readable. For example, if we need to test login functionality, the selector name can be `loginSelectors` placed at `constants/selectors/login.js`. It can
  have keys as `emailTextField`, `passwordTextField` and `submitButton`.

Please refer to another example below:

```javascript
// constants/selectors/signup.js

export const signupSelectors = {
  emailTextField: dataCy("signup-email-text-field"),
  emailSubmitButton: dataCy("signup-email-submit-button"),
  firstNameTextField: dataCy("signup-profile-first-name-text-field"),
  lastNameTextField: dataCy("signup-profile-last-name-text-field"),
  profileSubmitButton: dataCy("signup-profile-submit-button"),
};
```

- Avoid prefixing the key with the name of the test file name as we already
  prefixed the selector object with it.
- Please refer to the example below:

```javascript
// Incorrect
export const clientsSelectors = {
  clientCancelButton: dataCy("client-cancel-button"),
};

// Correct
export const clientsSelectors = {
  cancelButton: dataCy("client-cancel-button"),
};
```

- Avoid repeating the same selectors in multiple files. Instead, create a common file
  and keep all of them in common selectors. The best possible scenario for this
  is header elements. The header elements might be required in multiple test
  specs. However, we can keep them under `selectors/common.js` with an object
  named as `headerSelectors`.
- While choosing selectors always give priority as below in
  [neeto](https://neeto.com) projects:
  1.  data-cy
  2.  data-test
  3.  data-test-id
- In cases, if we need to use class selectors, it should be specific. Avoid
  using generic classes. And in some cases, we may need to use them with some
  parent element to make them specific. e.g. `.content-body-wrapper .heading`.

## Texts

- We will follow the same conventions as selectors for storing the texts as
  well.
- In text file, create a variable for storing all texts and export that variable
  in other files where we need to use those texts.
- The variable names for storing texts should also be meaningful and easy to
  understand. Please refer the example below:

```javascript
//constants/texts/common.js
export const commonTexts = {
  generalError: "Something went wrong.",
};
```

```javascript
//constants/texts/login.js
export const loginTexts = {
  heading: "Sign In",
  passwordRequiredMessage: "Password is required",
  emailRequiredMessage: "Email is required",
};

export const loginErrorTexts = {
  nameRequired: "Name is required",
  emailRequired: "Email is required",
};
```

## Importing selectors and texts variables

- We need to import variables from selectors and texts. Please refer to the example below:

```javascript
import {
  navSelectors,
  commonSelectors,
} from "../../constants/selectors/common";
import { loginSelectors } from "../../constants/selectors/login";
import { commonTexts } from "../../constants/texts/common";
import { profileSettingsTexts } from "../../constants/texts/profileSettings";
```

## Aliases

Our tests are organized functionality-wise. We need to specify relative path
i.e. `../../`. If they are deeply nested, it becomes too difficult to specify the path. When we move any file to another location, we need to update them again. So,
it's better to use the aliases instead. Webpack aliases allow us to create
aliases to import or require certain modules more easily. Instead of doing:

```javascript
import { commonSelectors } from "../../constants/selectors/common";
```

We can define an alias for the **selectors** folder so that it can be accessed
from any component without having to do relative import. To do so, add aliases
to the **webpack.config.js** as follows:

```javascript
var path = require("path");

module.exports = {
  resolve: {
    alias: {
      Selectors: path.resolve(__dirname, "constants/selectors"),
    },
  },
};
```

Now we can do

```javascript
import { commonSelectors } from "Selectors/common";
```

The problem with mentioning the directory using a combination of dots and slashes is that this is very error-prone. Using aliases makes code clean and readable. It is worth noting that here at BigBinary, we use the convention of capitalizing the path alias for Cypress.

## Usage

Take a look at the code block given below:-

```javascript
import { gettingStartedPath } from "Constants/routes";
import { commonSelectors, navSelectors } from "Selectors/common";
import { profileTexts } from "Texts/profile";

describe("Logout", { tags: "Fixed" }, () => {
  it("should verify logout functionality", { tags: "Fixed" }, () => {
    cy.get(navSelectors.myProfileNavbar).click();
    cy.contains(profileTexts.logout).invoke("click");
    cy.get(commonSelectors.heading).should("not.exist");
    cy.url().should("not.include", gettingStartedPath);
  });
});
```

Here we have imported selectors and texts from properly aliased import statements. We can also see the proper usage of Selectors within get commands, likewise, we can also see the proper usage of Texts.

For reference, these are the selector file content:-

```javascript
// constants/selectors/common

export const navSelectors = {
  myProfileNavbar: dataCy("profile-section"),
  membersTab: dataCy("agents-nav-tab"),
  tagsTab: dataCy("manage-tags-tab"),
  ...
};

export const commonSelectors = {
  paneModalCrossIcon: ".neeto-ui-pane__close",
  heading: dataCy("main-header"),
  firstNameInputError: dataCy("first-name-input-error"),
  ...
};
```

The text file content:-

```javascript
export const profileTexts = {
  logout: "Logout",
};
```
