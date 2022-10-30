## Naming components

- Component names should be self-explanatory and it should help us understand
  what the component will achieve.

- Use PascalCase for naming components in React and the file extension should be
  `.jsx`.

- Component names should be same as the filename.

## React component and filename should be same

Let's consider a file called `Table.jsx` then the component name should be exactly same as filename that is `Table`, like so:

```jsx
// Incorrect
const ContactTable = () => {
  // rest of the component
};

// Correct
const Table = () => {
  //rest of the component
};
```

If the filename is `index.jsx` then the component name should match the folder name.

For example, consider a folder structure like so:

```js
Card
    ├── index.jsx
    └── utils.js
```

Now the correct component name inside `index.jsx` file will be like so:

```jsx
// Incorrect
const Index = () => {
  // rest of the component
};

// Correct
const Card = () => {
  //rest of the component
};
```

## Importing under an alias

If we have a conflict between some third-party import and the component name then we should prefer to import the third-party entity with an alias.

Consider a file called `Pane.jsx` like so:

```jsx
// Incorrect code
import { Pane } from "neetoui";

const Pane = () => {
  // rest of the component
};
```

Now according to the filename, we have named the component `Pane` but this code will give an error as we have used the `Pane` name twice. Importing `Pane` from the `neetoui` library will lead to confusion and error as we have a component with a same name that is `Pane`. To solve such a situation we can import the third-party entities under an alias.

In the above example, `Pane` can be imported as `NeetoUIPane` using the `as` keyword like so:

```jsx
// Correct code
import { Pane as NeetoUIPane } from "neetoui";

const Pane = () => {
  // rest of the component
};
```

The alias name should be composed of the library name. In the above example, we have used `NeetoUI` based on the library name `neetoui`. If we are importing other files under an alias from the same `neetoui` library then the same alias should be used.

For example, consider a file called `Card.jsx` like so:

```jsx
// Incorrect aliases
import { Card as ExternalUICard, Table } from "neetoui";
import { Card as ExternalCard } from "antd";

const Card = () => {
  // rest of the component
};

// Correct aliases
import { Card as NeetoUICard, Table } from "neetoui";
import { Card as AntdCard } from "antd";

const Card = () => {
  // rest of the component
};
```

We have not used the alias for `Table` in the above example as it has no conflicts. We should prefer to use the alias name only in case of conflict of the same names.

## Naming routes

Developers often choose random names for routes in React. Routes should be named
in such a manner that the route should convey the purpose of the component it
will render.

Following Rails conventions for RESTful route names in client-side is a good
practice here.

For example, the route for rendering a page that contains a form to create a new
task can be `tasks/new` or the route for rendering the page that contains an
edit form can be `tasks/edit`.

Another common mistake that developers make is that they declare the routes that
do not mention the resource. For example, the route name for rendering a page
that contains a form for creating a new task should be `tasks/new` instead of
`/new`. Latter doesn't convey any information about what type of component it
will render.

You should also ensure that the frontend and backend routes for a resource do
not mismatch. For example, if the API endpoint to fetch a `task` is `tasks/:id`,
then the route for displaying a page containing that task information should be
`tasks/:id/show` rather than `task/:id/show`.

## Naming variables and functions

Variables and functions should be meaningful. People often use hacky variable
names which is not a good practice and it interferes with code maintainability.

Writing code that is easy to read and understand is very important. More so when
you are working in a team. If another member of the team needs to go through the
code then they might find it difficult to understand the code if the variable
and function names are not meaningful.

In Rails, the variable names are snake_case by convention so the entity names
for data received from the backend needs are in snake_case. These entity names
should be converted to camelCase before they can be used in the React code. For
example take a look at the following code snippet:

```jsx
const ShowTasks = () => {
  const [pendingTasks, setPendingTasks] = useState([]);
  const [completedTasks, setCompletedTasks] = useState([]);

  const fetchTasks = async () => {
    try {
      const response = await tasksApi.list();
      setPendingTasks(response.data.tasks.pending_tasks);
      setCompletedTasks(response.data.tasks.completed_tasks);
    } catch (error) {
      logger.error(error);
    } finally {
      setLoading(false);
    }
  };
};
```

In the above code, we converted the `pending_tasks` which is in snake case to
`pendingTasks`. The point here is that in React the variable names should be
camelCase.

Another thing worth mentioning here is that the data which is sent to a Rails
backend as a payload along with a POST/PUT request should contain snake_case
variable names. For example,

```jsx
const handleSubmit = async event => {
  event.preventDefault();
  setLoading(true);
  try {
    await tasksApi.create({ task: { title, assigned_user_id: userId } });
    setLoading(false);
    history.push("/");
  } catch (error) {
    logger.error(error);
    setLoading(false);
  }
};
```

Notice the snake_case variable name in the data passed to the `tasksApi.create`
function.

