## Project Structure

The react code structure starts from the **src** folder. The first file we
encounter is **App.jsx**. It is the root of all the files. Then we logically
divide components in the components folder. Each folder can have an
**index.jsx** file. The index file is considered as the starting of the folder
even though it's not mandatory to always have an index file.

In the `src` folder we can have folders and files as follows:

1. **apis** - All the backend calls are to be made from the apis folder. We can
   have multiple files specific to each component.
2. **hooks** - This folder contains global reusable hooks.
3. **stores** - This folder contains all the state management stores.
4. **components** - This folder contains all the react components. If we have a component specific hook, store, etc then we use the `commons`, `hooks`, and `stores` folder inside the component folder.
5. **lib** - This will contain all the files related to third-party libraries that we override or initialize.
6. **translations** - This folder will contain all the translations related files.
7. **routes.js** - This file contains all the project level routes
8. **App.jsx** - This file is the starting point of the application.

- **utils/constants** - The `utils` or `constants` folder can be placed at any nested level in the closest scope. If we have only one file inside the `utils` or `constants` folder then we should use a file with a name like `utils.js`, `utils.jsx`, `constants.js`, `constants.jsx`, etc. We can use these files at any nested level in the closest scope same as the `utils` or `constants` folder.

- _All these folders should be of lower case._
- _There could be more folders depending on the requirement._

Example **src** folder

```js
├── App.jsx
├── routes.js
├── apis
│   ├── authentication.js
│   ├── axios.js
│   └── notes.js
├── lib
|   ├── dayjs.js
│   └── logger.js
├── utils
│   ├── string.js
│   ├── storage.js
|   └── index.js
├── components
│   ├── Authentication
│   │   ├── Login.jsx
│   │   ├── ResetPassword.jsx
│   │   ├── Signup.jsx
│   │   └── constants.js
│   ├── Common
│   │   ├── EmptyState.jsx
│   │   ├── Navbar.jsx
│   │   └── PrivateRoute.jsx
│   ├── Dashboard
│   │   ├── Account
│   │   │   ├── Password
│   │   │   │   ├── Create.jsx
│   │   │   │   └── Edit.jsx
│   │   │   └── Profile.jsx
│   │   ├── Notes
│   │   │   ├── NewPane.jsx
│   │   │   ├── Table.jsx
│   │   │   ├── SubHeading.jsx
│   │   │   ├── index.jsx
│   │   │   └── utils.js
│   │   └── index.jsx
│   └── Main.jsx
├── hooks
|   └── useParams.js
├── stores
|   ├── auth.js
|   └── user.js
└── translations
    ├── en.json
    └── fr.json
```

## Component Structure

All the components should be inside the **components** folder. We should
logically group the components into folders according to the requirement.

- _All the folder name should start with upper case._
- _All the React files should start with upper case except for index file._

Example **Customer** folder

```js
├── ActionSidebar
│   ├── Activities.jsx
│   ├── Detail.jsx
│   ├── Tag.jsx
│   └── index.jsx
├── Form
│   ├── Email.jsx
│   ├── Link.jsx
│   ├── Phone.jsx
│   ├── index.jsx
│   └── validator.jsx
├── Pane
│   ├── Create.jsx
│   ├── Edit.jsx
│   └── Password.jsx
├── Table.jsx
├── Details.jsx
├── constants.js
└── index.jsx
```

- Code starts from index file
- If there are multiple panes, it can be grouped into a folder.
- If there multiple forms, it can be grouped into a folder.
- Constants file can be used to store initial values, default values, etc.

A common mistake that should be avoided is creating folders for component when
not required. For example, consider an arbitrary component called `Dashboard`.
If the `Dashboard` component does not contain any forms or if it is build up of
multiple components then it should not be declared inside the
`components/Dashboard/index.jsx` file like so:

```js
Dashboard
    └── index.jsx
```

It should be declared inside the `components/Dashboard.jsx` file.

## When to add an index.js?

If there are multiple components exported from a namespace, then it's a good
idea to add an `index.js` within that namespace so that we don't have to add
multiple imports but rather keep it down to a single import.

Consider this example:

```js
import EmptyState from "components/Common/EmptyState";
import Menubar from "components/Common/Menubar";
```

