Use camelCase for naming variables and functions.
Use SCREAMING_SNAKE_CASE for naming constants.

Variables and functions must be meaningful. People often use hacky variable names which is a bad practice that interferes with code maintainability. All names should be self-explanatory and help the reader understand what the component achieves.

Writing code that is easy to read and understand is very important in teams.

## Naming boolean variables and functions

When naming a boolean variable or a function that returns a boolean value, we use prefixes like `is`, `has`, `should`, etc, making the name sound like a yes or no question. This convention helps in improving the code readability.

Here at BigBinary, we exclusively name all boolean variables with the `is` prefix.

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