## Naming boolean variable and function

While naming a boolean variable or a function that returns a boolean value, we should use prefixes like `is`, `has`, `should`, etc, so that the name will sound like a yes or no question. This helps in improving the code readability as the reader will understand by the name itself that this variable or function is handling a boolean value.

For example:

```js
// Incorrect variable name
const [openMenuBar, setOpenMenuBar] = useState(false);
// Correct variable name
const [isMenuBarOpen, setIsMenuBarOpen] = useState(false);
```

The `openMenuBar` name sounds like it's an action, in the sense whenever we use that variable or function, it `opens the menu bar`. But the purpose of the variable in this context is not for performing any action. More than that, when we prefix the name with the `is` keyword that is `isMenuBarOpen` it sounds like a question. And now the reader will know from the name itself that we are dealing with a boolean variable here.

If we have a function that deals with a yes or no situation then that function name can be prefixed with a boolean keyword like is, should, etc.

For example:

```js
// Incorrect function name
const redirectToLoginPage = data => {
  if (!data.globalProps.user.authenticated) return history.push(routes.login);
};

// Correct function name
const shouldRedirectToLoginPage = data => {
  if (!data.globalProps.user.authenticated) return history.push(routes.login);
};
```

In the above mentioned example, the function name `redirectToLoginPage` sounds like whenever this function is invoked user will be redirected to the login page. But that's not the case. The function is checking a condition and if that condition is `true` then only the user will be redirected. When we prefix the name with the `should` keyword that is `shouldRedirectToLoginPage` it sounds like a question. And it's clear from the name itself that we are handling some yes or no conditions in the function.

## Naming helper and validations files

- Helper files that contain the utility functions which are used to perform
  certain tasks should be named `utils.js`.

  For example, a function which fetches the values stored in the browser
  localstorage like so:

```javascript
const getFromLocalStorage = key => JSON.parse(localStorage.getItem(key));
```

## Naming buttons

While naming buttons, make sure it clearly conveys what action the button
performs. Avoid using any technical terms or jargon. For example, a button that
takes the user to a page for creating a task should be named `Add Task` instead
of `Create Task`.

While developing a form, the reset button usually contains an ambiguous name.
For example, in a form used to edit a task, a button named `Reset` at the end of
the form can mean two things. It could mean, reset the values to their default
values, for example reset the value of due date to it's default value which
could be today's date. Or it could mean, reset to the values that are saved in
the database. For this form, `Cancel` is a more appropriate name since it
clearly indicates that any changes made in the form will be cancelled.

## Avoid ambiguous naming

Naming variables and functions correctly is very important for conveying the
purpose they are serving. Often developers choose ambiguous names which are not
very meaningful. It can lead to poor code readability and maintainability.

For example, consider the following component:

```jsx
import React, { useState } from "react";

const Display = () => {
  const [userList, setUserList] = useState([]);
  const [filteredUsers, setFilteredUsers] = useState([]);

  const filterUser = () => {
    const selectedItems = userList.filter(user => user.age > 25);
    setFilteredUsers(selectedItems);
  };

  return <button onClick={filterUser}>Filter Users</button>;
};

export default Display;
```

In the above piece of code, the variable name `selectedItems` inside the
`filterUser` function is vague and it doesn't convey anything about what items
stands for. A better name would have been `selectedUsers`.

## Avoid unnecessary namespacing

While naming a file, component, function, or variable we shouldn't add any unnecessary namespace in their names.

For example, check this folder structure:

```js
└── Form
    ├── CreateForm.jsx
    └── EditForm.jsx
```

Files should be named like this:

```js
└── Form
    ├── Create.jsx
    └── Edit.jsx
```

It is understood from the folder name that the `Create` and `Edit` are `Form`
components and thus we don't have to append the `Form` keyword again in their names.

Let's consider this folder structure:

```js
└── Form
    └── Create
        ├──index.jsx
        ├──constants.js
```

The component name inside `Form/Create/index.jsx` should be `Create` not `CreateForm` as Create folder is already in the `Form` namespace.

Please note that while using this `Create` component outside the `Form` namespace, importing the component as `Create` can be confusing so we can import this component as `CreateForm` if required outside the `Form` namespace, like so:

```js
import CreateForm from "./Form/Create";
```

We should also avoid this unnecessary namespacing while naming variables or functions. Let's say there is a variable defined inside `Form/Create/constants.js`, like so:

```js
const CREATE_FORM_INITIAL_VALUES = {
  //some values
};
```

This variable is already inside `Form/Create`. Thus we should avoid any unnecessary namespacing unless there is another conflicting variable name. So here the preferred name is:

```js
const INITIAL_VALUES = {
  //some values
};
```

Let's consider another example and figure out the problems in it. Consider a folder structure like so:

