Similar to strings, numbers, and other JavaScript expressions, you can pass objects through props in JSX by wrapping them using curly braces `{}`.

Since objects are also written using curly braces in JavaScript, like `{ name: "John Doe", email: "johndoe@example.com" }`, you must wrap the object in another pair of curly braces to pass it via props:

```jsx
<UserProfile user={{ name: "John Doe", email: "johndoe@example.com" }} />;
```

The first bracket is to let JSX identify this as a JavaScript expression. The second one is to denote that it is an object.

<codeblock language="reactjs" type="lesson">
<code>
const UserProfile = ({ user }) => (
  <div>
    <h1>{user.name}</h1>
    <p>Email: {user.email}</p>
  </div>
);

const App = () => (
  <UserProfile user={{ name: "John Doe", email: "johndoe@example.com" }} />
);

export default App;
</code>
</codeblock>

You may see this with inline CSS styles in JSX. When you need an inline style, you can pass an object to the style attribute:

<codeblock language="reactjs" type="lesson">
<code>
const Header = () => (
  <div>
    <h1 style={{ backgroundColor: "lightblue" }}>Hello Style!</h1>
    <p>Add a little style!</p>
  </div>
);

export default Header;
</code>
</codeblock>
