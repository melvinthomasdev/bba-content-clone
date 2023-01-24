## Memoization with a callback function

The Memoization shown in the previous chapter breaks when a parent component passes down a callback as a prop to its memoized child component. This is because on each render a new callback instance is created as shown in the example below

```javascript
const sum = () => (a, b) => a + b;

const fn1 = sum();
const fn2 = sum();

fn1 === fn2; // false
fn1 === fn1; // true
```

In the above example, `const sum = () => (a, b) => a + b;` is a function generator that creates the function `(a, b) => a + b`.
Functions are objects in Javascript and function equality doesn't hold true even if the function body and arguments are identical.
Each time `sum` is called, it returns a function with a different memory reference. Thus, `fn1` & `fn2` are unequal.

Generally, when creating callback functions, we use generators as shown in the example below:

```jsx
// App.jsx
import React, { useState } from "react";

const App = () => {
  const [count, setCount] = useState(0);
  const incrementCount = () => setCount(prevCount => prevCount + 1)

  return <Home count={count} incrementCount={incrementCount} />;
};

// Home.jsx
import React from "react";

const Home = ({ count, incrementCount }) => (
  <div>
    <p>{count}</p>
    <button onClick={incrementCount}>Click me!</button>
  </div>
);

export default React.memo(Home);
```

In the above example, the `App` component creates and passes along the `incrementCount` function that increments the `count` state. On every render, a new instance of `incrementCount` is created making the wrapping of `Home` in `React.memo` useless.

This is where the `useCallback` hook comes to your rescue.

## Using the useCallback Hook

The `useCallback` and the `useMemo` hooks are similar. The main difference is that `useMemo` returns a memoized value while `useCallback` returns a memoized function.

If we were to turn `incrementCount` into a memoized function using the `useCallback` hook, it would look this:

```jsx
// App.jsx
import React, { useState, useCallback } from "react";

const App = () => {
  const [count, setCount] = useState(0);
  const incrementCount = useCallback(() => {
    console.log(count)
    setCount(prevCount => prevCount + 1)
  }, [count])

  return <Home incrementCount={incrementCount} count={count} />;
};

// Home.jsx
import React from "react";

const Home = ({ count, incrementCount }) => (
  <div>
    <p>{count}</p>
    <button onClick={incrementCount}>Click me!</button>
  </div>
);

export default React.memo(Home);
```

The array that comes after the function is the dependency array. It determines when the function needs to be re-rendered which in this case is every time the value of `count` changes. By wrapping the `incrementCount` function inside a `useCallback` hook, we ensure that it is only re-rendered when the `count` changes.

However, it is important to remember that the `useCallback` hook isn't needed when the component is light and its re-rendering doesn’t affect performance.

The `useCallback()` hook itself is called each time MyComponent renders and you also add more complexity to the code when you have to ensure the dependencies of the `useCallback` hook match those inside the memoized callback.

Apply these optimization techniques only when necessary.