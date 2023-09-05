An Effect is defined by React as a "side effect caused by rendering".

It allows us to initialize or synchronize your React code with your server-side code, external APIs or third-party widgets.

The syntax is as simple as `useState(function, dependencies)`.

* The "function" is the side effect that runs when needed.
* The "dependencies" are the array of conditions that determine when the function should run.
* If no dependencies are given, the function runs on every render. This is inefficient and not recommended in most cases.
  * If dependencies are an empty array `[]`, the function runs just once on mount.
  * If dependencies contain variables like `[v1, v2]`, the function runs once on mount and every time either v1 or v2 changes.

One important thing to note is that we cannot pass an array or an object as a dependency.

React uses a shallow comparison to check if the dependency’s reference has changed but arrays and objects change reference on every render causing an infinite loop.

The simplest way to solve this is by breaking the array or object down into primitives and passing them but this technique won't work on larger non-primitives. We will explain more robust methods in the advanced guide.

<!-- For more information on dependency arrays, you can jump to this section of our advanced guide. -->
<!-- TODO: Link to courses/learn-advanced-react/chapters/0060-code-optimization/pages/0050-dependency-arrays in the advanced guide once published  -->

Here's a simple example where we initialize contacts based on an external API called `fetchContacts`:

```jsx
{/* ContactsContainer.jsx */}
import {fetchContacts} from "./utils"
import ContactsList from "./ContactsList"

const ContactsContainer = ({ userId }) => {
  const [contacts, setContacts]

  const getContacts = async () => {
    const contactsData = await fetchContacts();
    setContacts(contactsData);
  }

  useEffect(() => {
    fetchContacts();
  }, [])

  return (
    <div className="contactsContainer">
      <ContactsList contacts={contacts}>
    </div>
  )
}
```

In the above example, since dependencies are set to `[]`, the function runs just once on mount, fetches contacts from your API endpoint and sets the state which is passed on to `ContactsList`.

Note: The keywords `async` and `await` keywords are just ways to interface with an API, we'll explain more about them later.
