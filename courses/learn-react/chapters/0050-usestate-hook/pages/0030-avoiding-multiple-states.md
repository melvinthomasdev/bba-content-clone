You can create as many state variables as you'd like to store values but it is highly recommended that you refrain from using too many.

Having too many states leads to "Spaghetti Code" which becomes harder to maintain.
Furthermore, sending all the states and state setters to necessary children also becomes a bit of a nightmare:

```jsx
{/* UserCardContainer.jsx */}
const UserCardContainer = () => {
  const [name, setName] = useState("")
  const [email, setEmail] = useState("")
  const [pictureUrl, setPictureUrl] = useState("")

  return (
    <ProfileCard
      name={name}
      setName={setName}
      email={email}
      setEmail={setEmail}
      pictureUrl={pictureUrl}
      setPictureUrl={setPictureUrl}
    />
  )
}
```

Instead, reduce your states down to logical blocks that are commonly used.
In the above example, since a user's name, email and profile picture are commonly used together, we can reduce it down to one "user" state and pass it along to the ProfileCard like so:

```jsx
{/* UserCardContainer.jsx */}
const UserCardContainer = () => {
  const [user, setUser] = useState({
    name: "",
    email: "",
    pictureUrl: ""
  })

  return (
    <ProfileCard
      user={user}
      setUser={setUser}
    />
  )
}
```

Handling a state object does however come with its own set of issues you don't run into while using primitive values like integers, booleans, strings and floats.

Ways to work around this will be shown in the upcoming pages.