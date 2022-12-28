## Mapping

When you need to render many similar components, you can use JavaScript's arrays and the `map()` method to iterate through the data within the array and generate corresponding React elements.

Let's say you have an HTML list of contacts with their locations you'd like to render in a component like so:

```jsx
{/* ContactsList.jsx */}
const ContactsList = () => (
  <h2>Contacts List</h2>
  <ul>
    <li><b>Kurt Gödel</b> - Austria</li>
    <li><b>Alonzo Church</b> - America</li>
    <li><b>Alan Turing</b> - Britain</li>
    <li><b>John von Neumann</b> - Hungary</li>
    <li><b>Dennis Ritchie</b> - America</li>
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
    contact => <li> <b>{contact.name}</b> - {contact.location} </li>
  )
  return (
    <h2>Friends List</h2>
    <ul>{contactLines}</ul>
  )
}
```

## Filtering

Using array methods, it's also easy to filter certain contacts using the `filter()` method.

We can select the American contacts only by filtering before mapping like so:

```jsx
{/* ContactsList.jsx */}
import { CONTACTS } from 'path/to/constants.jsx'

const ContactsList = () => {
  const filteredContacts = CONTACTS.filter(
    contact => contact.location == "America"
  )

  const renderContactLines = filteredContacts.map(
    contact => <li> <b>{contact.name}</b> - {contact.location} </li>
  )

  return (
    <h2>Friends List</h2>
    <ul>{contactLines}</ul>
  )
}
```

## Keys

An important thing to note is how almost all of the examples above give a warning in the console.

`Warning: Each child in a list should have a unique “key” prop.`

Keys are identifiers that help React keep track of the various elements in an array during modifications. They can be inserted like so:

`<li key={value}><b>{name}</b> - {location}</li>`

These keys must be unique within their arrays and they must not change.

It may be convenient to simply use the index or position of the element as its key (which happens to be the default behavior in React) but this is **not** recommended. Any deletions, insertions or re-ordering of the list could mess up the order and lead to subtle errors that are hard to debug.

Do not try and add keys like this:

```jsx
{/* ContactsList.jsx */}
const renderContactLines = filteredContacts.map(
  (contact, index) => (
    <li key={index}>
      <b>{contact.name}</b> - {contact.location}
    </li>
  )
)
```

Instead, we'd recommend sourcing your keys from a unique ID that is stored in a file/database. In the examples above, we store the contact data in a file called `constants.js`. The file can be modified to have an incremental counter as an id like so:

```jsx
{/*constants.js*/}
const CONTACTS = [
  {
    id: 0,
    name: 'Kurt Gödel',
    location: 'Austria'
  },
  {
    id: 1,
    name: 'Alonzo Church',
    location: 'America'
  },
  {
    id: 2,
    name: 'Alan Turing',
    location: 'Britain'
  },
  {
    id: 3,
    name: 'John von Neumann',
    location: 'Hungary'
  },
  {
    id: 4,
    name: 'Dennis Ritchie',
    location: 'America'
  },
]

export { CONTACTS };
```

And then insert the key like this:

```jsx
{/* ContactsList.jsx */}
const renderContactLines = filteredContacts.map(
  contact => (
    <li key={contact.id}>
      <b>{contact.name}</b> - {contact.location}
    </li>
  )
)
```

Note: Keys are not a prop you can access in the component definition. If you need to access them, add another prop to pass them along.

## Inserting Keys into Fragments

These fragments can also be written without the special syntax by importing them from `react` as such:

```jsx
{/*Home.js*/}
import { Fragment } from 'react';

const Home = () => (
  <Fragment>
    <h1>Welcome to JSX</h1>
    <h2>Please do enjoy your stay</h2>
  </Fragment>
)
```

This is important to remember when you need to render a list of fragments as you're now able to assign a `key` to each fragment.
If we didn't use the `<ul>` and `<li>` tags previously, we could have written it like so:

```jsx
{/* ContactsList.jsx */}
const renderContactLines = filteredContacts.map(
  contact => (
    <Fragment key={contact.id}>
      <b>{contact.name}</b> - {contact.location}
    </Fragment>
  )
)
```

Do keep in mind that React Fragments cannot accept classes like other JSX tags. If you need to add a `className` into a fragment, you probably should add the `className` to its parent or add a DOM element like a div as shown below:

```jsx
{/* ContactsList.jsx */}
const renderContactLines = filteredContacts.map(
  contact => (
    <div key={contact.id} className="contactContainer">
      <b>{contact.name}</b> - {contact.location}
    </div>
  )
)
```