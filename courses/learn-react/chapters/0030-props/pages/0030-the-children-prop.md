As you build larger and more complex components, sometimes you'll find yourself
needing to nest your custom components like this:

```jsx
<Parent>
  <h1>This is a child of the Parent component</h1>
  <CustomChild />
</Parent>
```

The contents of the `Parent` component are what we call its "children", which in
this case is:

```jsx
<h1>This is a child of the Parent component</h1>
<CustomChild />
```

To access the children of your custom components, React provides a special prop
called `children` that you can use like this:

```jsx
{
  /* App.jsx */
}
const Parent = ({ children }) => <div className="container">{children}</div>;

const Child = ({ text }) => <span>{text}</span>;

const App = () => (
  <Parent>
    <Child text="child 1" />
    <Child text="child 2" />
  </Parent>
);
```

In the above example, the two `Child` components are passed to the `Parent` as
part of the `children` prop and get rendered within its `container` div.

This "children" prop can include Booleans, Numbers, String, other React elements
or even an array of any of these types recursively. It allows us to compose
complex elements without increasing the number of props all the time.

It increases code readability by allowing the `Child` to be used in other places
or allow the `Parent` to include other children

We also separate concerns by extracting the `Product` UI to a child component.
Now the `Products` page renders a list of products and the `Product` component
renders a product UI. This separation of concerns makes it easier for someone
going through the code to tell what each component is meant for.

Here are some references you can check out if you wish to learn more about the
usage of the `children` prop:

- [Children in JSX - React docs](https://reactjs.org/docs/jsx-in-depth.html#children-in-jsx)
- [Children API - React docs](https://reactjs.org/docs/react-api.html#reactchildren)
