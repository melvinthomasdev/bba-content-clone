Namespaces are very convenient to categorize certain parts of code.
But do avoid repeating the name of the space within the namespace as shown in the following example:

### Regular Components

Here's an example of redundant namespacing in a few components:

```js
Form/
├── CreateForm.jsx
├── EditForm.jsx
└── ShowForm.jsx
```

Since the folder name is `Form`, we don't have to suffix `Form` to every component within.
It could just as easily be written as:

```jsx
Form/
├── Create.jsx
├── Edit.jsx
└── Show.jsx
```

### Indexed Components

Here's an index file that contains a component:

```js
Form/
└── Create/
    ├── index.jsx
    └── constants.js
```

The component name inside `Form/Create/index.jsx` should be `Create` not `CreateForm` as Create folder is already in the `Form` namespace.

When using the `Create` component outside the `Form` namespace, we can import it using the `From` suffix if required as shown below:

```js
import CreateForm from "./Form/Create";
```

### Constants

A constant defined inside `Form/Create/constants.js`, like so:

```js
const CREATE_FORM_INITIAL_VALUES = {
  //some values
};
```

can just as easily have the name `INITIAL_VALUES` since the variable is already inside `Form/Create`.