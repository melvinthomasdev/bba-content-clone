Instead of giving the state setter function a fixed value to replace the current state, we can use an alternate syntax and give it a function that takes the current state and outputs a new one like so:

```jsx
setState(prevState => {
  //process prevState into newState
  return newState
})
```

The example shown in the previous page can be reworked to use this new syntax like so:

```jsx
{/* PageIndex.jsx */}
import { useState } from 'react';

const PageIndex = () => {
  const [page, setPage] = useState(0);
  // const clickHandler = () => setPage(page + 1) //inserting a new state
  const clickHandler = () => setPage(prevPage => prevPage + 1) //updating using previous state

  return (
    <button onClick={clickHandler}>
      Page {page} : Go to next page >
    </button>
  )
}
```

While the syntax we showed on the previous page is the most commonly used one, there is a possibility that the state setter function fails when it is called multiple times in quick succession.

This will be explained further in the advanced React chapter but for now, remember to use this syntax when the updation of a state variable is dependent on its previous state.