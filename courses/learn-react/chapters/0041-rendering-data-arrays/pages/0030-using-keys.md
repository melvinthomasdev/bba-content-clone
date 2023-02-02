As mentioned earlier, all of the previous examples in this chapter give a warning in the console stating that each child in a list should have a unique “key” prop.

Keys are identifiers that help React keep track of the various elements in an array during modifications. They can be inserted like so:

```jsx
<li key={value}>{name} - {location}</li>
```

These keys must be unique within their arrays and they must not change.

The default React behavior if no key is specified is to simply use the index/position of the element as shown below but this is **not** recommended.

```jsx
{/* ContactsList.jsx */}
const renderContactLines = filteredContacts.map(
  (contact, index) => (
    <li key={index}>
      {contact.name} - {contact.location}
    </li>
  )
)
```

Any deletions, insertions or re-ordering of the list when using the index as the key could mess up the order and lead to subtle errors that are hard to debug.

Instead, we recommend sourcing your keys from a unique ID that is stored in a file or database.

In the examples shown previously, we stored the contact data in a file called `constants.js`. We can modify the file to have an incremental counter as an id like so:

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
      {contact.name} - {contact.location}
    </li>
  )
)
```

Note: Keys are not a prop you can access in the component definition. If you need to access them, add another prop to pass them along.