In the last lesson, we learned the concept of lifting state, where we moved a state to the nearest common parent and passed it down via props to share the state between components. However, passing props can become inconvenient, especially when the nearest common ancestor is far removed from the components that need data, and lifting the state that high can lead to a situation called **prop drilling**.

Let's see how we can tackle the issue of prop drilling through an example.

At present, we can only add products to the cart from the product listing page. As the next step, consider adding this feature to the product details page. To make this possible, we can include the `AddToCart` component in the `Product` component. This will require us to lift the `cartItems` state to the `App` component so that the `Header` and `AddToCart` components within the `Product` component can also access the necessary props.

In this scenario, we'll have to pass the props from the `App` component through the component chain to reach the `Header` and `AddToCart` components, even though the intermediate components have no use of these props:

<image>global-state-management.jpeg</image>

React provides a feature called **context** to avoid this hassle of prop drilling. Context lets the parent component make some information available to any component in the tree below it, no matter how deep, without passing it explicitly through props.

Let's understand the usage of context by adding the add-to-cart feature to the product details page.

As the first step, we will create a context for the `cartItems`. Create a file `CartItemsContext.js` inside the `src/contexts` directory:

```bash
mkdir src/contexts
touch src/contexts/CartItemsContext.js
```

Inside this file, we will create and export a context named `CartItemsContext` using the `createContext` function from React. The `createContext` function returns a context object:

```js
import { createContext } from "react";

const CartItemsContext = createContext();

export default CartItemsContext;
```

In the `App` component, we can create the `cartItems` state and make it accessible throughout the application by wrapping the components with `Provider` from the context. The `Provider` component accepts a `value` prop to specify the value of this context for all components inside it:

```jsx {1, 3, 7, 10, 14}
import { useState } from "react";

import CartItemsContext from "./contexts/CartItemsContext";
// remaining imports

const App = () => {
  const [cartItems, setCartItems] = useState([]);

  return (
    <CartItemsContext.Provider value={[cartItems, setCartItems]}>
      <Switch>{/* Routes */}</Switch>
    </CartItemsContext.Provider>
  );
};
```

The value we passed to the context provider will be available to any component that comes under the context provider in the component hierarchy.

Now, we can use the `cartItems` state and `setCartItems` function from any component in our application using the `useContext` hook from React. The `useContext` hook accepts the context object as the argument and returns the context value.

Let's remove the `cartItemsCount` prop from the `Header` component. Instead, we can get the `cartItems` from the context and find its length:

```jsx
import CartItemsContext from "src/contexts/CartItemsContext";

const Header = ({ title, actionBlock, shouldShowBackButton = true }) => {
  const [cartItems] = useContext(CartItemsContext);
  const cartItemsCount = cartItems.length;

  // remaining code
};
```

Next, we can remove the props `isInCart` and `toggleIsInCart` of the `AddToCart` component. Instead, we can pass the `slug` of the product from the `ProductList` and `Product` components to `AddToCart` and use it along with the `CartItemsContext` to check whether a product is in the cart and update the cart accordingly.

```jsx {7-8, 13-17, 22}
import { useContext } from "react";

import CartItemsContext from "src/contexts/CartItemsContext";
import { Button } from "neetoui";
import { without } from "ramda";

const AddToCart = ({ slug }) => {
  const [cartItems, setCartItems] = useContext(CartItemsContext);

  const handleClick = e => {
    e.stopPropagation();
    e.preventDefault();
    setCartItems(prevCartItems =>
      prevCartItems.includes(slug)
        ? without([slug], cartItems)
        : [slug, ...cartItems]
    );
  };

  return (
    <Button
      label={cartItems.includes(slug) ? "Remove from cart" : "Add to cart"}
      size="large"
      onClick={handleClick}
    />
  );
};

export default AddToCart;
```

Now, you can remove the `cartItems` state from the `ProductList` component. Also, remove the `toggleIsInCart` function and all its usages along with the usages of the `isInCart` prop. You can use the `AddToCart` component within the `ProductListItem` and `Product` components by passing the slug. Since the prop and its value has the same name, we can use the spread syntax mentioned in [this lesson](https://courses.bigbinaryacademy.com/learn-react/props/spread-props) to pass the `slug` prop.

```jsx
<AddToCart {...{ slug }} />
```

After making the above changes, you should be able to add and remove a product from the product listing and product details page without prop drilling:

<image>add-to-cart-product-page.gif</image>

Since the `AddToCart` component is now used by both the `ProductListItem` and `Product` components, let's move the `AddToCart` component to the `commons` directory:

```bash
mv src/components/ProductList/AddToCart.jsx src/components/commons/AddToCart.jsx
```

Make sure to update the imports. Let's commit the new changes:

```bash
git add -A
git commit -m "Added add to cart feature on the product details page"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/1fccd669fb5a94c9ba8c1246db34f9394a23c501).
