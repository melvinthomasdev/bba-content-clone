As we've explained previously, when a state update depends on its previous value, we use the state update method to avoid possible inconsistencies that may arise.

<!-- TODO: Link to the react basics chapter once published -->

Take an example where you need to perform multiple operations on a single state before the next render as shown below:

```jsx
import { useState } from 'react';

const Counter = () => {
  const [number, setNumber] = useState(0);

  return (
    <>
      <h1>{number}</h1>
      <button onClick={() => {
        setNumber(number + 1);
        setNumber(number + 1);
      }}>+2</button>
    </>
  )
}

export default Counter;
```

One might think the `number` state will be incremented by 2 once the button is clicked but React waits until all code in the event handlers has run before processing the state updates.

So in this scenario, Once the button is clicked, both state updates use the same value for `number` and thus, the code on the first click is equivalent to:

```jsx
setNumber(0 + 1);
setNumber(0 + 1);
```

The UI won’t be updated until after all the code in your event handler is completed. This behavior, also known as batching, makes your React app run much faster. It also avoids dealing with confusing “half-finished” renders where only some of the variables have been updated.

Here is why we need to use the functional update form: `setNumber(prevNumber => prevNumber + 1)` as shown below.

```jsx
import { useState } from 'react';

const Counter = () => {
  const [number, setNumber] = useState(0);

  return (
    <>
      <h1>{number}</h1>
      <button onClick={() => {
        setNumber(prevNumber => prevNumber + 1);
        setNumber(prevNumber => prevNumber + 1);
      }}>+2</button>
    </>
  )
}

export default Counter;
```

In the code above, React queues the 2 functions `prevNumber => prevNumber + 1` to be processed one after the other and thus, the code should work as expected and increment the `number` state by 2 when the button is clicked

This method of updating the state also works well with the Ramda functions shown in the previous section.