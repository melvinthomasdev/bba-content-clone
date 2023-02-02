In some cases, you'd like to render nothing at all.

In JSX, values like `true`, `false`, `null` and `undefined` are valid children, they will simply be ignored and not rendered.

For example, if you only need to render admins while leaving the users out, you can do it like so:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = {( isAdmin, name )} => {
  if(!isAdmin) return null;

  return (
    <div className="adminProfile">
      {name}: Admin
    </div>
  )
}
```