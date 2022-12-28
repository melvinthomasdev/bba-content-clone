You can create as many state variables as you'd like to store values but it is highly recommended that you refrain from using too many.

Having too many leads to "spaghetti code" which becomes harder to maintain. Furthermore, sending the states and state setters to necessary children also becomes a bit of a nightmare:

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

## Handling states defined as objects

States are to be treated as read-only. Modifying a state object does not trigger a re-render with the new value and is not recommended by React.

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
  const changeName = e => setUser({ ...user, name: e.target.value})
  const changeEmail = e => setUser({ ...user, email: e.target.value })

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

## Handling states defined as nested objects

It is important to remember that the spread operator is shallow and only one layer deep.

In the example above, if the `name` were an object like so:

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

You would leave the last name behind when the first name is created. Instead, you will need to spread the name object with the user object like so:

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

## Handling states defined as arrays

Just like objects, while arrays are mutable in JavaScript, you must treat all states as read only. We can't use methods that mutate the array like `push`, `pop`, `reverse` and `sort`. We use methods that make a modified copy of the array instead like `concat`, `filter`, `map`, `slice` and the spread syntax `[...oldArray]`.

Here's an example of a contacts list that you can add and delete from using a couple of the above-mentioned methods:

```jsx
{/* ContactsArray.jsx */}
import {useState} from 'react'

let contactId = 0
const ContactsArray = () => {
  const [contactName, setContactName] = useState("")
  const [contacts, setContacts] = useState([])

  const insertContact = () => {
    setContacts(
      [...contacts, {id: nextId++, name: contactName}]
    )
    setContactName("")
  }

  const deleteContact = id => setContacts(
    contacts.filter( contact => contact.id!=id )
  )

  return (
    <>
      <h1>Contacts List</h1>
      <input
        value={contactName}
        onChange={e => setContactName(e.target.value)}
      />
      <button onClick={insertContact}>
        Add Contact
      </button>
      <ul>
        {contacts.map(contact => (
          <li key={contact.id}>
            {contact.name}{' '}
            <button onClick={() => deleteContact(id)}>
              Delete Contact
            </button>
          </li>
        ))}
      </ul>
    </>
  )
}
```

In the above example, insertion is done by making a copy of the array using the spread operator (`...`) and inserting the additional element consisting of the id and contact name.

We also delete a contact using the `filter` to make a new array by including every contact from the old array except the contact with the id we need to exclude.

## Using Ramda to simplify state management

TODO: Check if this needs to be created here / moved to the advanced course / scrapped