## Naming variables and functions

Select meaningful and descriptive names that clearly communicate the purpose of both variables and functions. Utilize camelCase for naming variables and functions and use SCREAMING_SNAKE_CASE for constants. Ensure that variable and function names carry significance. Avoid resorting to hacky or cryptic names, as this practice undermines code maintainability. Use const by default, and only use let when we need to reassign the variable.

## Naming files and folders

Use lower camelCase for file and folder names. Ensure that file names clearly represent the content or functionality of the file. For example, when creating a spec file to test the creation of a customer, it is recommended to name the spec file **createCustomer.spec.ts**.

## Naming classes

Use PascalCase for class names. Choose class names that clearly describe the purpose or role of the class.

## Comments

1. Place single-line comments above the line of code it is explaining.
   Begin with a space after `//` for better readability.

2. Use multi-line comments for explanations spanning multiple lines.

3. Use TODO comments to highlight areas that need attention or improvement.

```js
// This is a single-line comment
let variable = 42;

// TODO: Refactor this code for better performance
```

Remember, comments should be used judiciously, and the code itself should be as self-explanatory as possible. Comments are helpful, but code readability should not rely solely on them.

## Destructuring

When working with complex data structures like objects or arrays, destructuring makes it easier to extract and work with specific pieces of data. Use destructuring when it enhances the readability of the code.

```js
const users = [
  { id: 1, name: "Alice" },
  { id: 2, name: "Bob" },
  { id: 3, name: "Charlie" },
];

const modifiedUsersWithDestructuring = users.map(({ id, name }) => ({
  userId: id,
  userName: name.toUpperCase(),
}));
```

## Single Responsibility Principle

Aim for functions and classes to have a single responsibility. This enhances code modularity and makes it easier to understand and maintain. This isolation makes maintenance and modifications more straightforward and reduces the risk of unintentional side effects on other parts of the application.
For example, a function named navigateToHomePage should only be responsible for redirecting to the home page.

The following example depicts a poor example of the single responsibility principle in a Javascript function.

```js
const navigateToHomePage = () => {
  if (user) return false;

  window.location.href = "/";
};
```

## Function arguments

Imagine we have a function that takes more than two arguments. Managing functions with numerous parameters can be challenging due to the need to recall the specific order of these parameters. Furthermore, there might be cases where not all parameters need values, resulting in the necessity to pass null values solely to maintain the correct parameter order.

A more effective approach is to define the arguments as an object.

```js
// Positional parameters
const listUsers = (projectId, includeInactive = true, withContactInfo) => {
  // rest of the code
};

// Named parameters
const listUsers = ({ projectId, includeInactive = true, withContactInfo }) => {
  // rest of the code
};
```

This is a theoretical chapter. There is nothing to commit in here. If you have made some changes to the project, clean them up by executing the 
following command.

```bash
git clean -fd
```