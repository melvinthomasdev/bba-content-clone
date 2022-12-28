## Using previous state for state update

The `useState` hook in React returns an array whose second element is a setter
function which sets the state. The setter function also accepts a callback
function. When the setter function is called, it calls the callback function
with the previous state as an argument and updates the state to the return value
of the callback function.

For example:

```jsx
import React, { useState } from "react";

export default function App() {
  const [count, setCount] = useState(0);

  const updateCount = () => {
    setCount(prevCount => prevCount + 1);
  };

  return (
    <div className="App">
      <h1>{count}</h1>
      <button onClick={updateCount}>Increment</button>
    </div>
  );
}
```

In the above example, `setCount` is using the previous state for updating the
state.

## When to use the previous state for state update

As it might be clear from the previous example, you should use the above
approach when the next state depends upon the previous state.

Let us update the previous example a bit to understand this.

```jsx
import React, { useState } from "react";

export default function App() {
  const [count, setCount] = useState(0);

  const updateCount = () => {
    setTimeout(() => setCount(count + 1), 1000);
    // setTimeout(() => setCount(prevCount => prevCount + 1), 1000);
  };

  return (
    <div className="App">
      <h1>{count}</h1>
      <button onClick={updateCount}>Increment</button>
    </div>
  );
}
```

The above code is very simple. In the above code, the count should increase by
one upon button click after a timeout of `1000ms`. We will do a little
experiment here.

1. First comment out line number 8 and run the code.
1. Then click the button 10 times. The count should have been 10 by the end of
   it but it won't be. It will be less than 10.

The reason for this is that the `setCount` function is called after a timeout of
1000ms and the time interval between the button clicks is less than that. It is
safe to assume that the state doesn't get updated within the 1000ms timeout and
the value of count remains the same.

Let's say that the button is clicked thrice within the 1000ms timeout and the
time it takes for the state to update once. The `setTimeout` function will be
called thrice and it will in turn call `setCount` thrice after an interval of
1000ms each time. Since the state update has not happened when the button is
clicked, everytime `setCount` is called, the value of `count` it references to
will be the old value due to closure.

Let us also do a dry run like so:

```javascript
// Component mounts
count = 0

// button clicked for the first time
count = 0
count + 1 = 1

// button clicked for the second time
count = 0
count + 1 = 1

// button clicked for the first time
count = 0
count + 1 = 1

// After 1000ms interval state updates
count = 1
```

It is clear from the above examples that the count only increases by 1 when it
should have increased by 3 when the button was clicked thrice.

Now let us see how we can overcome the closure hell. In the above example,
comment line number 7 and uncomment line number 8 like so:

```jsx
import React, { useState } from "react";

export default function App() {
  const [count, setCount] = useState(0);

  const updateCount = () => {
    // setTimeout(() => setCount(count + 1), 1000);
    setTimeout(() => setCount(prevCount => prevCount + 1), 1000);
  };

  return (
    <div className="App">
      <h1>{count}</h1>
      <button onClick={updateCount}>Increment</button>
    </div>
  );
}
```

Let's perform our little experiment again. Click the button 10 times and by the
end of it you will see that the state has been updated 10 times and the final
value of count that you get is 10.

In this case when the button is clicked and `setTimeout` calls `setCount`
function, the `setCount` function is not using the value of `count` for state
update. Rather it is using `prevCount`. `prevCount` is different for each button
click because it gets created after the button is clicked hence it will refer to
the latest value of state.
