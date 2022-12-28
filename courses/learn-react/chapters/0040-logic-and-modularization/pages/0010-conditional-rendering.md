In React, you will often need to render different content depending on certain conditions. For those situations, you can the JavaScript branching statements you normally use such as `if...else`, `? :`, `&&`.

## if/else statements

Let's say you have a profile nameplate that needs to show whether the person is a user or admin, the simplest way to do so would be using a simple if/else statement as shown:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({isAdmin, name}) => {
  if(isAdmin) {
    return (
      <div className="adminProfile">
        {name}: Admin
      </div>
    )
  }
  return (
    <div className="userProfile">
      {name}: User
    </div>
  )
}
```

In the above example, `if(isAdmin) { return ... }` is what we call a "Guard Clause". They are conditional statements that evaluate a condition and stops the execution of the code based on said condition. At BigBinary, we consider that to be the best practice over chaining if/else statements like so :

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({isAdmin, name}) => {
  if(isAdmin){
    return (
      <div className="adminProfile">
        {name}: Admin
      </div>
    )
  {/* Avoid if possible */}
  }else{
    return (
      <div className="userProfile">
        {name}: User
      </div>
    )
  }
}
```

You could also assign the value to a variable and return that like so:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({isAdmin, name}) => {
  let contents = (
    <div className="userProfile">
      {name}: User
    </div>
  )
  if(isAdmin){
    contents = (
      <div className="adminProfile">
        {name}: Admin
      </div>
    )
  }

  return contents
}
```

## Ternary Operators

While the above examples are perfectly functional and very readable, we do repeat a lot of the code and thus it isn't very DRY (Don't Repeat Yourself).

In certain situations where we need to render one of two possibilities, we can make the code a lot more concise using ternary operators like so:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({isAdmin, name}) => {
  return (
    <div className={isAdmin ? "adminProfile" : "userProfile"}>
      {name}: {isAdmin ? "Admin" : "User"}
    </div>
  )
}
```

If you have to chain ternary operators like `A ? B : (C ? D : E)`, it's probably better to either stick with `if...else` statements or use variables to save partial logic.

## Returning Nothing

In some cases, you'd like to render nothing at all.

In JSX, values like `true`, `false`, `null` and `undefined` are valid children, they will simply be ignored and not rendered.

For example, if you only need to render admins while leaving the users out, you can do it like so:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({isAdmin, name}) => {
  if(!isAdmin) return null;

  return (
    <div className="adminProfile">
      {name}: Admin
    </div>
  )
}
```

## Logical And

You can also shorten the above example using the logical and operator ( && ) like so:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({isAdmin, name}) => {
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