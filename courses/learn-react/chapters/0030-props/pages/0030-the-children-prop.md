As you build larger and more complex components, sometimes you'll find yourself needing to nest your custom components like so:

```jsx
<CustomContainer>
  <Child />
</CustomContainer>
```

And in such cases, React provides a special prop called `children` to the `CustomContainer` component that contains its contents, which in this case is just `<Child />`.

```jsx
{/* App.jsx */}
const CustomContainer = ({ children }) => (
  <div className="container">
    {children}
  </div>
)

const Child = ({ text }) => (
  <span>
    {text}
  </span>
)

const App = () => (
  <CustomContainer>
    <Child text="child 1" />
    <Child text="child 2" />
  </CustomContainer>
)
```

## Splitting Components

As mentioned in the previous chapter, when you find yourself passing all the props down the line for every other component, it's advisable to split your components and pass children as JSX.

Take this example of a set of components that drill down props:

```jsx
{/* AppContainer.jsx */}
const AppContainer = ({name, email, number}) => (
  <div className="appContainer">
    <SideBar name={name} email={email} number={number}/>
    App Contents
  </div>
)

const Sidebar = ({name, email, number}) => (
  <div className="sideBar">
    <UserSection name={name} email={email} number={number}/>
    Sidebar Contents
  </div>
)

const UserSection = ({name, email, number}) => (
  <div className="userSection">
    Name: {name}
    Email: {email}
    Phone Number: {number}
  </div>
)

```

The `SideBar` doesn't need to relay the props down to the `UserSection` when the `AppContainer` can do the same. We can rewrite the code using the `children` prop like so:

```jsx
{/* AppContainer.jsx */}
const AppContainer = ({name, email, number}) => (
  <div className="appContainer">
    <SideBar>
      <UserSection name={name} email={email} number={number}/>
    </SideBar>
    App Contents
  </div>
)

const Sidebar = ({children}) => (
  <div className="sideBar">
    {children}
    Sidebar Contents
  </div>
)

const UserSection = ({name, email, number}) => (
  <div className="userSection">
    Name: {name}
    Email: {email}
    Phone Number: {number}
  </div>
)

```