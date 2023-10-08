## Project Structure

The react code structure starts from the **src** folder. The first file we
encounter is **App.jsx**. It is the root of all the files. Then we logically
divide components in the components folder. Each folder can have an
**index.jsx** file. The index file is considered as the starting of the folder
even though it's not mandatory to always have an index file.

In the `src` folder we can have folders and files as follows:

1. **apis** - All the backend calls are to be made from the apis folder. We can
   have multiple files specific to each component.
2. **hooks** - This folder contains all the custom hooks.
3. **stores** - This folder contains all the state management stores.
4. **components** - This folder contains all the react components. And, all the reusable components should be stored in the `commons` folder within the `components` folder.
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
│   ├── commons
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
`components/Dashboard/index.jsx` file like this:

```js
Dashboard
    └── index.jsx
```

It should be declared inside the `components/Dashboard.jsx` file.

## Semantic folder and component names

While working on applications, the most basic yet confusing task is to name folders and components semantically correct. Many a times, we are unable to find an apt name for a component hence resorting to a vague name. However, this causes issues when someone else or you, yourself revisit the code after a few days.

```jsx
// Bad Naming Convention
const Right_Section = () => <div />;
const snakeCasedComponentName = () => <div />;
const SomeRandomNameThatDoesNotFitTheUseCase = () => <div />;

// Good Naming Convention
const UserDetails = () => {};
const UserProfileDetails = () => {};
```

Let's consider a case where we are working on a right fixed sidebar that shows user details. Now, let's consider that the right sidebar consists of 4 cards, one each for user profile details, credit information, user activity logs, and user tickets. In such a scenario, we can follow the following folder structure -

```
components/
|
|– UserProfile/
|   |– Details.jsx          // All code wrt to user details
|   |– CreditDetails.jsx    // All code wrt to user credit details
|   |– ActivityLogs.jsx     // All code wrt to user activity logs
|   |– Tickets.jsx          // All code wrt to user ticket activities
|   |– index.jsx            // Entry point
```

Here, rather than polluting a single `jsx` file with all the UI and APIs related to user details, activities, credit details and tickets. We have split the functionality into components such that each component is specific to a task. All components are then imported to `index.jsx` and rendered accordingly with respect to the logic required.

```jsx
import React from "react";

import Details from "./Details";
import CreditDetails from "./CreditDetails";
import ActivityLogs from "./ActivityLogs";
import Tickets from "./Tickets";

const UserDetails = () => {
  // API and other logic here
  return (
    <>
      <Details />
      <CreditDetails />
      <ActivityLogs />
      <Tickets />
    </>
  );
};

export default UserDetails;
```

## When to add an index.js?

If there are multiple components exported from a namespace, then it's a good
idea to add an `index.js` within that namespace so that we don't have to add
multiple imports but rather keep it down to a single import.

Consider this example:

```js
import EmptyState from "components/commons/EmptyState";
import Menubar from "components/commons/Menubar";
```

Two components `EmptyState` and `Menubar` are imported from the same namespace that is `components/commons`. We can add an `index.js` file in that namespace to reduce the number of import statements, like this:

```js
import EmptyState from "./EmptyState";
import Menubar from "./Menubar";

export { EmptyState, Menubar };
```

Now after adding the above `index.js` file we can update the import statements, like this:

```js
import { EmptyState, Menubar } from "components/commons";
```

## Default export vs named export

We should use the named exports only when we are exporting multiple entities from the same module as mentioned in the above section. In rest of the cases, we should use default exports.

For example, if there is only one file in `components/commons` that is `EmptyState.jsx` then there will be no `index.js` file in that module as mentioned in the above section. This `EmptyState.jsx` file is exporting only one component which is `EmptyState`.

Now we can either make a named export or default export for the `EmptyState` component, like this:

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

We can import this `EmptyState` component if it's a default export, like this:

```js
import EmptyState from "components/commons/EmptyState";
```

## Use a single import for a module

Take a look into the following piece of code:

```js
import { Table } from "neetoui";
import { Container } from "neetoui";
```

So there are two imports, importing entities from the same module. This should be converted into a single import statement as it makes the code look more compact and removes unnecessary lines of code. Thus we should be writing the above imports like this:

```js
import { Table, Container } from "neetoui";
```

