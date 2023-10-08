As mentioned in the previous pages, when you find yourself passing all the props
down the line for every other component, it's advisable to split your components
and pass children as JSX.

Take this example of a set of components that drill down props:

```jsx
// AppContainer.jsx
const AppContainer = ({ name, email, number }) => (
  <div className="appContainer">
    <SideBar name={name} email={email} number={number} />
    App Contents
  </div>
);

const Sidebar = ({ name, email, number }) => (
  <div className="sideBar">
    <UserSection name={name} email={email} number={number} />
    Sidebar Contents
  </div>
);

const UserSection = ({ name, email, number }) => (
  <div className="userSection">
    Name: {name}
    Email: {email}
    Phone Number: {number}
  </div>
);

export default AppContainer;
```

The `SideBar` doesn't need to relay the props down to the `UserSection` when the
`AppContainer` can do the same. We can rewrite the code using the `children`
prop shown on the previous page like this:

```jsx
// AppContainer.jsx
const AppContainer = ({ name, email, number }) => (
  <div className="appContainer">
    <SideBar>
      <UserSection name={name} email={email} number={number} />
    </SideBar>
    App Contents
  </div>
);

const Sidebar = ({ children }) => (
  <div className="sideBar">
    {children}
    Sidebar Contents
  </div>
);

const UserSection = ({ name, email, number }) => (
  <div className="userSection">
    Name: {name}
    Email: {email}
    Phone Number: {number}
  </div>
);

export default AppContainer;
```

As shown in the above example, we avoid having to pass all the props through the
sidebar by passing them directly to the `UserSection` from the `AppContainer`.

If you wish to learn more about prop drilling and how to avoid it, check out
these resources:

- [Using composition to avoid prop drilling - React Training](https://www.youtube.com/watch?v=3XaXKiXtNjw)
- [Prop Drilling - Kent C Dodds](https://kentcdodds.com/blog/prop-drilling)
