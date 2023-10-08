Using array methods, it's also easy to filter certain contacts using the `filter()` method.

We can select the American contacts only by filtering before mapping like this:

```jsx
{/* ContactsList.jsx */}
import { CONTACTS } from 'path/to/constants.jsx'

const ContactsList = () => {
  const filteredContacts = CONTACTS.filter(
    contact => contact.location == "America"
  )

  const renderContactLines = filteredContacts.map(
    contact => <li> {contact.name} - {contact.location} </li>
  )

  return (
    <h2>Friends List</h2>
    <ul>{contactLines}</ul>
  )
}
```