```js
components
  └── Notes
     └── NotesCard
          ├── Cards.jsx
          ├── CardDropdown.jsx
          └── utils.js
```

- `NotesCard` is already in the `Notes` namespace. So `NotesCard` should be updated to `Card`.

- If we are rendering only one card in `Cards.jsx` then usage of the keyword `Cards`, that is plural, is wrong. It should be singular that is `Card.jsx`. But even if we make this change there will still be a namespace issue. Right now the updated path will be `Notes/Card/Card.jsx`. Here again we have named the file `Card.jsx` although it's already within the `Card` namespace. Thus the `Card.jsx` should be renamed as `index.jsx` since it's the main module under the `Card` namespace.

- `CardDropdown.jsx` is in `Card` directory, but it has an unnecessary namespace. So the correct name will be `Dropdown.jsx`.

So the correct file names will be like so:

```js
components
  └── Notes
     └── Card
          ├── index.jsx
          ├── Dropdown.jsx
          └── utils.js
```

We can import the `index.jsx` and `Dropdown.jsx` in other files like so:

```jsx
import Card from "components/Notes/Card";
import Dropdown from "components/Notes/Card/Dropdown";
```

If there are other imports with the same names and if the component names `Card` and `Dropdown` create confusion when imported outside the `Notes` namespace then we can import the `Card` and `Dropdown` with the prefix of their directory name like so:

```jsx
import NotesCard from "components/Notes/Card";
import CardDropdown from "components/Notes/Card/Dropdown";
```

## Naming dynamic route builders

As the project grows the number of routes and length of a route increases, therefore, we build these functions called dynamic route builders which build the required dynamic route with the specific parameters. They help in keeping the code DRY and we don't have to remember the routes and build them manually.

For example, consider the following function:

```jsx
const buildProjectDetailsFormRoute = projectId => `/projects/${projectId}/details/form`
```

Some conventions need to be followed for these functions:

- The function name should start with the `build` keyword and end with the `Route` keyword as we are building the route.
- The function name should resemble the route it's building.
- These functions should be kept within the global scope with all the routes of the application.

## When to use the render keyword?

There are some cases when we use separate functions to render some part of the component's UI to maintain our code's readability and modularity. For example:

```jsx
const Dashboard = () => {
  //rest of the component
  const usersTable = () => {
    return (
      <Table
      //rest of the code to render a table
      />
    );
  };

  const createUserButton = () => {
    return (
      <Button
      //rest of the code to render a button
      />
    );
  };

  return <div>{users.length > 0 ? usersTable() : createUserButton()}</div>;
};
```

Now, this code will work but these functions have a problem in their naming. The names `usersTable` and `createUserButton` are vague and don't convey what the functions do. Thus all the function which returns some `JSX` for rendering in the UI should have a keyword `render` prefixed in their names.

So the correct code will be:

```jsx
const Dashboard = () => {
  //rest of the the component
  const renderUsersTable = () => {
    return (
      <Table
      //rest of the code to render a table
      />
    );
  };

  const renderCreateUserButton = () => {
    return (
      <Button
      //rest of the code to render a button
      />
    );
  };

  return (
    <div>
      {users.length > 0 ? renderUsersTable() : renderCreateUserButton()}
    </div>
  );
};
```

Now, these names do tell what these functions do. Also, this keyword should be used only when a function is returning some JSX for rendering in the UI.

Let's consider another example. There is a method named as `renderUserOptions` which does some operations on a `users` array. The output from this function will be used by a `Select` component for properly populating its options. The code will be, like so:

```jsx
const Dashboard = () => {
  //rest of the component
  const renderUserOptions = users => {
    return [
      //code for structuring users
    ];
  };

  return (
    <div>
      <Select options={renderUserOptions} />
    </div>
  );
};
```

Here we can see that this `renderUserOptions` function is not returning any `JSX`. It's just helping the `Select` component by building data, and not rendering data. So a better name would be something like `buildUserOptions` rather than `renderUserOptions`, like so:

```jsx
const Dashboard = () => {
  //rest of the component
  const buildUserOptions = users => {
    return [
      //code for some structuring
    ];
  };

  return (
    <div>
      <Select options={buildUserOptions} />
    </div>
  );
};
```

## Use camelCase in iterator name

If we are iterating through an array then we should use camelCase while naming the iterator. Let's say we have an array of objects named `MENUBAR_BLOCKS`. We can iterate through this array like this:

```jsx
// snake_case - Not correct
{
  MENUBAR_BLOCKS.map(menubar_block => (
    <NeetoMenuBar.Block
      active={menubar_block.active}
      count={menubar_block.count}
      key={menubar_block.label}
      label={menubar_block.label}
    />
  ));
}

// camelCase - correct
{
  MENUBAR_BLOCKS.map(menubarBlock => (
    <NeetoMenuBar.Block
      active={menubarBlock.active}
      count={menubarBlock.count}
      key={menubarBlock.label}
      label={menubarBlock.label}
    />
  ));
}
```

