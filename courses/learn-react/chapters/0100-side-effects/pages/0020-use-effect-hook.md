In the previous lesson, we learned the concept of the component lifecycle, and we mentioned that the `useEffect` hook plays a crucial part in component lifecycle management. So in this lesson, we will learn what the `useEffect` hook is and how we can utilize it to perform specific actions during different phases of the component lifecycle. Subsequently, we will apply this knowledge to enhance our `Carousel` component to switch between images at an interval.

<image>carousel-with-automatic-scroll.gif</image>

The `Effects` in React are a way to synchronize the React component with the outside world. This "outside world" can include browser features, local storage, network requests, and more. In React, the rendering process is similar to solving a mathematical equation. Just as we input values, perform operations, and obtain a result, in React, we provide props, apply transformations, and generate JSX as the output. Ideally, rendering should be pure and not have any effects outside of the component. However, in many cases, we need side effects to reach outside of our React components to do something.

`useEffect` hook allows us to run effects from React components after the component is rendered. By using the hook, we can easily manage side effects in our React components.

### Usage of useEffect hook

The general syntax of `useEffect` is as follows:

```jsx
import { useEffect } from "react";

const MyComponent = () => {
  useEffect(() => {
    // Code to interact with external system

  }, [dependency1, dependency2, ...]);

  // rest of the logic ...
};
```

The useEffect hook takes two arguments:

1. The first argument is a function that contains the logic that can introduce a side effect like sending an API call, initializing some libraries, etc. It is usually referred to as the **effect function**.
2. The second argument is an optional array of dependencies that specify when the effect should run.

The `useEffect` hook will always trigger the effect function after the initial component render. The dependency array is used to specify when all the effect function needs to be run additionally. Let's see how it works under different combinations of dependencies:

### useEffect hook with a non-empty dependencies array

When the `useEffect` hook is called with a non-empty dependency array, it checks if any of the dependency values are different from the previous render. If there are any differences, the effect function will be invoked after rendering is complete. Otherwise, the effect function will not run for that render cycle.

In the example given below, we have implemented a simple component that displays a count, a button to increase the count, and an input field to enter a message.

Whenever the user enters a value in the input field, the `message` state will be updated. And, when the user clicks on the button, it will increment the `count` state by `1`.

We have included the `count` state as the dependency on the `useEffect` hook. As a result, it will log `Executing side effect` to the console whenever the value of `count` changes and when the component is mounted.

Since the `useEffect` hook is dependent only on the `count` state, changing the value of the `message` state by typing in the input field will not trigger the effect. However, due to the component re-rendering each time you type in the input field, the console will print `Rendering`.

<codeblock language="reactjs" type="lesson" showConsole="true">
<code>
import { useState, useEffect } from "react";

const App = () => {
  const [count, setCount] = useState(0);
  const [message, setMessage] = useState("");

  useEffect(() => {
    console.log("Executing side effect");
  }, [count]);

  console.log("Rendering");

  return (
    <div>
      <p>You clicked {count} times</p>
      <input
        type="text"
        value={message}
        onChange={e => setMessage(e.target.value)}
      />
      <button onClick={() => setCount(count + 1)}>Increase count</button>
    </div>
  );
};

export default App;
</code>
</codeblock>

Generally, `console.log` is not considered a side effect even if it is bringing a permanent change to the outside world, that is printing a new log statement. It is because `console.log` is considered as a debugging utility. But for now, let us consider it as the effect we need to run from our `useEffect` hooks.

