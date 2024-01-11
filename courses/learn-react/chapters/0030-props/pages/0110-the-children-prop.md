In HTML, we have paired tags that can enclose content within opening and closing tags:

```html
<p>Paragraph</p>

<ul>
  <li>List item</li>
</ul>
```

Our custom components can do this too. React provides the `children` prop to achieve the same.

Consider the example below:

<codeblock language="reactjs" type="lesson">
<code>
const Box = ({ children }) => (
  <div
    style={{
      padding: 70,
      border: "1px solid darkgreen",
      width: "max-content",
    }}
  >
    {children}
  </div>
);

const App = () => (
  <Box>
    <h1>Hi, 👋 </h1>
    <p>Lets learn React</p>
  </Box>
);

export default App;
</code>
</codeblock>

> Note: We don't need to explicitly specify the unit `px` for the `padding` property. It takes a number as the value, and the unit is considered as `px` by default.

In the above example, the `Box` component receives the elements `h1` and `p`, inside an array as the `children` prop.

`Box` component wraps its children inside a `div` tag with a border and padding.

The `children` prop can include booleans, numbers, strings, other React elements, or even an array of any of these types. It allows us to build complex wrapper components and use them in a native HTML fashion.

The `children` prop can be extremely useful to build generic components which don't know their children ahead of time, like the one above.

Even though it is technically possible to pass the `children` prop, as shown below, it is not preferred as it makes the code difficult to read.

```jsx
const App = () => <Box children={<h1>Hi, 👋 </h1>} />;
```
