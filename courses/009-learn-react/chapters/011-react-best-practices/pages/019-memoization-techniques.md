Memoization refers to an optimization technique where the result of a
computationally expensive process is remembered so that it can be used later.
Doing so saves us from running the expensive computation everytime to get the
result.

For example, consider an expensive function which always returns the same result
given the same input like so:

```javascript
const expensiveFunction = (minimum, maximum) => {
  let res = 0;
  for (let i = 0; i < 10000; i++) {
    res += minimum * maximum * i;
  }
  return res;
};
```

In the above example, invoking the `expensiveFunction` will always return the
same result as long as the values of `minimum` and `maximum` do not change. If
we could somehow save the return value of the function to reuse it wherever
required and only invoke the function if the arguments change then it would save
a significant amount of computational resource and time.

## `useMemo` hook in React

React provides a `useMemo` hook which accepts a callback function and a
dependency array. The callback function is invoked during the first render and
after that only when the values inside the dependency array change.

Consider the following example:

```jsx
import React, { useMemo } from "react";

const Display = ({ minimum, maximum }) => {
  const resultOfAnExpensiveComputation = useMemo(() => {
    let res = 0;
    for (let i = 0; i < 10000; i++) {
      res += minimum * maximum * i;
    }
    return res;
  }, [minimum, maximum]);

  return <p>{resultOfAnExpensiveComputation()}</p>;
};
```

In the above component the callback function inside the `useMemo` hook will be
invoked during the first render and after that only when `minimum` and `maximum`
values change. For subsequent renders the value stored inside the
`resultOfAnExpensiveComputation` variable will be used.

Note that you should only use the `useMemo` hook for pure functions. If you want
to fire a side-effect such as an asynchronous API call or a state update when
the value inside the dependency array changes then you should use the
`useEffect` hook.

## React.memo

`React.memo` is a higher order component. If your component returns the same
results for the same props each time then you can memoize the component. During
the next render React will do a shallow comparison of the props, if the props
are equal then React will not re-paint the browser and re-render. It will use
the memoized value of the component. For example:

```jsx
import React from "react";

const Display = ({ user }) => (
  <div>
    <p>{user.name}</p>
    <p>{user.email}</p>
  </div>
);

export default React.memo(Display);
```

In the above example, as long as the user prop does not change, React will not
re-render the `Display` component. It will use the memoized value of the
`Display` component.

Although `React.memo` offers a good way of performance optimization, you should
be careful while using it. It should only be used to memoize pure components.
For example, the following component should not be memoized:

```jsx
import React from "react";

const Display = ({ user }) => {
  const date = new Date();

  return (
    <div>
      <p>{user.name}</p>
      <p>{user.email}</p>
      <p>date: {date.getDate()}</p>
    </div>
  );
};

export default React.memo(Display);
```

In the above component, the UI also depends upon the date along with the props
hence the component will return a different value each time irrespective of
props not updating. Hence the `Display` component in the above example should
not be memoized.

You should also keep in mind to use memoize a component only if that component
is bulky or renders too often.

Another important point to note here is that even if a component is wrapped
within `React.memo`, it will still get re-rendered if its state changes.

## Memoization and callback props

Memoization breaks when a parent component passes down a callback as a prop to
its memoized child component. This is because on each render a new instance of
callback is created. As we know functions are objects in Javascript, function
equality doesn't hold true even if the function body and arguments are same.
This is better illustrated with in the following example:

```javascript
const sum = (a, b) => (a, b) => a + b;

const firstFunction = sum();
const secondFunction = sum();

console.log(firstFunction === secondFunction); // false
console.log(firstFunction === firstFunction); // true
```

In the example shown above, invoking the `sum` function returns another
function. Each time `sum` is called, it returns a function with a different
memory reference. This is why `firstFunction` and `secondFunction` are unequal,
they contain the memory reference of the functions which is different for both
functions.

Now let us take a look at the following component:

```jsx
// App.jsx
import React, { useState } from "react";

const App = () => {
  const [count, setCount] = useState(0);

  const updateCount = () => setCount(prev => prev++);

  return <Home setCount={updateCount} count={count} />;
};

// Home.jsx
import React from "react";

const Home = ({ count, updateCount }) => (
  <div>
    <p>{count}</p>
    <button onClick={updateCount}>Click me!</button>
  </div>
);

export default React.memo(Home);
```

In the above example, `App` component is passing down the `updateCount` function
as a prop to the memoized `Home` component. Each time state updates and `App`
component re-renders, a new instance of `updateCount` will be created. React
will do a shallow comparison between the previous instance of `updateCount` with
the new instance and because they will have a different reference in memory,
memoization will break.

To fix this, we can use the `useCallback` hook from React. The `useCallback`
hook returns a memoized callback. In simple terms, if the dependencies of the
callback function do not change then instead of creating a new instance of the
callback, React will use the memoized version.