Two components `EmptyState` and `Menubar` are imported from the same namespace that is `components/Common`. We can add an `index.js` file in that namespace to reduce the number of import statements, like so:

```js
import EmptyState from "./EmptyState";
import Menubar from "./Menubar";

export { EmptyState, Menubar };
```

Now after adding the above `index.js` file we can update the import statements, like so:

```js
import { EmptyState, Menubar } from "components/Common";
```

## Default export vs named export

We should use the named exports only when we are exporting multiple entities from the same module as mentioned in the above section. In rest of the cases, we should use default exports.

For example, if there is only one file in `components/Common` that is `EmptyState.jsx` then there will be no `index.js` file in that module as mentioned in the above section. This `EmptyState.jsx` file is exporting only one component which is `EmptyState`.

Now we can either make a named export or default export for the `EmptyState` component, like so:

```js
//Named Export
export const EmptyState = () => {
  //component's code
};

//Default Export
export default EmptyState = () => {
  //component's code
};
```

In the above-mentioned case, we should prefer the default export because there is only one export from this `EmptyState.jsx` file.

We can import this `EmptyState` component if it's a default export, like so:

```js
import EmptyState from "components/Common/EmptyState";
```

## Use a single import for a module

Take a look into the following piece of code:

```js
import { Table } from "neetoui";
import { Container } from "neetoui";
```

So there are two imports, importing entities from the same module. This should be converted into a single import statement as it makes the code look more compact and removes unnecessary lines of code. Thus we should be writing the above imports like so:

```js
import { Table, Container } from "neetoui";
```

If your project is using the eslint config from [wheel](https://github.com/bigbinary/wheel/blob/master/.eslintrc.js), then eslint would automatically point out cases where we can use single import over multiple import statements.

## Keep the files in closest scope

We don't need to keep the helper files or functions at global scope unnecessarily. We should always try to keep the files within the closest scope.

- It helps with easier navigation to the dependent files of a scope/entity.

- It also doesn't pollute the global files like say the `src/utils`.

Consider the following folder structure:

```js
src
├── components
    ├── Common
         └── Input.jsx
    ├── Form
         ├── CreateForm.jsx
         └── EditForm.jsx
    └── Main.jsx
└── utils
    └── index.js
```

Let's say we have a function called `calculateCreatedAgo` in `src/utils/index.js` which is used in `CreateForm.jsx` and `EditForm.jsx` files only. As the `calculateCreatedAgo` function is used only within the `Form` scope we should keep the `calculateCreatedAgo` function in an `utils.js` within the `Form` folder.

The updated folder structure will be:

```js
src
└── components
    ├── Common
         └── Input.jsx
    ├── Form
         ├── CreateForm.jsx
         ├── EditForm.jsx
         └── utils.js // contains the calculateCreatedAgo function
    └── Main.jsx
```

This doesn't mean that we shouldn't utilize the global `src/utils` folder. If a particular utility is used across multiple scopes, then we should prefer to keep that utility function in the global scope that is in `src/utils` folder. The main idea is to keep the things DRY as possible.

## Keep useState at top

We should keep the `useState` hook towards the top of the component. `useState` is the most commonly used hook in the component. We should keep all the `useState` hooks together and at the top of the component. After `useState` hooks, all the other hooks should be kept followed by the other custom variable definitions. We should use a new line after each group so that each group can be clearly identified. This hierarchal structure gives us a visual segregation in the component and it makes it easier to find the required state or variable.

For example:

```jsx
// Incorrect
const Dashboard = () => {
  const [name, setName] = useState("");
  const { user } = useContext(userContext);
  const isAdmin = false;
  const [email, setEmail] = useState("");
  // rest of the component
};

// Incorrect
const Dashboard = () => {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const { user } = useContext(userContext);
  const isAdmin = false;
  // rest of the component
};

// Correct
const Dashboard = () => {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");

  const { user } = useContext(userContext);

  const isAdmin = false;
  // rest of the component
};
```

There can be a case where the initial value for the `useState` hook is dependent on some other hook. In that case, we can use other hooks before `useState` hook.

For example:

```jsx
const Dashboard = () => {
  const location = useLocation();

  const [selectedTab, setSelectedTab] = useState(location.pathname);
  // rest of the component
};
```