Targeting the element by tag, class or id is very volatile and highly subject to
change. We may swap out the element, refactor CSS and update IDs, or add or remove classes that affect the style of the element.

Instead, adding the `data-cy` attribute to the element gives us a targeted
selector that's only used for testing.

The `data-cy` attribute will not change any CSS style or a JS behavior, meaning
it's not coupled to the behavior or styling of an element.

Additionally, it makes it clear to everyone that this element is used directly
by the test code.

## Conventions for adding data-cy

There are no particular conventions for adding `data-cy`, but here in BigBinary
we have set our own conventions for better code readability.

### data-cy must be added in a particular format

```javascript
data-cy="functionality-name-field-name-type-of-the-field"
```

### Pass data-cy as a prop

When we use `cy` as an attribute we use hyphen i.e. `data-cy`. But, in a react
application we need to pass it as a prop to another component. In some cases,
data-cy might not work, in that case we can use dataCy:

```javascript
  <Button
    style="icon"
    data-cy=""
    ...
  />

  NavItem({
    icon,
    link,
    dataCy,
    ...
```

### Use lowercase

Everything should be in lowercase while adding `data-cy`. e.g. Consider we
want to add `data-cy` to the application's icon, say _AceInvoiceIcon_:

```javascript
// Incorrect
data-cy="aceInvoice-Icon"

// Correct
data-cy="ace-invoice-icon"

```

### Adding data-cy for different elements

- `data-cy` for labels e.g. Adding data-cy to a label, say "Email" label:

```javascript
data-cy="email-label"
```

- `data-cy` for links e.g. Adding `data-cy` to any link, say _signup_ link:

```javascript
// Incorrect
data-cy="signup"

// Correct
data-cy="signup-link"
```

- `data-cy` for text fields e.g. Adding `data-cy` for email text field on login
  page:

```javascript
// Incorrect
data-cy="login-email"

// Correct
data-cy="login-email-text-field"
```

- `data-cy` for checkboxes e.g. Adding `data-cy` for _'remember me'_ checkbox on
  login page:

```javascript
// Incorrect
data-cy="login-remember-me"

// Correct
data-cy="login-remember-me-check-box"
```

- `data-cy` for radio buttons e.g Adding `data-cy` for the radio button for the
  role of a member:

```javascript
// Incorrect
data-cy="member-role-button"

// Correct
data-cy="member-role-radio-button"
```

- `data-cy` for dropdown lists e.g. Adding `data-cy` for dropdown lists of
  countries:

```javascript
// Incorrect
data-cy="country-list"

// Correct
data-cy="country-drop-down-list"
```

- `data-cy` for buttons e.g. Adding `data-cy` for submit details button on login
  page:

```javascript
// Incorrect
data-cy="login-submit"

// Correct
data-cy="login-submit-button"
```

e.g. Adding `data-cy` for delete button to delete a team member:

```javascript
// Incorrect
data-cy="team-member-delete"

// Correct
data-cy="team-member-delete-button"
```

### Handling special case

Sometimes the element is very common throughout the whole application, in
such cases `data-cy` values for these elements can be kept in
`selectors/common`. e.g. In neeto products, the heading selector is very
common part for different pages in the application. Hence, the `data-cy`
value for this element can be generic.

```javascript
data-cy="heading"
```

### Using data-cy with neetoUI library elements

In neeto applications, we are using neetoUI component library.
In neetoUI, data-cy can be added or already added to most of the elements.
However, it uses some external libraries as well. In such cases, we can't add
data-cy to those elements and we can use the selectors available for that
element. e.g. The dropdowns in the _neeto_ are custom dropdowns and `data-cy`
cannot be added to such elements.

We should try to use `data-cy` whenever possible.