This is useful when passing callbacks to optimized child components that rely on
reference equality to prevent unnecessary renders. For example, passing a
callback to a memoized component.

Let us see how to fix the memoization using the `useCallback` hook:

```jsx
// App.jsx
import React, { useState, useCallback } from "react";

const App = () => {
  const [count, setCount] = useState(0);

  const updateCount = useCallback(() => setCount(prev => prev++), [setCount]);

  return <Home setCount={updateCount} count={count} />;
};

// Home.jsx
import React from "react";

const Home = ({ count, updateCount }) => (
  <div>
    <p>{count}</p>
    <button onClick={updateCount}>Click me!</button>
  </div>
);

export default React.memo(Home);
```

## Another Example of useCallback

Let's go through another use case of this hook by building a simple form with 3
input fields:

```javascript
import React from "react";

const MyInput = ({ label, value, onChangeHandler }) => {
  return (
    <>
      <p> {label} </p>
      <input value={value} onChange={onChangeHandler}></input>
      <br />
    </>
  );
};

export default function App() {
  // 3 states
  const [name, setName] = React.useState("");
  const [middleName, setMiddleName] = React.useState("");
  const [surname, setSurname] = React.useState("");

  // 3 handlers
  const onNameChangeHandler = e => {
    setName(e.target.value);
  };

  const onMiddleNameChangeHandler = e => {
    setMiddleName(e.target.value);
  };
  const onSurnameChangeHandler = e => {
    setSurname(e.target.value);
  };

  return (
    <>
      <MyInput
        label="Name:"
        value={name}
        onChangeHandler={onNameChangeHandler}
      />
      <MyInput
        label="Middle Name:"
        value={middleName}
        onChangeHandler={onMiddleNameChangeHandler}
      />
      <MyInput
        label="Surname:"
        value={surname}
        onChangeHandler={onSurnameChangeHandler}
      />
    </>
  );
}
```

## Understanding unnoticed re-rendering

When running the above code we should be seeing the re-rendering stack as shown
below from the console:

```plaintext
Re-rendering Name:
Re-rendering Middle Name:
Re-rendering Surname:
Re-rendering Name:
Re-rendering Middle Name:
Re-rendering Surname:
Re-rendering Name:
Re-rendering Middle Name:
Re-rendering Surname:
Re-rendering Name:
Re-rendering Middle Name:
Re-rendering Surname:
Re-rendering Name:
Re-rendering Middle Name:
Re-rendering Surname:
Re-rendering Name:
Re-rendering Middle Name:
Re-rendering Surname:
```

**The re-rendering happened because in ReactJS a child component re-renders
whenever a parent component re-renders.**

In the above example, the state is saved in the `App` component. So when we
start typing inside the name field, state of parent component is getting updated
which renders parent `App` component which in turn re-renders all the 3
`MyInput` child components.

In the above example, we need to memoize all 3 input handlers. Take a moment to
think of why we need memoize the handlers. We will point out the reason for the
same towards the end of this chapter.

## Avoid re-rendering with React memo

**React.memo does shallow compare old and new props, if props are changed then
it re-renders the component.**

Lets add `React.memo` to all 3 `MyInput` components:

```javascript
import * as React from "react";

const MyInput = React.memo(({ label, value, onChangeHandler }) => {
  console.log(`Re-rendering ${label}`);

  return (
    <>
      <p> {label} </p>
      <input value={value} onChange={onChangeHandler} />
      <br />
    </>
  );
});

// Previous code of App Component as it is.
```

When you run the above mentioned code, re-rendering will still happen. Can you
figure out why?

Remember that `React.memo` does shallow compare old and new props. But if props
are changed then it re-renders the component. In our case we are passing 3 props
to `MyInput` component.

1. label: This is string value, whose reference stays same between re-rendering.
2. value: This is string value, whose reference stays same between re-rendering.
3. onChangeHandler: This is function, whose reference changes between
   re-rendering.

## Keep function reference constant with useCallback

Lets add `React.memo` as well as `React.useCallback` to the original code:

```javascript
// Previous code of MyInput Component as it is.

export default function App() {
  // 3 states
  const [name, setName] = React.useState("");
  const [middleName, setMiddleName] = React.useState("");
  const [surname, setSurname] = React.useState("");

  // 3 handlers
  const onNameChangeHandler = React.useCallback(e => {
    setName(e.target.value);
  }, []);

  const onMiddleNameChangeHandler = React.useCallback(e => {
    setMiddleName(e.target.value);
  }, []);

  const onSurnameChangeHandler = React.useCallback(e => {
    setSurname(e.target.value);
  }, []);

  // Previous code of App Component as it is.
}
```

When you run the above mentioned code re-rendering will not happen.

## References

- [React.memo](https://reactjs.org/docs/react-api.html#reactmemo)
