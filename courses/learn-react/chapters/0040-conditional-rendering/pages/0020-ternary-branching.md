While the previously shown method and examples are perfectly functional and very readable, we do repeat a lot of the code and thus it isn't very DRY (Don't Repeat Yourself).

In certain situations where we need to render one of two possibilities, we can make the code a lot more concise using ternary operators like this:

```jsx
{/* ProfilePicture.jsx */}
const ProfilePicture = ({ isAdmin, name, imageSource }) => {
  return (
    <div className={isAdmin ? "adminProfile" : "userProfile"}>
      <img src={imageSource} />
      {name}: {isAdmin ? "Admin" : "User"}
    </div>
  )
}
```

Ternary operators are preferred over `if/else` statements when:
  * You're initializing a variable conditionally or working out which value to use
  * The operation that needs to be performed conditionally doesn't span across multiple lines

Avoid returning boolean values from ternary operators.

```jsx
const num = 10
const isEven = num % 2 ? true : false
```

can just be simplified into

```jsx
const num = 10
const isEven = num % 2
```
