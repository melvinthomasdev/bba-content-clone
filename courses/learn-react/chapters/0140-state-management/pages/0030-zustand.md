In the previous lesson, we saw how we can pass values several levels deep using context without passing them as props through each component in the hierarchy. With context provider, we can wrap a part of the component tree to pass a value to its descendants, and this value can be consumed by any of the descendants of the provider using the `useContext` hook.

We have used the context in the previous lesson to share the `cartItems` state between `Header` and `AddToCart` component. However, this implementation has a significant drawback. Whenever a state updates, the component containing that state and its children will get re-rendered. Therefore, if we use a state inside the `App` component the entire application will get re-rendered whenever the state changes. Whereas, we only need to update the UI of `Header` component and the `AddToCart` component corresponding to the product added or removed.

In addition to this, when we use context to manage a state, any component that consumes a context will re-render whenever the context value changes. This behaviour might lead to unnecessary re-renders when the state managed by the context API is a complex value. For example, consider that our state is a deeply nested object as shown below:

```js
const user = {
  name: "John Doe",
  contact: {
    phone: "12345",
    email: "john@example.com",
    address: {
      street: "Second street",
    }
  }
  teams: [ { name: "Engineering", role: "Developer" }, { name: "UI", role: "Designer" } ]
}
```

The above `user` state is used by two components `Teams` and `Profile`, where the `Teams` component is only concerned with the `teams` property and the `Profile` component is concerned with `name` and `contact` properties:

```jsx
const Teams = () => {
  const { teams } = useContext(UserContext);
  // ...
};

const Profile = () => {
  const { name, contact } = useContext(UserContext);
  // ...
};
```

Consider that we are updating the `contact.address.street` path of the `user` object from the `Profile` component. In this case, even though the `Teams` component only uses the `teams` property of the `user` object, it will get re-rendered along with the `Profile` component, which is not a desired behaviour.

Since such unnecessary re-rendering affects the application performance, we use a third-party library called `Zustand` to efficiently handle state management at BigBinary. Zustand allows us to create a centralized state as **stores** which can be accessed anywhere in our application, without wrapping components using provider. Zustand also enables components to listen to changes in specific properties and re-render only when that specific property changes.

Let's learn how to use Zustand by replacing the usage of React Context API with Zustand to implement the add-to-cart feature.

First of all, install Zustand by the running the command below:

```bash
yarn add zustand@4.3.2
```

As specified earlier, states are managed as stores in Zustand. Zustand store acts as a global state that is accessible throughout the application. It returns a hook using which you can access values within the store.

Let's add a store for the `cartItems` by creating a hook named `useCartItemsStore`. We keep all our stores in the `src/stores` directory. Run the below command to create this hook:

```bash
mkdir src/stores
touch src/stores/useCartItemsStore.js
```

Zustand provides the `create` function to create a store. The `create` function accepts a callback function as the argument. This callback function should return the initial value of the state.

In our case, we will create our state as an object containing the keys `cartItems` and `toggleIsInCart`, where the `cartItems` will store the slugs of products in the cart and `toggleIsInCart` will be a function that updates the `cartItems` array by adding or removing the given slug. We will pass an empty array as the initial value of the `cartItems` key.

```js
import { create } from "zustand";

const useCartItemsStore = create(() => ({
  cartItems: [],
  toggleIsInCart: slug => {
    /* add or remove the slug to cartItems */
  },
}));

export default useCartItemsStore;
```

The callback function we passed to the `create` function receives two functions `set` and `get` as the arguments.

The `set` function is used to update the state in the store. It works similarly to the state setter function but offers the convenience of merging state updates. Instead of explicitly spreading the entire state, we can directly provide the updated key and its value:

```js
// No need to spread the state.
set(state => ({ ...state, count: state.count + 1 }));

/* Set function merges the updated key
and value with the current state. */
set(state => ({ count: state.count + 1 }));
```

The `get` function retrieves the current state value. In our case, we are solely interested in the `set` function.

We will utilize the `set` function to update `cartItems` within the `toggleIsInCart` function. Since the `set` function receives the complete state, we will destructure the `cartItems`.

```js {4, 6-13}
import { without } from "ramda";
import { create } from "zustand";

const useCartItemsStore = create(set => ({
  cartItems: [],
  toggleIsInCart: slug =>
    set(({ cartItems }) => {
      if (cartItems.includes(slug)) {
        return { cartItems: without([slug], cartItems) };
      }

      return { cartItems: [slug, ...cartItems] };
    }),
}));

export default useCartItemsStore;
```

The `create` function returns a hook, which acts as an interface for retrieving values from the store. Using the `useCartItemsStore` hook, you can easily access the latest `cartItems` array and the reference to the `toggleIsInCart` function to update it.

