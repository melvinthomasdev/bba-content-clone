In the previous lesson, we added side effects to the `Carousel` component, allowing it to automatically change the product images after a 3-second time interval. However, you may have noticed that if you click on the carousel arrows or dots to change the image in-between transitions, the next image appears too quickly.

<image>carousel-without-ref-hook.gif</image>

This issue occurs because the previous timer isn't cleared when manually changing the image. Currently, the timer ID is accessible only inside the `useEffect` hook. But we need to access it from `handleNext` and `handlePrevious` functions to clear it. Storing the timer ID in a React state would cause the component to re-render every time the timer ID changes, which is unnecessary. We can't store it in a local variable either because it will get reset during rerenders.

Instead, we can use a `Ref` to store the reference to the previous timer ID. `Ref` is a mechanism to store mutable values that persist across renders without causing re-renders.

Here is a table pointing out the differences in data persistence and re-rendering among local variables, state, and ref.

|                | Cause re-rendering | Persist between re-renders |
| -------------- | ------------------ | -------------------------- |
| Local variable | no                 | no                         |
| State          | yes                | yes                        |
| Ref            | no                 | yes                        |

Now, let's see how we can use `Ref` to reset the timer. To make use of `Ref` we will use the `useRef` hook.

Here is the syntax for using the `useRef` hook:

```jsx
const ref = useRef(initialValue);
```

It accepts an initial value and returns an object with a `current` property, initialized to the `initialValue`. The `ref.current` property can be used to access and manipulate the referenced value.

Now, let's see how we can use `useRef` hook in our `Carousel.jsx` file.

First, let's initialize the `useRef` hook with a `null` value to indicate that the reference is initially unassigned.

```jsx
const timerRef = useRef(null);
```

To store the timer reference, we can utilize the `timerRef.current` property. This allows us to access and manipulate the timer reference outside of the `useEffect` hook.

```jsx {11-13}
import { useState, useEffect, useRef } from "react";
// ...

const Carousel = () => {
  // ...
  const timerRef = useRef(null);

  // ...

  useEffect(() => {
    timerRef.current = setInterval(handleNext, 3000);

    return () => clearInterval(timerRef.current);
  }, []);

  // rest of the code
};
```

Next, we will create a function that will clear the previous timer and create a new interval timer that calls the next image every `3000` milliseconds. We can utilize this function whenever the user manually navigates through the images.

```jsx {7-10}
import { useState, useEffect, useRef } from "react";
// ...

const Carousel = () => {
  // ...

  const resetTimer = () => {
    clearInterval(timerRef.current);
    timerRef.current = setInterval(handleNext, 3000);
  };

  // rest of the code
};
```

Let's call this `resetTimer` function on manually changing the image.

```jsx {8, 21, 32}
// ...

const Carousel = () => {
  // ...

  const handlePrevious = () => {
    // ...
    resetTimer();
  };

  // ...

  return (
    <div className="flex flex-col items-center">
      {/* rest of the code */}

      <Button
        // ...
        onClick={() => {
          handleNext();
          resetTimer();
        }}
      />
      {/* rest of the code */}

      <div className="flex space-x-1">
        {images.map((_, index) => (
          <span
            // ...
            onClick={() => {
              setCurrentIndex(index);
              resetTimer();
            }}
          />
        ))}
      </div>
    </div>
  );
};
```

This is how the image transition works after integrating `Ref`:

<image>carousel-with-ref-hook.gif</image>

Let's commit the new changes:

```bash
git add -A
git commit -m "Integrated Ref to the Carousel component"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/403b2520cbacca5d6242ad1fa6981deefead52e3).

### Accessing DOM nodes using Ref

Since React automatically updates the DOM to match your render output, your components won’t often need to access or manipulate the DOM directly. However, sometimes you might need access to the DOM elements to perform actions on them like focusing on an element, scrolling to it, etc. We can't store the reference of a React component and perform such operations on it. To solve this problem, React allows utilizing the `useRef` hook to reference a DOM node from React components without querying the `document`.

Let's see with an example how we can use ref to focus a text input.

<codeblock language="reactjs" type="lesson">
<code>
import { useEffect, useRef } from "react";

const App = () => {
  const autoInputRef = useRef(null);
  const manualInputRef = useRef(null);

  const handleClick = () => {
    manualInputRef.current.focus();
  };

  useEffect(() => autoInputRef.current.focus(), []);

  return (
    <>
      <input ref={autoInputRef} />
      <div>
        <input ref={manualInputRef} />
      </div>
      <button onClick={handleClick}>Focus the input</button>
    </>
  );
};

export default App;
</code>
</codeblock>

The DOM node becomes accessible through the ref only after the component has been mounted. To ensure proper access, make sure to reference `ref.current` inside the `useEffect` hook or event listeners.

Keep in mind that, unlike HTML elements, custom components won't natively attach their reference to `ref`. But React offers the function `forwardRef` to help us accept `ref` from custom components. You can learn more about `forwardRef` by referring this [link](https://courses.bigbinaryacademy.com/learn-react/miscellaneous/forward-ref).
