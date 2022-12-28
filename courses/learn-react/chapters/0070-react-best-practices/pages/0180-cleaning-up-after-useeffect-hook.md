`useEffect` hook in React accepts a callback function and a dependency array.
React calls the `useEffect` hook after the initial render if the dependency
array is empty. In case the dependency array contains elements then the effect
is applied after the initial render and after the value of an element inside the
dependency array changes. If no dependency array is passed then the effect is
applied after the initial render and then each time the component gets
re-rendered.

The `useEffect` hook is used for a number of applications such as loading data
using an API call or adding an event listener. Subscriptions like event
listeners which are added inside a `useEffect` hook should be cleaned up to
prevent any memory leaks.

You can return a callback function from the callback function passed to the
`useEffect` hook. The callback function which is returned runs when the previous
effect completes and before applying the next effects.

The following example depicts how to clean up after effects in a functional
React component:

```jsx
import React, { useEffect } from "react";

const Home = () => {
  const displayComponentName = () => alert("This is the Home component");

  useEffect(() => {
    window.addEventListener("click", displayComponentName);

    return () => window.removeEventListener("click", displayComponentName);
  }, []);

  return <p>Home Component</p>;
};
```

## When does React cleans up the effect?

React cleans up the previous effect before applying the next effect. Let us
understand why with the with the help of an example:

```jsx
import React, { useEffect, useState } from "react";

const Display = () => {
  const [count, setCount] = useState(0);

  useEffect(() => {
    const id = setInterval(() => setCount(count => count + 1), 10000);

    return () => clearInterval(id);
  });

  return <p>{count}</p>;
};
```

In the above example, the `useEffect` hook will be called after each update. If
React only cleans up the effect when the component unmounts then there will be a
memory leakage because a fresh `setInterval` process spawns for each effect and
it will stay in memory because it doesn't get cleaned up before the next effect
is applied. Only the last `setInterval` process will be cleared during the
unmount.

Each `useEffect` has it's own scope and it stays in the memory until it is
cleared.

Therefore, React cleans up the previous effect before applying the next one.
Shown below is a dry run of the example above:

```javascript
// First effect runs
const id = setInterval(() => setCount(count => count + 1), 10000); // setInterval with id = 1 runs.

// First effect ends
clearInterval(id); // setInterval process with id = 1 is cleared

// second effect runs
const id = setInterval(() => setCount(count => count + 1), 10000); // setInterval with id = 2 runs.
```
