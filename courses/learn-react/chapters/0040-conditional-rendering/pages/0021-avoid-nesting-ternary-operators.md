Nesting ternary operators leads to poor code readability.

If you have a block of code like this:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = {( isLoading, isAdmin, name, imageSource )} => {
  return (
    isLoading ? (
      <Loader />
    ):(
      isAdmin? (
        <div className="profilePicture">
          Admin: {name}
          <img src={imageSource} alt="adminPicture"/>
        </div>
      ) : (
        <div className="profileBasic">{name}</div>
      )
    )
  )
}
```

It's often best to just use a couple of guard clauses to improve readability like so:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = {( isLoading, isAdmin, name, imageSource )} => {
  if(isLoading) return <Loader />
  if(!isAdmin) return <div className="profileBasic">{name}</div>

  return (
    <div className="profilePicture">
      Admin: {name}
      <img src={imageSource} alt="adminPicture"/>
    </div>
  )
}
```