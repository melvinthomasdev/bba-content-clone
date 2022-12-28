In React, we can pass data from parent to child via "props" which are essentially pieces of information you pass to a JSX tag using the following syntax:

```jsx
{/* Parent */}
const Users = () => (
  <UserCard name="Adam Smith" customClass="adminUser"/>
  <UserCard name="John Doe" customClass="regularUser"/>
)

{/* Child */}
const UserCard = ({ name, customClass }) => (
  <p className={customClass}>
    Hello {name}
  </p>
)
```

In the above example, `className` is an in-built prop while `name` and `customClass` are custom props.
In the above example, we use de-structuring inside the parameters to make the code more concise in the UserCard component. However, it can just as easily be written as:

```jsx
{/* UserCard.jsx */}
const UserCard = props => {
  const name = props.name
  const customClass = props.customClass

  return (
    <p className={customClass}>
      Hello {name}
    </p>
  )
}
```

The props object is the only argument to your component.

## Renaming and Default Values

When destructuring, you can also assign default values and change the name of certain arguments like so:

```jsx
{/* UserCard.jsx */}
const UserCard = ({ name = "User", customClass: pClass  }) => (
  <p className={pClass}>
    Hello {name}
  </p>
)
```

In the above example

* The `name` prop is defaulted to "User". It is important to note that it only defaults to "User" if the `name` prop is not used as an argument or if its value is explicitly set as `undefined` when the UserCard component is invoked. In all other cases, it will not use the default prop value, even if the argument's value is `""`, `0`, `false` or `null`.
* `customClass` that is passed as a prop to the UserCard is renamed to `pClass` within the parameter list.

You can even combine defaulting and renaming in a single attribute like so:

```jsx
{/* UserCard.jsx */}
const UserCard = ({ name, customClass: pClass = "defaultClass" }) => (
  <p className={pClass}>
    Hello {name}
  </p>
)
```