If your project is using the eslint config from [wheel](https://github.com/bigbinary/wheel/blob/main/.eslintrc.js), then eslint would automatically point out cases where we can use single import over multiple import statements.

## Keep the files in closest scope

We don't need to keep the helper files or functions at global scope unnecessarily. We should always try to keep the files within the closest scope.

- It helps with easier navigation to the dependent files of a scope/entity.

- It also doesn't pollute the global files like say the `src/utils`.

Consider the following folder structure:

```js
src
├── components
    ├── commons
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
    ├── commons
         └── Input.jsx
    ├── Form
         ├── CreateForm.jsx
         ├── EditForm.jsx
         └── utils.js // contains the calculateCreatedAgo function
    └── Main.jsx
```

This doesn't mean that we shouldn't utilize the global `src/utils` folder. If a particular utility is used across multiple scopes, then we should prefer to keep that utility function in the global scope that is in `src/utils` folder. The main idea is to keep the things DRY as possible.

## Keep useState at top

We should generally keep the `useState` hook towards the top of the component. `useState` is the most commonly used hook in the component, and this practice enhances code readability. All `useState` hooks should be grouped together and placed at the top of the component. Following the `useState` hooks, other hooks can be used, and custom variable definitions can follow them. Each group should be separated by a new line to provide clear visual segregation within the component, making it easier to find the required state or variable.

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

However, there can be exceptions where the initial value for a `useState` hook depends on some other hook or context. In such cases, it's acceptable to use other hooks before the `useState` hook.

For example, when using the `useLocation` hook from a router library to initialize a state variable:

```jsx
const Dashboard = () => {
  const location = useLocation();

  const [selectedTab, setSelectedTab] = useState(location.pathname);
  // rest of the component
};
```

In this scenario, we use the `useLocation` hook to determine the initial value for `selectedTab`, and this exception improves the logic and maintainability of the component.

Another case is when utilizing a theme context to set the initial state based on the theme

```jsx
const Dashboard = () => {
  // Access the theme from the context
  const { theme } = useContext(ThemeContext);

  // Use the theme to set the initial state
  const [backgroundColor, setBackgroundColor] = useState(
    theme === 'light' ? '#FFFFFF' : '#000000'
  );

  // rest of the component
};
```

In this theme context example, we use the `useContext` hook to access the theme and then use it to determine the initial value for the `backgroundColor` state variable.

## Passing props the right way

We often pass boolean values as props to components. For example, `disabled`, while specifying a disabled state for a button, we use the following syntax quite often -

```jsx
return <Button disabled={true} />;
```

The above code snipped can be written as -

```jsx
return <Button disabled />;
```

## Use semantic names for props

Always use camelCase for props.

```jsx
// Bad
<UserDetails
  Name="Test"
  phone_number="+1-2311233"
/>

// Good
<UserDetails
  name="Test"
  phoneNumber="+1-2311233"
/>
```

## Using spread operator in props

If you need to forward the props to inner component, you can list only the necessary props during destructuring and accept all the remaining props (to be forwarded) using spread operator.

```jsx
const Button = ({
  // props needed for Button component
  icon = null,
  iconPosition = "right",
  iconSize = 14,
  label = "",
  // props to be forwarded to child
  loading = false,
  onClick = noop,
  to = null,
  type = "button",
  style = "primary",
  fullWidth = false,
  className = "",
  disabled = false,
  size = null,
  href = null,
}) => {
  return (
    <Child
      loading={loading}
      onClick={onClick}
      to={to}
      type={type}
      style={style}
      fullWidth={fullWidth}
      className={className}
      disabled={disabled}
      size={size}
      href={href}
    />
  );
};
```

A better way of writing the above case with more flexibility is as follows

```jsx
const Button = ({
  icon = null,
  iconPosition = "right",
  iconSize = 14,
  label = "",
  ...otherProps
}) => {
  return (
    <Child {...otherProps} />
  );
};
```

## Destructuring Props

The code snippet shown below does not destructure the props.

```jsx
const UserProfile = props => (
  <>
    <h1>{props.name}</h1>
    <h1>{props.title}</h1>
  </>
);
```

This can be written as

```jsx
const UserProfile = ({ name, title }) => (
  <>
    <h1>{name}</h1>
    <h1>{title}</h1>
  </>
);
```

This not only shortens the code, but also improves IDE support. IDE can give you predictions and type support if you use destructuring in component or function definition.

Object destructuring can shorten the code when fetching data from an API call. Consider the following example:

```jsx
const response = await ticketsApi.get(ticketsUrl);
setTicketTitle(response.ticket.title);
setTicketDescription(response.ticket.description);
setTicketCount(response.ticket.count);
setTicketAssignee(response.ticket.assignee);
// etc

// A better way to do the same is by destructuring the response as follows -
const {
  ticket: { title, description, count, assignee },
} = await ticketsApi.get(ticketsUrl);
setTicketTitle(title);
setTicketDescription(description);
setTicketCount(count);
setTicketAssignee(assignee);
```

## Combining multiple states inside of an object

In the above example, we have used four states viz.,

```jsx
const [ticketTitle, setTicketTitle] = useState("");
const [ticketDescription, setTicketDescription] = useState("");
const [ticketCount, setTicketCount] = useState(null);
const [ticketAssignee, setTicketAssignee] = useState(null);

// The above four states could be written as an object as follows -
const [ticketDetails, setTicketDetails] = useState({
  title: "",
  description: "",
  count: null,
  assignee: null,
});
```

This shortens code by eliminating the boilerplate associated with defining a new state.

But it also has its own down sides. The developer needs to consider the previous state when making changes to a property. i.e. the following code is error prone:

```js
// main function
const updateValues = () => {
  updateTitle();
  updateCount();
};
// helper functions
const updateTitle = async () => {
  try{
    const title = await fetchTitle();
    setTicketDetails({ ...ticketDetails, title });
  } catch (error) {
    logger.error(error);
  }
};

const updateCount = async () => {
  try{
    const count = await fetchCount();
    setTicketDetails({ ...ticketDetails, count });
  } catch (error) {
    logger.error(error);
  }
};
```

If both `fetchTitle` and `fetchCount` returns value at the same time, and both functions tries to update the state, only one of them succeeds. This is because `setState` is not synchronous. The changes made by one of the functions will be overwritten by the other.

To fix the problem, we need to follow functional style for state updates:

```js
const updateTitle = async () => {
  try{
      const title = await fetchTitle();
      setTicketDetails(prevState => { ...prevState, title });
    } catch (error) {
      logger.error(error);
    }
};

const updateCount = async () => {
  try{
      const count = await fetchCount();
      setTicketDetails(prevState => { ...prevState, count });
    } catch (error) {
      logger.error(error);
    }
};
```

We can also use point free expressions from ramda, to shorten the code:

```js
const updateTitle = async () => {
  try{
      const title = await fetchTitle();
      setTicketDetails(mergeLeft({ title }));
    } catch (error) {
      logger.error(error);
    }
};

const updateCount = async () => {
  try{
      const count = await fetchCount();
      setTicketDetails(mergeLeft({ count }));
    } catch (error) {
      logger.error(error);
    }
};
```

## Try to avoid unnecessary div

When there is a single component to be returned, we do not need to use `div`

```jsx
// Bad
return (
  <div>
    <Button label="Single component" />
  </div>
);

// Good
return <Button label="Single component" />;
```

## Keep code DRY

Try to reduce duplication of code as much as possible using basic JS techniques. Consider the following example

```jsx
const transformResponseKeysToCamelCase = response => {
  const { transformResponseCase = true } = response.config;

  if (response.data && transformResponseCase) {
    response.data = keysToCamelCase(response.data);
  }
  return response;
};

const transformErrorKeysToCamelCase = error => {
  const { transformResponseCase = true } = error.response.config;

  if (error.response.data && transformResponseCase) {
    error.response.data = keysToCamelCase(error.response.data);
  }

  return error;
};
```

This can be simplified as:

```js
const transformResponseKeysToCamelCase = response => {
  const { transformResponseCase = true } = response.config;

  if (response.data && transformResponseCase) {
    response.data = keysToCamelCase(response.data);
  }
  return response;
};

const transformErrorKeysToCamelCase = error =>
  transformResponseKeysToCamelCase(error.response);
```

## Remove JS code from JSX

As a good practice, keep the logic inside render to an absolute minimum.

```jsx
// Bad
return (
  <button
    onClick={() => {
      const contactIds = contacts.map(contact => contact.id);
      if (selectedContactIds.length === contactIds.length) {
        setSelectedContactIds([]);
      } else {
        setSelectedContactIds(contactIds);
      }
    }}
  >
    This is a bad example
  </button>
);

// Good
return (
  <button onClick={() => handleContactUpdate(contactId)}>
    This is a good example
  </button>
);
```

## Strings don't need curly braces

```jsx
// Bad
return <Button label={"Bad example"} />;

// Good
return <Button label="Good example" />;
```

## Use template literals

Avoid using string concatenation for strings and use template literals. It keeps the code clean.

```jsx
// Bad
const userDetails =
  user.name + "is working with" + user.company + "since" + user.joining_date;

return <div>{userDetails}</div>;

// Good
const userDetails = `${user.name} is working with ${user.company} since ${user.joining_date}`;

return <div>{userDetails}</div>;
```

## Self closing tags

If a component does not have any children, then use self closing tags.

```jsx
// Bad
<Button label="Bad example"><Button />

// Good
<Button label="Bad example" />
```

## [Hack] Use object literals

Object literals can make our code more readable. There are cases when you can't use ternary operators and resort to either `if-else` or `switch` statements. In such cases, you could do the following

```jsx
// Bad
const { role } = user;

switch (role) {
  case ADMIN:
    return <Admin />;
  case AGENT:
    return <Agent />;
  case CUSTOMER:
    return <Customer />;
}

// Good

const { role } = user;

const components = {
  ADMIN: Admin,
  AGENT: Agent,
  CUSTOMER: Customer,
};

const Component = components[role];

return <Component />;
```

Note that these two aren't identical to each other. If the return values are function call results like this, they are evaluated only if it is the correct `role`:

```js
switch (role) {
  case ADMIN:
    return getAdminDetails(role, adminName);
  case AGENT:
    return getAgentDetails();
  case CUSTOMER:
    return getCustomerDetails(order);
}
```

But if we write the object declaration style like this, all the functions will be executed at the time of object initialization:

```js
const details = {
  ADMIN: getAdminDetails(role, adminName),
  AGENT: getAgentDetails(),
  CUSTOMER: getCustomerDetails(order),
};
return details[role];
```

If the functions are heavy weight or if the functions involves API calls, do not prefer this style.
