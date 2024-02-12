In the previous lesson, we learned that setting a state variable triggers re-rendering. However, there is a nuance to this process. React doesn't update the state variable and re-render the component immediately after calling the state setter function. Instead, it waits until all the code in the event handlers has run before processing your state updates. To grasp this concept, let's insert a console log statement to record the `currentIndex` right after the `setCurrentIndex` call within the `handleNext` function:

```jsx {7}
const Carousel = ({ imageUrls, title }) => {
  const [currentIndex, setCurrentIndex] = useState(0);

  const handleNext = () => {
    const nextIndex = (currentIndex + 1) % imageUrls.length;
    setCurrentIndex(nextIndex);
    console.log(currentIndex);
  }
  // remaining code
}
```

What value do you expect to see in the console when you click the right arrow button for the first time?

When we create the state variable, it gets initialized to `0`. Then, we click the "next" button, and the image gets updated. But the console logs `0` as the `currentIndex` value. Why?

As discussed earlier, state updates in React are not immediate. When we click the "next" button, React calls the `handleNext` event handler. It calculates the `nextIndex` and passes it to the `setCurrentIndex` function. React then queues the state update for the `currentIndex` state with the value of `nextIndex` and continues executing the remaining code in the `handleNext` event handler. Consequently, it logs the current value of `currentIndex` into the console. Since the state update hasn't occurred yet, the component hasn't re-rendered, and the `currentIndex` retains the value of `0`. Once this value is logged into the console, all the code inside the event handler has finished executing. Now, React updates the state `currentIndex` and triggers a re-render of the component.

You might be wondering why React follows this approach. To understand this, let's delve into the scenario where state updates are synchronous.

Consider a component with the following event handler that updates three state variables:

```js
const handleUpdate = () => {
  setFirstName("John");
  setLastName("Doe");
  setAge(30);
}
```

When `handleUpdate` is called, the `setFirstName` function updates the `firstName` state, triggering a re-render of the component. This cycle repeats for `setLastName` and `setAge`, resulting in three consecutive re-renders. In the synchronous state update scenario, React has performed three times the work compared to the asynchronous case we discussed earlier. Moreover, it could lead to an inconsistent UI, as each update would be "half-finished," with only some variables reflecting the new values. For instance, after the `setFirstName` call, only the `firstName` is updated, leaving the remaining state variables with stale values.

To prevent such "half-finished" and unnecessary re-renders, React batches state updates.

## Updating state based on previous state

Due to the aforementioned asynchronous nature, multiple state updates within an event handler don't accumulate the state changes. In the event handler below, despite calling `setCurrentIndex` three times, only the last state update takes effect, resulting in the `currentIndex` being incremented only once.

```js
const handleNavigateToLastImage = () => {
  setCurrentIndex(currentIndex + 1);
  setCurrentIndex(currentIndex + 1);
  setCurrentIndex(currentIndex + 1);
}
```

To address such scenarios, React provides an option to supply a callback function to the state setter function, which calculates the next state value based on the previous state value in the queue:

```js
const handleNext = () => {
  setCurrentIndex(prevIndex => prevIndex + 1);
  setCurrentIndex(prevIndex => prevIndex + 1);
  setCurrentIndex(prevIndex => prevIndex + 1);
}
```

Here, instead of passing the new value of the `currentIndex` variable, we pass a function that calculates the next state value. This function is referred to as the **updater function**. When we use this function with the state setter function, it queues the updater function to be processed later. React calculates the next state value by providing the latest value of the state variable from the queue to the updater function:

<image>queued-updates.jpg</image>

We prefer passing callback functions to update states whenever the new state value depends on its previous value. This practice ensures the reliability and correctness of state transitions.

Now, let's update the event handlers `handleNext` and `handlePrevious` by supplying an updater function to the `setCurrentIndex` function.

```jsx
const handleNext = () =>
  setCurrentIndex(prevIndex => (prevIndex + 1) % imageUrls.length);

const handlePrevious = () =>
  setCurrentIndex(
    prevIndex => (prevIndex - 1 + imageUrls.length) % imageUrls.length
  );
```

Let's commit the above change:

```bash
git add -A
git commit -m "Utilized updater function to set state values"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/19a58662ef15e6812bcfd6fc59fc2496c51c7edf).

## Initializer Function

Similar to how we can pass a function to the state setter function, we can also pass a function to the `useState` hook to initialize state variables. React will call this function on the first render to calculate the initial value. This state initialization approach is particularly useful when we have an expensive operation to calculate the initial state value.

Consider an example in which we filter a huge list of orders to initialize a state `deliveredOrders`:

```jsx
const [deliveredOrders, setDeliveredOrders] = useState(
  LARGE_NUMBER_OF_ORDERS.filter(order => order.isDelivered)
);
```

If we pass the filtered value to the `useState` hook, as shown above, the filtering logic will execute during every render on invoking the component function. However, React requires this value only for the component's first render.

Instead, we can pass a function that returns this filtered list to the `useState` hook:

```jsx
const [deliveredOrders, setDeliveredOrders] = useState(() =>
  LARGE_NUMBER_OF_ORDERS.filter(order => order.isDelivered)
);
```

On the very first render, React will call this function to calculate the initial value. On subsequent renders, React ignores the function since the initial value is already calculated.
