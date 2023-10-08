In React, you will often need to render different content depending on certain conditions. For those situations, you can use the JavaScript branching statements that you normally use, such as `if...else`, `? :`, `&&`.

The simplest one is the `if/else` statement.

Let's say you have a profile nameplate that needs to show whether the person is a user or admin, the simplest way to do so would be using a simple if/else statement as shown:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({ isAdmin, name }) => {
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

In the above example, `if(isAdmin) { return ... }` is what we call a "Guard Clause". They are conditional statements that evaluate a condition and stops the execution of the code based on said condition. At BigBinary, we consider that to be the best practice over chaining if/else statements like this :

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({ isAdmin, name }) => {
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

You could also assign the value to a variable and return that like this:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({ isAdmin, name }) => {
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
