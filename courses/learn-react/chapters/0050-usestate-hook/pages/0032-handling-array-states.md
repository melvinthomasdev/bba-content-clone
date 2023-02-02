Just like objects, while arrays are mutable in JavaScript, you must treat all states as read only.
We can't use methods that mutate the array like `push`, `pop`, `reverse` and `sort`.
Instead, we use methods that make a modified copy of the array like `concat`, `filter`, `map`, `slice` and the spread syntax `[...oldArray]`.

Here's an example of a contacts list that you can add and delete by using a couple of the above-mentioned methods:

```jsx
{/* ContactsArray.jsx */}
import {useState} from 'react'

let contactId = 0
const ContactsArray = () => {
  const [contactName, setContactName] = useState("")
  const [contacts, setContacts] = useState([])

  const insertContact = () => {
    setContacts(
      prevContacts => [
        ...prevContacts,
        {id: prevContacts.at(-1).id + 1, name: contactName}]
    )
    setContactName("")
  }

  const deleteContact = id => setContacts(
    contacts.filter(contact => contact.id != id)
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