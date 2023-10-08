In some cases, you'd like to render nothing at all.

In JSX, values like `true`, `false`, `null` and `undefined` are valid children,
they will simply be ignored and not rendered.

For example, if you only need to render admins while leaving the users out, you
can do it like this:

```jsx
const ProfilePicture = ({ isAdmin, name }) => {
  if (!isAdmin) return null;

  return <div className="adminProfile">{name}: Admin</div>;
};
```

If you need to render a value even if it is false, you can always coerce the
value to a string using the `String()` function as shown below:

```jsx
const AlwaysPrintSomething = ({ possiblyFalsyValue }) => (
  <h1>The variable's value is {String(possiblyFalsyValue)}</h1>
);
```
