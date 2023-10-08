When you require interactivity in your app, you need a way for the app to remember data regarding which buttons have been clicked, which input fields have been filled and what values they contain.

Creating a local variable in a component won't help as any changes you make to them won't persist between renders of said component.
Here is where a state comes to help.

React offers a `useState` "hook" which returns 2 things:
* A state variable that retains data between each render.
* A state setter function that updates the variable and triggers a re-render.

A "hook" is a special function that we use to provide persistent functionality outside normal rendering.
The `useState` hook is probably going to be the hook you use most while coding in React.

Here's a simple example of the useState hook in use:

```jsx
{/* PageIndex.jsx */}
import { useState } from 'react';

const PageIndex = () => {
  const [page, setPage] = useState(0);
  const clickHandler = () => setPage(page + 1)

  return (
    <button onClick={clickHandler}>
      Page {page} : Go to next page >
    </button>
  )
}
```

In the above example, the `page` is the state variable while `setPage` is its setter function.

When you "set a state" using the `setPage` function, you are replacing the constant `page` and re-rendering the component and with its children with the new value of `page`.

While you could use any name for the state and its setter function, the convention most almost always used is to name the state and setState function like this:  `const [name, setName] = useState(initialValue)`.

Do remember to reserve the 'set' prefix for state hook setters.
Using the 'set' prefix on non-state functions can be very confusing to people reading your code.

It is also important to note that the useState hook (along with most other hooks) must be defined at the top of a component definition and cannot be defined inside a loop or conditional branch like this:

```jsx
{/* PageIndex.jsx */}
import { useState } from 'react';

{/*Do not define a state inside a conditional block like this!*/}
const PageIndex = hasPages => {
  if(hasPages){
    const [page, setPage] = useState(0);
  }
  const clickHandler = () => hasPages && setPage(page + 1)

  return (
    <button onClick={clickHandler}>
      Page {page} : Go to next page >
    </button>
  )
}
```