You can also shorten the previously shown example using the logical and operator (&&) like so:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = {( isAdmin, name )} => {
  return (
    isAdmin && (
      <div className="adminProfile">
        {name}: Admin
      </div>
    )
  )
}
```

This will render the JSX code if `isAdmin` is true and will return `false` if `isAdmin` is false, thus rendering nothing.