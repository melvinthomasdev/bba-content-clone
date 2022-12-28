## A Brief Summary

- Use PascalCase for naming components
- Use camelCase for naming variables and functions.
- Use SCREAMING_SNAKE_CASE for naming constants.
- All names should be self-explanatory and help the reader understand what the component achieves.
- Component names should be the same as the file name.
- The file extension for any files containing JSX should be `.jsx` to help autocompleters, linters and any readers trying to figure out whether a given file contains JSX.
- Helper files that contain utility functions should preferably be named or suffixed with `utils`.

## React component and filename should be the same

If you have a file containing a component called `ContactTable` like so :

```jsx
const ContactTable = () => {
  // rest of the component
};
```
Do name it `ContactTable.jsx` so that any reader will easily be able to understand exactly which component lies within from the folder structure itself.

Refrain from naming the file `Table.jsx`, `Contacts.jsx`.

However, If the filename is `index.jsx` then the component name should be the same as the folder name.

For example, consider a folder structure like so:

```js
UserCard/
├── index.jsx
├── Header.jsx
├── Footer.jsx
└── utils.js
```

This would be correct assuming the `index.jsx` file contains a `UserCard` component like so :

```jsx
const UserCard = () => {
  //rest of the component
};
```

## Naming variables and functions

Variables and functions must be meaningful. People often use hacky variable names which is a bad practice that interferes with code maintainability.

Writing code that is easy to read and understand is very important in teams.

## Naming boolean variable and function

When naming a boolean variable or a function that returns a boolean value, we use prefixes like `is`, `has`, `should`, etc, making the name sound like a yes or no question. This convention helps in improving the code readability.

For example:

```js
// Incorrect variable name
const [openMenu, setOpenMenu] = useState(false);
// Correct variable name
const [isMenuOpen, setIsMenuOpen] = useState(false);
```

The `openMenu` name sounds like an action to open the menu bar.

The `isMenuOpen` name sounds like a question that informs the reader that it is a boolean.

The same principle can be applied to functions like in the following example :

```js
// Incorrect function name
const redirectToLoginPage = user => !user.authenticated || user.timeout
// Correct function name
const shouldRedirectToLoginPage = data => !user.authenticated || user.timeout
```

`shouldRedirectToLoginPage` is more indicative that the function returns a boolean value compared to `redirectToLoginPage` which sounds like it does the redirection instead.

## Avoid unnecessary namespacing

### Regular Components

While naming files, components, functions or variables, we shouldn't add any unnecessary namespaces in their names.

An example of unnecessary namespacing is shown in the example below :

```js
Form/
├── CreateForm.jsx
├── EditForm.jsx
└── ShowForm.jsx
```

It could just as easily be written as :

```jsx
Form/
├── Create.jsx
├── Edit.jsx
└── Show.jsx
```

Since the folder name is `Form`, we don't have to prefix `Form` to every component within.

### Indexed Components

Within indexed components like this :

```js
Form/
└── Create/
    ├── index.jsx
    └── constants.js
```

The component name inside `Form/Create/index.jsx` should be `Create` not `CreateForm` as Create folder is already in the `Form` namespace.

When using the `Create` component outside the `Form` namespace, we can import it using the `Create` suffix if required like so (since it uses a default import) :

```js
import CreateForm from "./Form/Create";
```

### Constants

A constant defined inside `Form/Create/constants.js`, like so :

```js
const CREATE_FORM_INITIAL_VALUES = {
  //some values
};
```

can just as easily have the name `INITIAL_VALUES` since the variable is already inside `Form/Create`.