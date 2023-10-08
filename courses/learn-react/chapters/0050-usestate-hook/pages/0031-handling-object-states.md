An issue with using objects as states is that states are to be treated as read-only.
Modifying a state object does not trigger a re-render with the new value and is not recommended by React.

Instead, we make a copy of the existing state object, modify the necessary value within (or create a completely new object in some cases) and use the setState function to save the new object.

To assist with this object copying, we can use the spread syntax as such:

```jsx
{/* UserCardContainer.jsx */}
const UserCardContainer = () => {
  const [user, setUser] = useState({
    name: "",
    email: "",
    pictureUrl: ""
  })
  const changeName = e => setUser({...user, name: e.target.value})
  const changeEmail = e => setUser({...user, email: e.target.value})

  return (
    <ProfileCard
      user={user}
      setUser={setUser}
    />
    <EditUserModal
      changeName = {changeName}
      changeEmail = {changeEmail}
    />
  )
}
```

It is important to remember that the spread operator is shallow and only one layer deep.

In the example above, if the `name` were an object like this:

```jsx
const [user, setUser] = useState({
  name: {
    firstName: "",
    lastName: ""
  },
  email: "",
  pictureUrl: ""
})
```
and you needed to change the firstName like this:

```jsx
const changeName = e => setUser(
  {
    ...user,
    name: {
      firstName: e.target.value
    }
  }
)
```

You would leave the last name behind when the first name is created. Instead, you will need to spread the name object with the user object like this:

```jsx
const changeName = e => setUser(
  {
    ...user,
    name: {
      ...name,
      firstName: e.target.value
    }
  }
)
```