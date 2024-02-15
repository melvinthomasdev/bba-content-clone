As we have already learned, memoization is crucial for achieving performance improvements by caching the results of expensive computations and preventing unnecessary recomputation of values.

In this lesson, we will see how we can utilize the `useMemo` hook to memoize the result of a function. The `useMemo` hook caches the result of a function and re-computes the result only if one of the dependencies has changed.

### Usage of useMemo hook

The `useMemo` hook takes two arguments: a function that performs the expensive computation, and an array of dependencies.

```jsx
const cachedValue = useMemo(expensiveFunction, dependencies);
```

During initial rendering, `useMemo` invokes `expensiveFunction`, memoizes the calculation result, and returns it to the component.

If the dependencies don't change during the consequent renders, then `useMemo` doesn't invoke the `expensiveFunction` but returns the memoized value. But if the dependencies change during re-rendering, then `useMemo` invokes the `expensiveFunction`, memoizes the new value, and returns it.

Let's see with an example when we want to use the `useMemo` hook.

Suppose we have a function within a component that calculates the factorial of a prop. Here's an example of how we could implement this without using `useMemo`:

<codeblock language="reactjs" type="lesson" showConsole="true">
<code>
import { useState } from "react";

const App = () => {
  const [number, setNumber] = useState(1);
  const [rerenderCount, setRerenderCount] = useState(0);

  const factorialOf = value => {
    console.log("factorial called!");
    return value <= 0 ? 1 : value * factorialOf(value - 1);
  };

  const factorial = factorialOf(number);

  const onChange = event => {
    const value = event.target.value;

    // Restrict the user from typing more than two digits
    if (parseInt(value) <= 99 || value === "") {
      setNumber(value);
    }
  };

  return (
    <div>
      Factorial of
      <input type="number" value={number} onChange={onChange} />
      is {factorial}
      <div>
        <button
          onClick={() =>
            setRerenderCount(prevRerenderCount => prevRerenderCount + 1)
          }
        >
          Re-render
        </button>
        count: {rerenderCount}
      </div>
    </div>
  );
};

export default App;
</code>
</codeblock>

Every time you change the input value, the factorial is calculated, and `factorial called!` is logged into the console.

Also, each time the Re-render button is clicked, the `rerenderCount` state value is updated. This causes the component to re-render, which triggers the `factorialOf` function again.

The problem here is that factorials are expensive to calculate, and we don't want it to re-calculate this value when some unrelated state or prop changes.

Let's see how we can memoize the factorial calculation.

<codeblock language="reactjs" type="lesson" showConsole="true">
<code>
import { useMemo, useState } from "react";

const App = () => {
  const [number, setNumber] = useState(1);
  const [rerenderCount, setRerenderCount] = useState(0);

  const factorialOf = n => {
    console.log("factorial called!");
    return n <= 0 ? 1 : n * factorialOf(n - 1);
  };

  const factorial = useMemo(() => factorialOf(number), [number]);

  const onChange = event => {
    const value = event.target.value;

    // Restrict the user from typing more than two digits
    if (parseInt(value) <= 99 || value === "") {
      setNumber(value);
    }
  };

  return (
    <div>
      Factorial of
      <input type="number" value={number} onChange={onChange} />
      is {factorial}
      <div>
        <button
          onClick={() =>
            setRerenderCount(prevRerenderCount => prevRerenderCount + 1)
          }
        >
          Re-render
        </button>
        count: {rerenderCount}
      </div>
    </div>
  );
};

export default App;
</code>
</codeblock>

Now, you may observe that, if you click the Re-render button, 'factorial called!' isn't logged to the console because `factorial` returns the memoized factorial calculation. The factorial calculation is only done when the value of the `number` state changes.

### Use memoization with care

It's essential to use memoization judiciously, as caching results consume memory, and memoized functions can become stale if they rely on external state changes without updating the cache.
