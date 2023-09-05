You can also shorten the previously shown example using the logical and operator
(&&) like so:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({ isAdmin, name }) => {
  return (
    isAdmin && (
      <div className="adminProfile">
        {name}: Admin
      </div>
    )
  )
}
```

This will render the JSX code if `isAdmin` is true and will return `false` if
`isAdmin` is false, thus rendering nothing.

As mentioned earlier, falsy values such as `false`, `null` and
`undefined` are valid children that are simply ignored and not rendered.

When using integers, be careful when using the number 0 to evaluate an
expression. While it is considered a falsy value in JavaScript, unlike other
falsy values, 0 will be rendered by React. Here is a common pitfall that
beginners run into:

```jsx
function App() {
  const users = [];
  const numberOfUsers = users.length;

  return (
    <div className="AppContainer">
      {numberOfUsers && <UserList users={users} />}
    </div>
  );
}
```

In the above example, when the `users` array is empty, `numberOfUsers && ...`
evaluates to `0 && ...` which you might assume would evaluate to false and thus
not get rendered. However, 0 is a special exception that gets rendered as the
number "0" within the div.

To prevent this, ensure that the expression before the `&&` always returns a
boolean like so:

```jsx
function App() {
  const users = [];
  const numberOfUsers = users.length;

  return (
    <div className="AppContainer">
      {numberOfUsers > 0 && <UserList users={users} />}
    </div>
  );
}
```
