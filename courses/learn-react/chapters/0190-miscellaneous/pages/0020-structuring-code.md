## Project Structure

The React code structure starts from the **src** folder. We can have the following files and folders in the **src** folder:

### `App.jsx` file

In a React application, the `App.jsx` file typically serves as the main entry point or root component. This component encapsulates the overall structure of your application, acting as a container for other components that make up the user interface.

### `components` folder

This folder contains all the React components. Here are some points to consider when structuring the `components` folder:

**Logically group components into folders**: We should logically group the components into folders according to the requirement.

In the case of `smile-cart-frontend`, we have organized the components into folders such as `Cart`, `Checkout`, `Product`, and `ProductList` based on the pages in our application. Each folder can have an **index.jsx** file. The index file is considered the starting point of the folder.

```bash
├── components
│   ├── Cart
│   │   ├── index.jsx
│   │   ├── PriceCard.jsx
│   │   └── ProductCard.jsx
│   ├── Checkout
│   │   ├── constants.js
│   │   ├── Form.jsx
│   │   ├── index.jsx
│   │   ├── Items.jsx
│   │   ├── PriceEntry.jsx
│   │   └── Product.jsx
│   ├── Product
│   │   ├── Carousel.jsx
│   │   └── index.jsx
│   ├── ProductList
│   │   ├── constants.js
│   │   ├── index.jsx
│   │   └── ProductListItem.jsx
```

Now, let's explore how component folders can be structured, taking the example of the `Checkout` component. We broke down the `Checkout` page UI into smaller UI elements and created components for each of them, keeping these components in the `Checkout` folder. We then composed the `Checkout` component with these smaller components by importing and rendering them according to the logic required in the `index.jsx` file:

<image>checkout-ui-breakdown.png</image>

Rather than cluttering a single `jsx` file with the entire UI, it's preferable to break down the functionality into specific components, each dedicated to a particular task, as depicted above.

As the application grows, we will have a deeply nested project structure with components used together grouped into folders.

**Avoid creating unnecessary folders**: A common mistake that should be avoided is creating folders for components when not required. For example, consider an arbitrary component called `Dashboard`. If the `Dashboard` component consists of only one file and is not composed of any other components, it should not be declared inside the `components/Dashboard/index.jsx` file like this:

```bash
Dashboard
    └── index.jsx
```

It should be declared inside the `components/Dashboard.jsx` file.

**Name components in PascalCase**: All component files and folders should be named in `PascalCase`, except for the `index` file. The component files should have the `.jsx` extension.

**Place reusable components in `commons` folder**: All the reusable components should be stored in the `commons` folder within the `components` folder:

```bash
├── components
│   ├── commons
│   │   ├── AddToCart.jsx
│   │   ├── Header.jsx
│   │   ├── PageLoader.jsx
│   │   ├── PageNotFound.jsx
│   │   ├── ProductQuantity.jsx
│   │   └── TooltipWrapper.jsx
```

In addition to component files, it's common to include folders and files for _constants_, _utils_, _hooks_, and _stores_ at various nested levels within the components folder. The following sections will delve into the structuring and use of these files and folders.

### `utils/constants` folder

As the name indicates, the `constants` folder is used to store constants, and the `utils` folder is used to store utility functions. Besides utility functions, Higher Order Components (HOC) are also placed under the `utils` folder. The `constants` and `utils` folders can be placed at any nested level in the closest scope.

Here is an example from the `smile-cart-frontend` repository, in which we store the project-level constants and utility functions in the `constants` and `utils` directly under the `src` folder:

```bash
├── constants
|   └── query.js
├── utils
│   ├── queryClient.js
│   ├── storage.js
│   ├── url.js
|   └── withTitle.jsx
```

If we only have a single file for utility functions or constants, there's no need for separate folders. We can put the utility functions in a file called `utils.js` and constants in `constants.js`. If the utility functions or constants have any JSX, the filename should have a `jsx` extension (`utils.jsx` or `constants.jsx`). You can see such `constants.js` and `utils.js` files at various nested levels within the `smile-cart-frontend` repository.

Despite having only one file in the constants folder in the above example, we've kept the `QUERY_KEYS` constants in a file named `query.js`. This is a convention followed at BigBinary to maintain a separate file for `QUERY_KEYS` for easier reference.

### `hooks` folder

This folder contains all the custom hooks. The `hooks` folder can be placed at any nested level in the closest scope.

The custom hooks corresponding to the React query should be placed inside the `src/hooks/reactQuery` folder:

```bash
├── hooks
│   ├── reactQuery
│   │   ├── useCheckoutApi.js
│   │   └── useProductsApi.js
│   ├── useFuncDebounce.js
|   └── useQueryParams.js
```

### `stores` folder

This folder contains all the state management stores. In the case of `smile-cart-frontend`, we only have the `useCartItemsStore`:

```bash
├── stores
|   └── useCartItemsStore.js
```

The `stores` folder can also be placed at any nested level in the closest scope.

### `lib` folder

We can have a `lib` folder under the `src` directory. This folder will contain all the files related to third-party libraries that we override or initialize.

### `apis` folder

All the backend calls are to be made from the `src/apis` folder. We will have API connector files corresponding to each resource in this folder.

For example, we have a `products.js` file to interact with the `products` resource, a `states.js` file to interact with the `state` resource and so on:

```bash
├── apis
│   ├── axios.js
│   ├── countries.js
│   ├── orders.js
│   ├── products.js
│   └── states.js
```

### `translations` folder

This folder will contain all the translation related files. In `smile-cart-frontend`, we have kept the translation strings corresponding to the English language in `en.json` files in this directory:

```bash
├── translations
|   └── en.json
```
### `routes.js` file

This file contains all the project-level routes.

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

## When to add an index.js?

If there are multiple components exported from a namespace, then it's a good idea to add an `index.js` within that namespace so that we don't have to add multiple imports but rather keep it down to a single import.

For example, we have following components exported from the `commons` folder:

```bash
├── commons
│   ├── AddToCart.jsx
│   ├── Header.jsx
│   ├── PageLoader.jsx
│   ├── PageNotFound.jsx
│   ├── ProductQuantity.jsx
│   └── TooltipWrapper.jsx
```

Without `index.js` file, we required multiple imports for each component in the `commons` folder as shown:

```js
import Header from "components/commons/Header";
import PageLoader from "components/commons/PageNotFound";
```

We have added an `index.js` file in the `commons` folder to reduce the number of import statements, like this:

```js
// src/components/commons/index.js

import AddToCart from "./AddToCart";
import Header from "./Header";
import PageLoader from "./PageLoader";
import PageNotFound from "./PageNotFound";
import ProductQuantity from "./ProductQuantity";
import TooltipWrapper from "./TooltipWrapper";

export {
  AddToCart,
  Header,
  PageNotFound,
  PageLoader,
  ProductQuantity,
  TooltipWrapper,
};
```

Now after adding the above `index.js` file we can import components using a single import statement, like this:

```js
import { Header, PageLoader } from "components/commons";
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

- It also doesn't pollute the global files like say the `src/utils.js`.

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
└── utils.js
```

Let's say we have a function called `calculateCreatedAgo` in `src/utils.js` which is used in `CreateForm.jsx` and `EditForm.jsx` files only. As the `calculateCreatedAgo` function is used only within the `Form` scope we should keep the `calculateCreatedAgo` function in an `utils.js` within the `Form` folder.

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

Try to reduce duplication of code as much as possible using basic JavaScript techniques. Consider the following example

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

## Remove JavaScript code from JSX

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
