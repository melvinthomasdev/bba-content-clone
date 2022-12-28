When you require interactivity in your app, you need a way for the app to remember data regarding which buttons have been clicked, which input fields have been filled and what values they contain.

Creating a local variable in a component won't help as any changes you make to them won't persist between renders of said component.
Here is where a state comes to help.

React offers a `useState` "hook" which returns 2 things:

* A state variable that retains data between each render.
* A setState function that updates the variable and triggers a re-render.

A "hook" is a special function outside the normal React render cycle that we use to provide persistent functionality outside normal rendering. Of all the hooks, the `useState` hook is probably going to be the most commonly used hook you're going to use while coding in React.

Here's a simple example of the useState hook in use:

```jsx
{/* PageIndex.jsx */}
import { useState } from 'react';

const PageIndex = () => {
  const [page, setPage] = useState(0);
  const clickHandler = () => setPage(page + 1)

  return (
    <button onClick={ clickHandler }>
      Page {page} : Go to next page >
    </button>
  )
}
```

In the above example, the `page` is the state variable while `setPage` is its setter function.

When you "set a state" using the `setPage` function, you are replacing the constant `page` and re-rendering the component along with its children with the new value of `page`.

While you could use any name for the state and its setter function, the convention most almost always used is to name the state and setState function like so:  `const [name, setName] = useState(initialValue)`.

Do remember to reserve the 'set' prefix for state hook setters. Using the set prefix on custom functions not related to states can be very confusing.

## State Definitions

It is important to note that the useState hook (along with most other hooks) must be defined at the top of a component definition and cannot be defined inside a loop or conditional branch like so:

```jsx
{/* PageIndex.jsx */}
import { useState } from 'react';

{/*Do not define a state inside a conditional block like this!*/}
const PageIndex = (hasPages) => {
  if(hasPages){
    const [page, setPage] = useState(0);
  }
  const clickHandler = () => hasPages && setPage(page + 1)

  return (
    <button onClick={ clickHandler }>
      Page {page} : Go to next page >
    </button>
  )
}
```

## Lifting a State up

Every state is private to each component, once defined in a component it can only be used within that component or passed down to its children via props.

Here's an example of an app with a `NextPageButton` and `PageNumberDisplay` component with a critical bug in it:

```jsx
{/* App.jsx */}
import { useState } from 'react';

const App = () => (
  <div>
    Page Contents
    <PageNumberDisplay />
    <NextPageButton />
  </div>
)

const NextPageButton = () => {
  const [page, setPage] = useState(0);

  return (
    <button onClick={ () => setPage(page + 1) }>
      Go to next page >
    </button>
  )
}

const PageNumberDisplay = () => {
  const [page, setPage] = useState(0);

  return (
    <span>
      Page #{page}
    </span>
  )
}
```

In the above example, `NextPageButton` and `PageNumberDisplay` have states that run independently of one another. Changing the page in `NextPageButton` does not reflect on the page shown in `PageNumberDisplay`.

To have a synced state between any 2 components, the state must be defined in a common ancestor and passed down as needed. This is generally the nearest common parent. The earlier example corrected should instead look like this:

```jsx
{/* App.jsx */}
import { useState } from 'react';

const App = () => {
  const [page, setPage] = useState(0);
  const advancePage = () => setPage(page + 1)

  return (
    <div>
      Page Contents
      <PageNumberDisplay page={ page }/>
      <NextPageButton advancePage={ advancePage }/>
    </div>
  )
}

const NextPageButton = ({ advancePage }) => (
  <button onClick={ advancePage }>
    Go to next page >
  </button>
)

const PageNumberDisplay = ({ page }) => (
  <span>
    Page #{page}
  </span>
)
```

Now, when the page number is increased in `NextPageButton`, it will show the correct page in `PageNumberDisplay`.