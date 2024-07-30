When passing callback functions down to child components as props, React will re-render those child components unnecessarily even if the callback functions remain the same. This behavior occurs because JavaScript treats functions as objects, and every time the parent component renders, it creates a new function instance. Even if we use the `React.memo()` in the child component, it won't prevent re-rendering as the reference of the callback function changes.

To address this problem, React provides a hook called `useCallback` that memoizes a callback function. This means it memoizes the function instance between renders, ensuring that a new function is not created on every render unless its dependencies change.

### Syntax of useCallback hook

The `useCallback` hook in React accepts two parameters.

1. `functionToCache`: The callback function that you want to memoize.
2. `dependencies`: An array of dependencies that, when changed, will cause the callback to be re-created.

```jsx
const memoizedCallback = useCallback(functionToCache, dependencies);
```

### Usage of useCallback hook

Let's consider an example where a button is rendered in both parent and child components which increments a counter when clicked. The function to increment the child counter is passed as a prop to the child from the parent. Additionally, we have memoized the child component.

Now, let's examine this scenario without using the `useCallback` hook:

```jsx
// App.jsx
import React, { useState } from "react";
import Child from "./Child";

const App = () => {
  const [childCount, setChildCount] = useState(0);
  const [parentCount, setParentCount] = useState(0);

  const incrementCount = () =>
    setChildCount(prevChildCount => prevChildCount + 1);

  return (
    <>
      <button
        onClick={() => setParentCount(prevParentCount => prevParentCount + 1)}
      >
        Parent counter
      </button>
      <span>{parentCount}</span>
      <Child count={childCount} incrementCount={incrementCount} />
    </>
  );
};

export default App;

//Child.jsx
const Child = ({ count, incrementCount }) => {
  console.log("rendering child");
  return (
    <div>
      <button onClick={incrementCount}>Child counter</button>
      <span>{count}</span>
    </div>
  );
};
export default React.memo(Child);
```

Every time the `parentCount` state changes, the parent component re-renders, creating a new instance of the `incrementCount` function. This causes the child component to re-render, making the `React.memo` wrapping ineffective.

This is where the `useCallback` hook comes to your rescue. We will wrap the `incrementCount` function inside a `useCallback` hook, ensuring that the `Child` is only re-rendered when the `childCount` changes.

```jsx
// App.jsx
import React, { useCallback, useState } from "react";
import Child from "./Child";

const App = () => {
  const [childCount, setChildCount] = useState(0);
  const [parentCount, setParentCount] = useState(0);

  const incrementCount = useCallback(() => {
    setChildCount(prevChildCount => prevChildCount + 1);
  }, [childCount]);

  return (
    <>
      <button
        onClick={() => setParentCount(prevParentCount => prevParentCount + 1)}
      >
        Parent counter
      </button>
      <span>{parentCount}</span>
      <Child count={childCount} incrementCount={incrementCount} />
    </>
  );
};

export default App;

//Child.jsx
const Child = ({ count, incrementCount }) => {
  console.log("rendering child");
  return (
    <div>
      <button onClick={incrementCount}>Child counter</button>
      <span>{count}</span>
    </div>
  );
};
export default React.memo(Child);
```

You may now observe that `rendering child` is logged to the console only when we click the `Child counter` button.

Note that this example is provided to demonstrate the functionality of the `useCallback` hook. It is not necessary to use the `useCallback` hook in this case, as the `Child` component is light and its re-rendering doesn’t affect performance. Only use `useCallback` on truly performance-critical callback functions.
