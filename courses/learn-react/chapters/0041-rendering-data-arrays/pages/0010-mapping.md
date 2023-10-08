When you need to render many similar components, you can use JavaScript's arrays and the `map()` method to iterate through the data within the array and generate corresponding React elements.

Let's say you have an HTML list of contacts with their locations you'd like to render in a component like this:

```jsx
{/* ContactsList.jsx */}
const ContactsList = () => (
  <h2>Contacts List</h2>
  <ul>
    <li>Kurt Gödel - Austria</li>
    <li>Alonzo Church - America</li>
    <li>Alan Turing - Britain</li>
    <li>John von Neumann - Hungary</li>
    <li>Dennis Ritchie - America</li>
  </ul>
)
```

In the above example, the only difference between each line is the data within. This can easily be extracted into an array within a constants file as shown below:

```jsx
{/*constants.js*/}
const CONTACTS = [
  {
    name: 'Kurt Gödel',
    location: 'Austria'
  },
  {
    name: 'Alonzo Church',
    location: 'America'
  },
  {
    name: 'Alan Turing',
    location: 'Britain'
  },
  {
    name: 'John von Neumann',
    location: 'Hungary'
  },
  {
    name: 'Dennis Ritchie',
    location: 'America'
  },
]

export { CONTACTS };
```

The array of contacts above can then be imported into your React code using a map function as shown below:

```jsx
{/* ContactsList.jsx */}
import { CONTACTS } from 'path/to/constants.js'

const ContactsList = () => {
  const contactLines = CONTACTS.map(
    contact => <li> {contact.name} - {contact.location} </li>
  )
  return (
    <h2>Friends List</h2>
    <ul>{contactLines}</ul>
  )
}
```

On a side note, you may have noticed the console giving a warning when running the above examples : `Warning: Each child in a list should have a unique “key” prop.`

We will be addressing the addition of these keys in a couple of pages.