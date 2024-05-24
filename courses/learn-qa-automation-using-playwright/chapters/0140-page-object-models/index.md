## Introduction

The Page Object Model (POM) is a design pattern used in software development, particularly in test automation, to enhance the maintainability and readability of test code. The fundamental idea behind the Page Object Model is to represent the pages of a web application as objects, with each object encapsulating the behavior and elements of a specific page.

Create an individual class for every web page you're testing. This class should wrap up all the actions and items on that specific web page.

```js
export default class LoginPage {
  constructor(page) {
    this.page = page;
  }

  login = async ({ email, password }) => {
    await this.page.getByPlaceholder("Enter email").fill(email);
    await this.page.getByPlaceholder("Enter password").fill(password);
    await this.page.getByRole("button", { name: "Submit" }).click();
  };
}
```

To use the class in our test we can simply do the following,

```js
const loginPage = new LoginPage(page);
loginPage.login({ email: "oliver@example.com", password: "welcome" });
```

## Benefits of using the Page Object Model

**Code Reusability:** Page Objects can be reused across multiple tests, promoting a modular and maintainable test suite.

**Enhanced Readability:** Test scripts become more readable and expressive, as high-level actions are represented by method calls on Page Objects.

**Easy Maintenance:** Changes in the UI are isolated to the corresponding Page Object, reducing the effort required to update the test code.

This is a theoretical chapter. There is nothing to commit in here. If you have made some changes to the project, clean them up by executing the 
following command.

```bash
git clean -fd
```