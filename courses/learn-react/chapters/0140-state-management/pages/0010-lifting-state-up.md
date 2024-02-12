In the [State and event handling](https://courses.bigbinaryacademy.com/learn-react/#state-and-event-handling) section, we learned the concept of state to manage data associated with a component. We have also used states in multiple places across our application to render components with dynamic data.

So far, the usage of state has been confined to the component in which it was declared. As the application grows, we will encounter scenarios where components need to share some states for rendering UI. In this module on state management, we will learn various techniques to share states between components by adding a feature to enable users to add products to their carts.

Let's get started by adding a button to add and remove products in the cart from the product listing page:

<image>add-to-cart-button.gif</image>

We can achieve this by creating a component named `AddToCart` that renders a button and toggles a state `isInCart` on button click, as shown:

```jsx
// src/components/ProductList/AddToCart.jsx

import { useState } from "react";

import { Button } from "neetoui";

const AddToCart = () => {
  const [isInCart, setIsInCart] = useState(false);

  const handleClick = () => {
    setIsInCart(prevValue => !prevValue);
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

Add the `AddToCart` button to the end of the `ProductListItem` component:

```jsx {1, 10}
import AddToCart from "components/AddToCart";
// remaining imports

const ProductListItem = ({ imageUrl, name, offerPrice, slug }) => (
  <Link
    className="neeto-ui-border-black neeto-ui-rounded-xl flex w-48 flex-col items-center justify-between border p-4"
    to={buildUrl(routes.products.show, { slug })}
  >
    {/* remaining JSX */}
    <AddToCart />
  </Link>
);
```

Since the `AddToCart` button comes inside the `<Link>` component, clicking the button would take us to the product page. To avoid this, we can prevent the default navigation behaviour of the button and stop the click event from propagating to the `<Link>` component, by using [preventDefault](https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault) and [stopPropagation](https://developer.mozilla.org/en-US/docs/Web/API/Event/stopPropagation) methods on the event object:

```js
// AddToCart.jsx

const handleClick = e => {
  e.stopPropagation();
  e.preventDefault();
  setIsInCart(prevValue => !prevValue);
};
```

Now, the button would work as expected, toggling the button texts on click event.

Next, we will show the count of products added to the cart in the header as shown:

<image>cartItems-count.png</image>

To achieve this, one might consider adding a state in the `Header` component to track the cart items count and update it whenever the user interacts with the `AddToCart` button. However, React follows a unidirectional data flow, allowing data to pass only from a parent component to a child component as `props`. Looking at the component tree containing these components, you can understand that the `Header` component and the `AddToCart` component lack a parent-child relationship.

<image>product-list-component-tree.jpeg</image>

To address this challenge, we'll employ a common pattern in React known as **Lifting state up**. In React, when a state needs to be shared among components, we lift the state to their closest common ancestor.

In this scenario, both the `Header` and `AddToCart` components require access to data related to products in the cart. To facilitate data sharing between these components, we'll create a state inside their common ancestor—the `ProductList` component.

Instead of keeping track of the number of items in the cart in the state, we will store the slugs of cart items. This approach will make it easier to monitor the items added to the cart when we need to buy them in future.

Let's see this in action.

First, create a state `cartItems` to store the slugs of cart items in the `ProductList` component:

```jsx
const ProductList = () => {
  const [cartItems, setCartItems] = useState([]);

  // ... rest of the code
};
```

Since the `Header` component only needs to know the count of cart items, we can pass the length of the `cartItems` state as a prop:

```jsx {4}
// ProductList/index.jsx

<Header
  cartItemsCount={cartItems.length}
  shouldShowBackButton={false}
  title="Smile Cart"
  actionBlock={
    <Input
      placeholder="Search products"
      prefix={<Search />}
      type="search"
      value={searchKey}
      onChange={e => setSearchKey(e.target.value)}
    />
  }
/>
```

Inside the `Header` component, we can display the `cartItemsCount` beside a cart icon in top right corner. To incorporate the cart icon from `react-icons`, first, run:

```bash
yarn add react-icons@4.10.1
```
Then make changes to the `Header` component as follows:

```jsx {1, 8, 15-22}
import { AiOutlineShoppingCart } from "react-icons/ai";
// rest of the imports

const Header = ({
  title,
  actionBlock,
  shouldShowBackButton = true,
  cartItemsCount,
}) => (
  <div className="m-2">
    <div className="mx-6 mb-2 mt-6 flex items-end justify-between">
      {/* rest of the JSX */}
      <div className="flex items-end space-x-4">
        {actionBlock}
        <div className="flex flex-col">
          {cartItemsCount > 0 && (
            <span className="neeto-ui-border-black neeto-ui-rounded-full min-w-fit flex h-5 w-5 items-center self-end border p-1">
              {cartItemsCount}
            </span>
          )}
          <AiOutlineShoppingCart size="2rem" />
        </div>
      </div>
    </div>
    <hr className="neeto-ui-bg-black h-1" />
  </div>
);
```

Next, we will pass a boolean prop called `isInCart` from the `ProductList` component to the `AddToCart` component through the `ProductListItem` component. This prop will indicate whether a product has been added to the cart.

```jsx {8}
// ProductList/index.js

<div className="grid grid-cols-2 justify-items-center gap-y-8 p-4 md:grid-cols-3 lg:grid-cols-4">
  {products.map(product => (
    <ProductListItem
      key={product.slug}
      {...product}
      isInCart={cartItems.includes(product.slug)}
    />
  ))}
</div>
```

We can then define a function, `toggleIsInCart`, within the `ProductList` component. This function will add and remove items from the cart based on whether the product is already present.

```jsx
const toggleIsInCart = slug =>
  setCartItems(prevCartItems =>
    prevCartItems.includes(slug)
      ? without([slug], cartItems)
      : [slug, ...cartItems]
  );
```

Rather than directly passing the `toggleIsInCart` function to the `ProductListItem`, we'll pass an anonymous function, which in turn calls the `toggleIsInCart` function with the corresponding product slug. This approach avoids passing the `slug` prop to the `AddToCart` component:

```jsx {9}
// ProductList/index.js

<div className="grid grid-cols-2 justify-items-center gap-y-8 p-4 md:grid-cols-3 lg:grid-cols-4">
  {products.map(product => (
    <ProductListItem
      key={product.slug}
      {...product}
      isInCart={cartItems.includes(product.slug)}
      toggleIsInCart={() => toggleIsInCart(product.slug)}
    />
  ))}
</div>
```

Now, pass down the `isInCart` and `toggleIsInCart` props to the `AddToCart` component from `ProductListItem`:

```jsx {5-6, 14}
const ProductListItem = ({
  imageUrl,
  name,
  offerPrice,
  isInCart,
  toggleIsInCart,
  slug,
}) => (
  <Link
    className="neeto-ui-border-black neeto-ui-rounded-xl flex w-48 flex-col items-center justify-between border p-4"
    to={buildUrl(routes.products.show, { slug })}
  >
    {/* remaining JSX */}
    <AddToCart {...{ isInCart, toggleIsInCart }} />
  </Link>
);
```

At last, we can remove the state in the `AddToCart` component and use the props passed via `ProductListItem`:

```jsx {1, 5, 10}
const AddToCart = ({ isInCart, toggleIsInCart }) => {
  const handleClick = e => {
    e.stopPropagation();
    e.preventDefault();
    toggleIsInCart();
  };

  return (
    <Button
      label={isInCart ? "Remove from cart" : "Add to cart"}
      size="large"
      onClick={handleClick}
    />
  );
};
```

With these changes, you'll notice that the cart items count in the header dynamically updates as you add or remove items from the cart.

<image>cartItems-count-click.gif</image>

The below diagram illustrates the flow of `props` from the `ProductList` component to the `Header` and `AddToCart` components:

<image>lifting-state-up.jpeg</image>

While lifting state to share states between components, you may encounter situations where you want to pass props through numerous layers of components, even though the intermediate components don't have any use with them. This scenario, termed prop drilling, hampers the readability and maintainability of the code. In the next couple of lessons, we'll explore strategies to address prop drilling.

Let's commit the new changes:

```bash
git add -A
git commit -m "Added feature to add products to cart"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/f21dd38a33361429b454d9167af4bb3df49f19bf).
