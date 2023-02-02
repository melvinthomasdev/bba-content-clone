These fragments can also be written without the special syntax by importing them from React as such:

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
      {contact.name} - {contact.location}
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
      {contact.name} - {contact.location}
    </div>
  )
)
```