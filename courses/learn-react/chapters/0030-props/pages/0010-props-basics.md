We can pass inputs to React components just like we pass arguments to JavaScript functions. React component accepts an object called `props` as the input.

Consider the following example:

<codeblock language="reactjs" type="lesson">
<code>
const Introduction = props => <h1>My name is {props.name}</h1>;

const App = () => (
  <div>
    <h1>Hello 👋</h1>
    <Introduction name="John Doe" />
  </div>
);

export default App;
</code>
</codeblock>

Here we pass `name="John Doe"` to the `Introduction` component from its parent component `App`. `Introduction` receives the attribute `name` wrapped inside the object `props`.

The `name` property from the `props` object is used inside the `Introduction` component using curly braces `{}`. In JSX, anything written inside curly braces `{}` is evaluated as a JavaScript expression.

Usually, we don’t need the whole `props` object itself, so we destructure it into individual `props`:

```jsx
const Introduction = ({ name }) => <h1>My name is {name}</h1>;
```

We prefer the destructured style, as it provides improved IDE support. IDEs can analyze the destructured `props` and provide helpful suggestions and autocompletion when accessing specific `props` within the component:

<image>ide-support-props.gif</image>

Props might remind you of HTML attributes, but you can pass any JavaScript value through them, including objects, arrays, functions, and even other components. We will see examples for each of them in upcoming chapters.
