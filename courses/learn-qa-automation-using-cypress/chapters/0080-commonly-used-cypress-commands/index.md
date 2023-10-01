A UI automation tool needs some APIs or methods to interact with the DOM
elements. Cypress provides this feature in the form of Cypress commands which
can simulate the user's interaction with the application. Cypress commands are
mostly natural language English words enabling easier understanding. So let's
get started with some commonly used commands.

This chapter only explains the basic usage of each of these commands, to get to
know more about its functionality, refer to the
[official Cypress docs](https://docs.cypress.io/api/table-of-contents).

## List of Commands

### get

Used to get one or more DOM elements by selector or alias.

```js
cy.get(selector, options);
cy.get(alias, options);
```

Here the first positional argument can be a selector or alias. The selector can
be of any type, But it is
[recommended to use a **data-cy** attribute-based selector](https://docs.cypress.io/guides/references/best-practices#Selecting-Elements)
like below. We will see about aliases in later sections of this chapter.

```js
cy.get('[data-cy="submit"]');
```

An `options` object can also be passed in to change the default behavior of
`cy.get()`.

### click

Used to click a DOM element. It is chained with Cypress commands that yield a
DOM element.

```js
cy.get('[data-cy="submit"]').click();
```

`.click()` can be used with or without arguments. The other arguments allow us
to use complex functionalities. For example, the `options` argument allows us to
click multiple elements, click with key combinations etc.

### type

Used to type into a DOM element. Similar to `click()`, this command too must be
chained with a Cypress command that yields a DOM element.

```js
cy.get('[data-cy="description"]').type("Hello, World");
```

The text passed to `.type()` may include any of the
[special character sequences](https://docs.cypress.io/api/commands/type#Arguments).
These sequences can simulate a wide range of keyboard keys like `enter`,
`arrow keys`, `backspace`, etc.

Multiple keys can be pressed simultaneously by passing in a key combination using `+` as a separator.

```js
cy.get('[data-cy="description"]').type("{shift+enter}");
cy.get("body").type("{cmd+s}");
```

The modifier keys will change based on the OS. For example, on Windows, the modifier key is `{ctrl}` instead of `{cmd}`.

### fixture

Used to load a fixed set of data located in a file. It takes in a path to a file
within the fixtures folder. Read more on the directory structure of Cypress
[here](/learn-qa-automation-using-cypress/how-to-run-cypress-tests#understanding-the-cypress-directory-structure).

```js
cy.fixture("fixtures/oliver.json").then(oliver => {
  user = oliver;
});
```

When no extension is passed to `cy.fixture()`, eg: `cy.fixture(oliver)`, Cypress
will search for files with the specified name within the fixtures Folder and
resolve the first one. For more details please refer the
[Cypress docs](https://docs.cypress.io/api/commands/fixture#Omit-the-fixture-files-extension).

### as

Used to assign an alias for later use. Reference the alias later within a
`cy.get()` or `cy.wait()` command with an @ prefix.

```js
cy.get("[data-cy='main-nav']").as("firstNav"); // Setting an alias
cy.get("@firstNav"); // Referencing an alias
```

Here `firstNav` is the alias name.

An alias can be created for DOM elements, intercepts, and fixtures.

### visit

Used to visit a remote URL. It is considered best practice to set the `baseUrl`
in Cypress configuration files. At BigBinary, we add the `baseUrl` in
configuration files. With the `baseUrl` specified, only the path needs to be
passed to the `cy.visit()` command as Cypress appends the `baseUrl` with the
path.

It can either accept a `URL` or both `URL` and `options` object. We can specify
other attributes like headers, body, method, etc. inside the `options` object.

```js
// Visits index.html file of baseUrl with specified headers.
cy.visit("/index.html", { headers: { Connection: "keep-alive" } });
```

### url

Used to get the current URL of the page that is currently active.

```js
cy.url(); // Yields the current URL as a string
```

### contains

Used to get the DOM element containing the text. DOM elements can contain more
than the desired text and still match.

```js
cy.get("[data-cy='nav']").contains("About"); // Yield element in .nav containing 'About'
cy.contains("Hello"); // Yield first element in document containing 'Hello'
```

`.contains()` can be used directly or chained with commands that yield DOM
elements. When chained, the scope of `.contains()` is within the DOM yielded by
the previous command.

Usually, contains returns the deepest element with the text with some
[exceptions](https://docs.cypress.io/api/commands/contains#Preferences).

### clearCookie

Used to clear a specific browser cookie.

```js
cy.clearCookie("authId"); // clear the 'authId' cookie
```

Another similar command is the `cy.clearCookies()`, which clears all browser
cookies for the current domain and subdomain.

### clearLocalStorage

Used to clear data in `localStorage` for current domain and subdomain. It can be
used with a key argument or without it.

```js
cy.clearLocalStorage(); // clear all local storage
cy.clearLocalStorage("keyName"); // clears the particular key in local storage
```

### invoke

Used to invoke a function on the previously yielded subject. Needs to be
chained. We pass in the function name as the argument.

```js
// Invoke the jQuery 'show' function
cy.get("[data-cy='modal']").invoke("show");
```

### should

Used to create an assertion. Assertions are automatically retried until they
pass or time out.

```js
.should(chainers)
.should(chainers, value)
.should(chainers, method, value)
.should(callbackFn)

// usage

cy.get("[data-cy='error']").should("be.empty"); // Assert that '.error' is empty
```

### then

Enables you to work with the subject yielded from the previous command.

```js
cy.fixture("fixtures/oliver.json").then(oliver => {
  user = oliver;
});
```

`.then()` takes in a callback function that receives the yielded output by the
previous command.

### within

Scopes all subsequent `cy` commands to within this element. Useful when working
within a particular group of elements such as a `<form>`. It is chained with
commands yielding DOM elements.

It takes in a callback function where we can define the operations to perform
within the particular scope. The callback function takes in the DOM element
yielded by the previous command.

```html
<form>
  <input name="email" type="email" />
  <input name="password" type="password" />
  <button type="submit">Login</button>
</form>
```

```js
cy.get("form").within(form => {
  // cy.get() will only search for elements within form, not within the entire document
  cy.get('input[name="email"]').type("john.doe@email.com");
  cy.get('input[name="password"]').type("password");
  cy.root().submit();
  // root() yields the root DOM element ( Here it is the form element )
  // submit() is used to submit the form
});
```

### each

Iterate through an array like structure (arrays or objects with a length property). It takes a callback function as an argument. The callback function receives the current element as an argument.

```js
cy.get("li").each((li, index, list) => {
  // li is the current list element
  // index is the index of the current element
  // list is the entire list of elements
  cy.wrap(li).click();
});

cy.wrap([1, 2, 3]).each((number, index, list) => {
  // number is the current number
  // index is the index of the current number
  // list is the entire list of numbers
  cy.wrap(number).should("be.gt", 0);
});
```

Here are the reasons why we should use `cy.each`:

- Improved Readability: The `cy.each()` method provides a clear and expressive way to iterate over elements, making your code more readable and self-explanatory. It enhances the maintainability of your tests, as it is easier for others (including future you) to understand the intention and logic behind the iteration.

- Automatic Command Chaining: `cy.each()` automatically chains each iteration, ensuring that Cypress commands are executed in the intended sequence. This eliminates the need for managing complex asynchronous behaviour manually, as Cypress handles the command queuing and execution for you.

- Consistent Test Execution: Cypress ensures that each iteration completes before moving on to the next one. This helps maintain a consistent state and avoids race conditions that might occur when using traditional for loops. It ensures that all assertions and commands within the loop are executed in the expected order.

- Synchronization with Cypress Retry: Cypress automatically retries certain commands until they pass or time out. When using `cy.each()`, this retry behaviour is applied to each iteration individually. If an assertion within a specific iteration fails, Cypress will retry that iteration until it passes or times out, without affecting the subsequent iterations. This makes your tests more resilient to intermittent failures caused by synchronization issues.

- Improved Error Messages: When an assertion or command within a `cy.each()` iteration fails, Cypress provides detailed error messages that clearly indicate which iteration encountered the failure. This makes it easier to locate and debug issues, as you can identify the specific iteration causing the problem.

## Nature of Cypress commands

### Chain of commands

Cypress commands in the back manage a promise chain on your behalf. Each command
**yields** a subject to the next command until the chain ends or an error is
encountered.

Cypress commands do not get executed right away. These commands are asynchronous
and get queued for execution at a later time.

Because of its asynchronous nature, it must be used in an intended way or else
will result in unexpected behaviors. For example, we must be cautious when using
synchronous methods with cypress commands. As cypress commands do not execute
immediately, we must use `.then()` command to work with the result of the
command and to maintain the order of execution. For more examples of correct and
incorrect usage of commands, visit the
[Cypress docs](https://docs.cypress.io/guides/core-concepts/introduction-to-cypress#Chains-of-Commands).

Commands can yield any subject. It can be `null`, a DOM element, etc. Sometimes
a command demands a previous subject, which means it needs to be chained with a
command that yields a particular type of subject. Earlier in this chapter, it
mentioned certain commands needing to be chained, like `.click()`, `.type()`,
etc. These are some examples of such commands.

Cypress commands run serially. Even with its asynchronous nature, the commands
are never executed in parallel. Running the commands in parallel can result in
flaky tests.

### Retry-ability

A core feature of Cypress that assists with testing dynamic web applications is
retry-ability.

While all methods you chain off of `cy` in your Cypress tests are commands,
there are some different types of commands: queries, assertions and actions.

**Examples**

- **Queries**: `.get()`, `.focused()`, etc.
- **Assertions**: `.should()`, `.and()`, etc.
- **Actions**: `.click()`, `.type()`, etc.

Take this chain of commands for example

```js
cy.get('[data-cy="todo-app"]')
  .find(".todo-list li")
  .should("have.length", 1);
```

Here

- If the assertion that follows `cy.find()` passes, then the query finishes
  successfully.
- If the assertion that follows `cy.find()` fails, then Cypress will re-query
  the application's DOM again - starting from the top of the list of chain. Then
  Cypress will try the assertion against the elements yielded from
  `cy.get().find()`. If the assertion still fails, Cypress continues retrying
  until the `cy.find()` **timeout** is reached.

Retry-ability allows the test to complete each query as soon as the assertion
passes, without hard-coding waits.

Some commands like `.eq()` have built-in assertions that will cause the previous
queries to be retried.