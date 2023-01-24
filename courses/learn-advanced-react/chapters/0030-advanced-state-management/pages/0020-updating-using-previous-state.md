This is a fairly uncommon use case but when you need to perform multiple operations on a state before queueing the next render, you will run into a few issues doing it the normal way as shown below:

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

While one might think the `number` state will be incremented by 2 once the button is clicked but React waits until all code in the event handlers has run before processing your state updates.

Every time the button is clicked, both state updates use the same value for `number` and thus, the code on the first click is equivalent to:

```jsx
setNumber(0 + 1);
setNumber(0 + 1);
```

The UI won’t be updated until after your event handler and any code in it are completed. This behavior, also known as batching, makes your React app run much faster. It also avoids dealing with confusing “half-finished” renders where only some of the variables have been updated.

To work around this, instead of replacing the previous value with a new one like `setNumber(number + 1)`, you can pass a function to calculate the next state based on the previous one like `setNumber(prevNumber => prevNumber + 1)` as shown below:

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

This code should work as expected and increment the `number` state by 2 when the button is clicked

The function `prevNumber => prevNumber + 1` is what we call an updater function and React queues this function to be processed after all the other code in the event handler has run.

This also works well with the Ramda functions shown in the previous section.