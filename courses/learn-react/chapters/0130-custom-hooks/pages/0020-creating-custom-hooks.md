In the previous lesson, we implemented search functionality on the product listing page. However, this implementation has a significant drawback. An API request is sent for each keystroke in the search input.

<image>request-trigger-for-each-keystroke.gif</image>

Making an API request for every keystroke can overload the server and slow down the application. Additionally, another issue arises when multiple API requests are triggered one after the other with each keystroke. If the first request takes longer to process and is served after the second one, the user might end up interacting with inaccurate or outdated data.

To fix this issue we will use a debouncing. Debouncing is a technique where frequent execution of a function is prevented by delaying it for some time. All invocations except the last one will be ignored.

In our case, we can use debouncing to ensure that the search request to a server is only sent after a certain time interval has passed after the user stops typing. This prevents sending a request for each keystroke.

We will be creating a custom React Hook for implementing `Debouncing`. As we already learned, hooks in React are functions that enable you to utilize React's state and lifecycle features. Custom hooks are reusable functions that utilize one or more built-in React hooks such as `useState`, `useEffect`, `useMemo`, `useContext` etc.

The main reason for which you should be using custom hooks is to maintain the concept of DRY(Don’t Repeat Yourself). For example, suppose you have some logic that makes use of some built-in hooks and you need to use the logic in multiple components. In such cases, the most efficient approach is to encapsulate this logic within a custom hook and then invoke it from those components.

It is very important to always prefix custom hooks with the `use` keyword, followed by the name of the hook we are making. If a function doesn't start with the `use` keyword, it won't be considered as a custom hook. Also, it can't call other hooks inside it.

We will create a custom hook called `useDebounce`. It will accept an argument `value`, which is the user search input. It will debounce the changes and keep returning the previous `value` till the user stops typing. In short, we will use it as follows:

```jsx{3}
const ProductList = () => {
  const [searchKey, setSearchKey] = useState("");
  const debouncedSearchKey = useDebounce(searchKey);

  // ...

  return (
    // ...
    <Input
      placeHolder="search"
      value={searchKey}
      onChange={e => setSearchKey(e.target.value)}
    />
    // ...
  );
};
```

To get started let's create `useDebounce.js` file. At BigBinary, we follow the convention of placing this file within the `src/hooks` folder.

> Note: Ensure that you are in the project root before running the below command.

```bash
mkdir src/hooks
touch src/hooks/useDebounce.js
```

### Define the useDebounce custom hook

Inside the `useDebounce.js` file, define a hook called `useDebounce`, which takes `value` as a parameter. Within this hook, we will create a state variable called `debouncedValue`, to hold the debounced value. Also, we will initialize this state with the `value` argument.

```js
import { useState } from "react";

const useDebounce = value => {
  const [debouncedValue, setDebouncedValue] = useState(value);
};
```

We will use the `useEffect` hook to implement the debouncing effect. Inside the `useEffect` hook, we will create a timer that updates the `debouncedValue` state with the current `value` passed as an argument after a delay of `350` milliseconds. We will implement the timer using the `setTimeout` method.

```js
useEffect(() => {
  const timerId = setTimeout(() => {
    setDebouncedValue(value);
  }, 350);
}, [value]);
```

To cancel the previous timer if the `value` changes before the timer elapses, we'll define a cleanup function using the `clearTimeout` method.

```js {11-16}
import { useState, useEffect } from "react";

const useDebounce = value => {
  const [debouncedValue, setDebouncedValue] = useState(value);

  useEffect(() => {
    const timerId = setTimeout(() => {
      setDebouncedValue(value);
    }, 350);

    return () => {
      clearTimeout(timerId);
    };
  }, [value]);

  return debouncedValue;
};

export default useDebounce;
```

When the user's input value changes, the component re-renders, causing the custom hook to be called again. This time, the `value` passed to the hook is different. Since the `useEffect` inside the hook depends on this value, it will re-run. As we have learned earlier, it will call the cleanup function for the previous render before re-running. Effectively, when the user keeps typing, this hook will keep clearing the previous timer and registering the new timer.

Now, let's go to the `ProductList/index.jsx` file to implement a debounced search using the `useDebounce` hook.

First, let's set up the `useDebounce` hook by passing `searchKey` as its argument. We will store the debounced value in a variable called `debouncedSearchKey`. We will then pass this `debouncedSearchKey` as the value to the `searchTerm` parameter of the products API.

```jsx {7,11-12}
import useDebounce from "hooks/useDebounce";
// ...

const ProductList = () => {
  // ...

  const debouncedSearchKey = useDebounce(searchKey);

  const fetchProducts = async () => {
    try {
      const data = await productsApi.fetch({
        searchTerm: debouncedSearchKey,
      });
    }
    // ...
  };

  //rest of the code
};
```

Next, we will change the dependency of the `useEffect` from `searchKey` to `debouncedSearchKey` to ensure that the `fetchProducts` function will be called only when there's a change in `debouncedSearchKey`.

```jsx {13-15}
import useDebounce from "hooks/useDebounce";
// ...

const ProductList = () => {
  // ...

  const debouncedSearchKey = useDebounce(searchKey);

  const fetchProducts = async () => {
    // ...
  };

  useEffect(() => {
    fetchProducts();
  }, [debouncedSearchKey]);

  //rest of the code
};
```

Now, you may notice that network requests are not triggered with every keystroke, instead fetching will only occur when the user pauses typing for at least 350 milliseconds.

<image>products-search-with-debouncing.gif</image>

Let's commit the new changes:

```bash
git add -A
git commit -m "Created custom hook for debouncing"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/ffd1f07970a18da27460858db14bc90258260e60).