In React we use camelCase while naming variables and the same goes with this case. We should use camelCase while naming iterator when iterating through a literal constant. Therefore `menubar_block` in the above example should be named as `menubarBlock`.

## Use upper snake case in constant name

While naming a constant variable in JavaScript we should use the upper snake case.

Consider a `constants.js` file in which we want to define a constant variable, like so:

```jsx
// camelCase - Incorrect
export const tableColumns = {
  // columns data
};

// Upper snake_case - Correct
export const TABLE_COLUMNS = {
  // columns data
};
```

Now while using these constant variables in other files we can use the same upper snake case name. There is no need to update the name to camelCase while importing. The constant variable's name should always be in the upper snake case.

For example:

```jsx
// Incorrect
import { TABLE_COLUMNS as tableColumns } from "./constants.js";

// Correct
import { TABLE_COLUMNS } from "./constants.js";
```

## When to use handle and on keyword?

The function names should always be meaningful and self-explanatory. The name of the function should convey what the function is doing.

For example, consider a function that deletes a note. We can name this function `deleteNote`, like so:

```jsx
const deleteNote = () => {
  // rest of the code
}
```

If the function handles the events triggered by some actions like `click`, `submit`, etc then we should prefix the function name with the `handle` keyword.

Let's say we have added the above-mentioned function to a button's `click` event. Then a better name for the function would be `handleDeleteNote` as it's handling a `click` event, like so:

```jsx
const handleDeleteNote = () => {
  //rest of the code
}
```

The `on` keyword is used in the React events. We should prefix `on` keyword with function which emits an event.

For example:

```jsx
<Button onClick={handleDeleteNote} />
```

We should prefix the component's props with `on` keyword that handles the event.

For example:

```jsx
// Good
<CustomButton onClick={handleDeleteNote} />

// This is also fine. But above one is preferred
<CustomButton handleClick={handleDeleteNote} />
```

In the above example, the `onClick` is not a React event. The `onClick` is a prop which is containing the event handler function that is `handleDeleteNote`.

## Reserve set keyword for useState setters

When naming variables and function we should not use the `set` keyword. The `set` keyword should be reserved for the `useState` setters functions.

For example:

```jsx
// Correct
const [name, setName] = useState("");
const [email, setEmail] = useState("");
const [password, setPassword] = useState("");

// Incorrect
const setMenuItems = () => {
  // rest of the code
};
```

The `set` keyword should be reserved to just naming the React state setters. In the above example, we can update the function name from `setMenuItems` to something like `buildMenuItems`, `renderMenuItems`, etc depending upon the work of this function. But we should not use `set` prefix as it is a custom function and not a React state setter function. So if `setMenuItems` is actually building the menu items then the correct name will be `buildMenuItems`.

In a big codebase, someone new who is trying to understand the code might make a false assumption that the `setMenuItems` is a setter function whereas it's just an util function. Also in your text editor, say VSCode, it might autocomplete the custom function's name, that is `setMenuItems` if we type in the keyword `set` and a developer might accidentally autocomplete it thinking it's a React state setter. Thus we should reserve the `set` keyword and never prefix custom functions with the `set` keyword.

## Use of jsx file extension

Using JSX we can add HTML in React easily. Generally `.jsx` file extension is used for React component. But it's not mandatory that `.jsx` extension can only be used for a React component. We can use the `.jsx` file extension whenever the file contains some JSX.

Let's say we have a variable called `columnData` in a `utils.js` file, like so:

```js
export const columnData = setShowAlert => [
  {
    title: "Name",
    dataIndex: "firstName",
    key: "firstName",
    width: "30%",
  },
  {
    title: "Email",
    dataIndex: "email",
    key: "email",
    width: "30%",
  },
];
```

Now say in the `columnData` variable we want to use JSX and return some HTML code. In that case, we can use the `.jsx` extension in the file name. We can rename the file as `utils.jsx` and can use the JSX in `columnData`, like so:

```jsx
export const columnData = setShowAlert => [
  {
    title: "Name",
    dataIndex: "firstName",
    key: "firstName",
    width: "30%",
    render: firstName => (
      <div className="flex space-x-3">
        <Avatar
          size="large"
          user={{
            imageUrl: "https://i.pravatar.cc/300",
          }}
        />
        <div>{firstName}</div>
      </div>
    ),
  },
  {
    title: "Email",
    dataIndex: "email",
    key: "email",
    width: "30%",
  },
];
```

So we should use the `.jsx` extension for the files that contain JSX because:

- It enhances the autocompletion and linting in editors like VSCode.

- The developer can easily understand whether a particular file is dealing with JSX or not by checking the file extension itself.

- It abides by the ESLint rules we are using in the [wheel](https://github.com/bigbinary/wheel).