```js
const { cartItems, toggleIsInCart } = useCartItemsStore();
```

Despite being a hook, `useCartItemsStore` comes with a set of APIs, allowing us to utilize the store beyond components and hooks. This additional capability is a notable advantage provided by Zustand. Later in this module, we'll see an example demonstrating how to leverage these APIs for external usage.

Now, let's make use of the `useCartItemsStore` store in our `Header` component to derive the cart items count.

First, we can remove the `useContext` hook usage for getting the cart items count:

```js
const [cartItems] = useContext(CartItemsContext);
const cartItemsCount = cartItems.length;
```

By calling the `useCartItemsStore`, we will get the `cartItems` state, which can be used to derive the `cartItemsCount`:

```js
const { cartItems } = useCartItemsStore();
const cartItemsCount = cartItems.length;
```

However, to truly leverage the performance benefits of Zustand, we should use the store by passing a selector function as the first argument to the hook. The selector function allows you to retrieve only the necessary data from Zustand store. In the case of the `Header` component, it only needs to be aware of the cart items count. We can achieve this by passing a selector function as shown:

```js
const cartItemsCount = useCartItemsStore(store => store.cartItems.length);
```

Passing the selector function informs Zustand about what each component is concerned with. When the cart items store updates, Zustand notifies the components using the store. Subsequently, it invokes the selector function to obtain the new value required by the component. It then compares this new value with the previous one using `Object.is` method and re-renders the component only if there is a change. In the case of the `Header` component, the component will only re-render when the `cartItems.length` changes. Therefore, it is essential to use the store with the selector function to extract only the required data from the store, thereby avoiding unnecessary re-renders of components.

Let's substitute the `useContext` hook with the `useCartItemsStore` in the `AddToCart` component as well. The `AddToCart` component is focused on determining whether a product is in the cart and is also concerned with updating the `cartItems` array. We can integrate this logic within the selector function:

```jsx {2, 5-8, 13, 18}
import { Button } from "neetoui";
import useCartItemsStore from "stores/useCartItemsStore";

const AddToCart = ({ slug }) => {
  const { isInCart, toggleIsInCart } = useCartItemsStore(store => ({
    isInCart: store.cartItems.includes(slug),
    toggleIsInCart: store.toggleIsInCart,
  }));

  const handleClick = e => {
    e.stopPropagation();
    e.preventDefault();
    toggleIsInCart(slug);
  };

  return (
    <Button
      label={isInCart ? "Remove from cart" : "Add to cart"}
      size="large"
      onClick={handleClick}
    />
  );
};

export default AddToCart;
```

However, there is one issue with the above implementation. Since the value returned by the selector function is an object generated from the store value, its reference will be different each time the selector function is invoked. As a result, the component will get re-rendered even if the values of `isInCart` and `toggleIsInCart` remain the same.

To address this issue, the Zustand store hook also accepts a comparator function, allowing you to specify how to compare the retrieved value from the store. Zustand provides a `shallow` comparator function, which performs a shallow comparison of the properties or elements of the object or array generated using the selector function.

Let's pass the `shallow` comparator as the second argument to the `useCartItemsStore` hook to ensure the component only renders when the reference to `isInCart` or `toggleIsInCart` changes:

```js {1, 7-8}
import { shallow } from "zustand/shallow";

const { isInCart, toggleIsInCart } = useCartItemsStore(
  store => ({
    isInCart: store.cartItems.includes(slug),
    toggleIsInCart: store.toggleIsInCart,
  }),
  shallow
);
```

Now, the `AddToCart` component will only re-render when the slug corresponding to the component is added or removed from the `cartItems` state.

Note that we don’t need to pass a shallow comparator unless the value returned from the function is a generated object/array. If we are returning an already existing reference from the store, we don’t need a shallow comparator.

If you need more control over re-rendering, you can pass a custom equality function as a comparator:

```js
const user = useUserStore(
  store => store.user,
  (oldUser, newUser) => compare(oldUser, newUser)
);
```

Before committing the let's remove the `cartItems` state and context provider from the `App` component. We can also remove the `CartItemsContext.js` file.

Let's commit the new changes:

```bash
git add -A
git commit -m "Replaced CartItemsContext with useCartItemsStore"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/59290fa949a4a940f08632ef4c1faf7f5993548d).

One thing to note is that Zustand is not an alternative to React context. Zustand and React context serve different purposes in managing state in React applications. Zustand is a better option when handling complex state updates with a focus on performance. On the other hand, the React context API might be a better choice for managing simple global states, such as themes or current accounts. In some cases, we may even need to use them together to handle states in our application.