One important thing to notice here is that the console prints `Executing side effect` and `Rendering` twice when the component gets mounted. This behavior is a result of the double rendering feature introduced in React 18 in [Strict Mode](https://react.dev/reference/react/StrictMode). Strict Mode ensures that components remain [pure](https://react.dev/reference/react/PureComponent) with respect to their props, which means when the same set of props is supplied to a component, it should produce the same output. By rendering the component twice, it ensures that the components are pure. Rendering the component twice also helps us to identify bugs caused by missing effects cleanup. We will be learning about effect cleanup later in this lesson. Please note that this is a development-only behavior and doesn't occur in other environments.

### useEffect hook with an empty dependencies array

When we pass an empty array as a dependency to the `useEffect` hook, the side effect runs only when the component is rendered for the first time, not on the subsequent re-renders.

In the example given below, the `Executing side effect` will be logged to the console only when the component is rendered for the first time.

<codeblock language="reactjs" type="lesson" showConsole="true">
<code>
import { useState, useEffect } from "react";

const App = () => {
  const [count, setCount] = useState(0);
  const [message, setMessage] = useState("");

  useEffect(() => {
    console.log("Executing side effect");
  }, []);

  return (
    <div>
      <p>You clicked {count} times</p>
      <input
        type="text"
        value={message}
        onChange={e => setMessage(e.target.value)}
      />
      <button onClick={() => setCount(count + 1)}>Increase count</button>
    </div>
  );
};

export default App;
</code>
</codeblock>

### useEffect hook without dependencies array

When the dependencies array is not passed in the `useEffect` hook, the side effect runs every time the component re-renders. However, it's important to note that using `useEffect` without a dependencies array can lead to performance issues and infinite re-renders.

### `useEffect` hook execution summary

The table below summarizes when the `useEffect` hook will run based on the dependency array.

| Case                              | Initial render | Subsequent render            |
| --------------------------------- | -------------- | ---------------------------- |
| With a non-empty dependency array | Yes            | Whenever dependencies change |
| With empty dependency array       | Yes            | No                           |
| With no dependency array          | Yes            | Yes                          |

### Cleaning up effects

When adding event listeners, subscriptions, or timers using useEffect, it's crucial to clean up these side effects by removing event listeners, unsubscribing events, or clearing timers when the component unmounts. This is important to prevent memory leaks and unexpected behavior in your application.

With the help of an example, we will see why cleaning up effects is important. In the example given below, we have created a component called `Counter`. In this component, we've introduced a side effect: registering an interval. It will log `Executing side effect` to the console every `3000` milliseconds.

<codeblock language="reactjs" type="lesson" showConsole="true">
<code>
import { useState, useEffect } from "react";

const Counter = () => {
  const [count, setCount] = useState(1);

  useEffect(() => {
    setInterval(() => console.log("Executing side effect"), 3000);
  }, []);

  return (
    <>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(prevCount => prevCount + 1)}>+</button>
    </>
  );
};

const CounterController = () => {
  const [showCounter, setShowCounter] = useState(false);

  return (
    <>
      <button onClick={() => setShowCounter(showCounter => !showCounter)}>
        {showCounter ? "Unmount Counter" : "Mount Counter"}
      </button>
      {showCounter && <Counter />}
    </>
  );
};

export default CounterController;
</code>
</codeblock>

When the `Mount Counter` button is clicked, the `Counter` component is mounted, and you will start getting the logs.

But here's the problem, when we click on `Unmount Counter`, the `Counter` component is unmounted, but the console continues to log the message `Executing side effect`. This is because the timer created as part of the side effect logic is still running.

Furthermore, if we repeatedly re-mount the `Counter` component, additional intervals are added without clearing the previous ones. This can lead to unnecessary resource consumption and memory leaks as the timer continues to run even after the component has been removed from the DOM.

To address this issue, we need to define a cleanup function. `useEffect` hook considers the return value of the effect function as its cleanup function. So, we can return a function that clears the previously registered interval from our effect function:

<codeblock language="reactjs" type="lesson" showConsole="true">
<code>
import { useState, useEffect } from "react";

const Counter = () => {
  const [count, setCount] = useState(1);

  useEffect(() => {
    const timerId = setInterval(
      () => console.log("Executing side effect"),
      3000
    );

    return () => {
      clearInterval(timerId);
    };
  }, []);

  return (
    <>
      <b>Count: {count} </b>
      <button onClick={() => setCount(prevCount => prevCount + 1)}>+</button>
    </>
  );
};

const CounterController = () => {
  const [showCounter, setShowCounter] = useState(false);

  return (
    <>
      <button onClick={() => setShowCounter(showCounter => !showCounter)}>
        {showCounter ? "Unmount Counter" : "Mount Counter"}
      </button>
      {showCounter && <Counter />}
    </>
  );
};

export default CounterController;
</code>
</codeblock>

When we click on `Unmount Counter`, the `Counter` component is unmounted and removes the interval created by the `useEffect` hook earlier.

Also note that, if the component rerenders and any of the dependencies change, the previously returned cleanup function will be executed just before invoking the effect function of the current render. As we learned earlier, if there aren't any dependency changes, neither the effect function nor the cleanup function will run.

Now that we have learned how to use the `useEffect` hook to introduce side effects in a component, let's apply this knowledge to the SmileCart project. In our `Carousel.jsx` file, we will setup a timer to switch between images every `3000` ms. Let's take a look:

```jsx
// ...
const Carousel = () => {
  // ...
  useEffect(() => {
    const interval = setInterval(handleNext, 3000);

    return () => clearInterval(interval);
  }, []);

  // rest of the code
};

export default Carousel;
```

Let's commit the new changes:

```bash
git add -A
git commit -m "Added side effect in carousel component"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/45b7f03a9394327849fb6a19827e477883eaa5ae).
