In this lesson, we will display a cart page when users click the cart icon in the Header. It will display the details of the products users have added to their cart. Along with listing items in the cart, we will also display total price details as shown:

<image>cart-page-requirement.png</image>

Let's get started by creating a `Cart` directory inside the `src/components` directory. We will have an `index.jsx` file as the entry point for the cart page:

```bash
mkdir src/components/Cart
touch src/components/Cart/index.jsx
```

First, let's define the `Cart` component by just returning a `Header`:

```jsx
import Header from "components/commons/Header";

const Cart = () => <Header title="My Cart" />;

export default Cart;
```

Next, we will add a route for the cart page. To start, let's include an entry for the `/cart` path in the `routes.js` file:

```js
const routes = {
  // remaining routes...
  cart: "/cart",
};
```

In the `App` component we will add a `Route` component for the cart page:

```jsx
// App.jsx
<Route exact component={Cart} path={routes.cart} />
```

Add a link to the cart page from the cart icon in the header by wrapping it with a `Link` component:

```jsx
// Header.jsx
<Link to={routes.cart}>
  <AiOutlineShoppingCart size="2rem" />
</Link>
```

Now, clicking the cart icon will take you to the cart page:

<image>cart-link.gif</image>

The next step is to display the details of cart items. We already have the slugs and quantity of each product added to the cart in the Zustand store. We will need to retrieve more details about each product, such as name and price.

To achieve this, we can get the slugs from the cart items store and then send a request to the product details API to fetch the details of each product using these slugs. We can use the [Promise.all](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all) method to make multiple parallel requests to the product details API for the product slugs in the cart.

```jsx
import { useEffect } from "react";

import productsApi from "apis/products";
import Header from "components/commons/Header";
import { keys } from "ramda";
import useCartItemsStore from "stores/useCartItemsStore";
import { shallow } from "zustand/shallow";

const Cart = () => {
  const slugs = useCartItemsStore(store => keys(store.cartItems), shallow);

  const fetchCartProducts = async () => {
    try {
      const responses = await Promise.all(
        slugs.map(slug => productsApi.show(slug))
      );

      console.log(responses);
    } catch (error) {
      console.log("An error occurred:", error);
    }
  };

  useEffect(() => {
    fetchCartProducts();
  }, []);

  return <Header title="My Cart" />;
};

export default Cart;
```

The `productsApi.show` method returns a Promise. We have mapped the slugs array to create an array of promises, each corresponding to the request for the product details of a slug. These promises are then passed to the `Promise.all` method. The `Promise.all` method itself returns a promise. If all the requests are successful, this promise returns an array of responses for the requests. It rejects if any of the input promises reject, providing the first rejection reason. In this context, the responses will form an array of products corresponding to the slugs.

<image>promise-all-responses.png</image>

Now that we have the product details, let's create a state to store this details. We will also create a state to handle the loading state.

```jsx {1-2, 10, 13-15}
const [products, setProducts] = useState([]);
const [isLoading, setIsLoading] = useState(true);

const fetchCartProducts = async () => {
  try {
    const responses = await Promise.all(
      slugs.map(slug => productsApi.show(slug))
    );

    setProducts(responses);
  } catch (error) {
    console.log("An error occurred:", error);
  } finally {
    setIsLoading(false);
  }
};
```

We will add early returns in our `Cart` component to display a page loader when the product data is being fetched and to show a no data page when there are no items in the cart:

```jsx
if (isLoading) return <PageLoader />;

if (isEmpty(products)) {
  return (
    <>
      <Header title="My Cart" />
      <div className="flex h-screen items-center justify-center">
        <NoData title="Your cart is empty!" />
      </div>
    </>
  );
}
```

Now, let's create a `ProductCard` component to define the JSX for displaying the product details. It should include the name, image, MRP, offer price, and an option to update the product quantity:

```jsx
import ProductQuantity from "components/commons/ProductQuantity";
import { Typography } from "neetoui";

const ProductCard = ({
  slug,
  imageUrl,
  offerPrice,
  mrp,
  name,
  availableQuantity,
}) => (
  <div className="neeto-ui-rounded neeto-ui-border-black border p-2">
    <div className="flex w-full items-center space-x-5">
      <img alt={name} height={80} src={imageUrl} width={80} />
      <div className="flex-grow space-y-1">
        <Typography className="mb-2" style="h4" weight="bold">
          {name}
        </Typography>
        <Typography style="body2">MRP: ${mrp}</Typography>
        <Typography style="body2">Offer price: ${offerPrice}</Typography>
      </div>
      <ProductQuantity {...{ availableQuantity, slug }} />
    </div>
  </div>
);

export default ProductCard;
```

Let's map the `products` data over the `ProductCard` component from the `Cart` component to display the cart items:

```jsx
const Cart = () => {
  // remaining  code

  return (
    <>
      <Header title="My Cart" />
      <div className="mt-10 flex justify-center space-x-10">
        <div className="w-1/3 space-y-5">
          {products.map(product => (
            <ProductCard key={product.slug} {...product} />
          ))}
        </div>
      </div>
    </>
  );
};
```

Since we are persisting the cart items to local storage, the already added product may no longer be available, or the current number of available stocks may be less than the already selected quantity. Therefore, we should validate these conditions before displaying the cart items to ensure the accuracy of the data.

We will compare the selected quantity of each product in the store with the available quantity from the response. If the available quantity is less than the selected quantity, we will update the selected quantity in the store. For this purpose, we will need both `cartItems` and `setSelectedQuantity` from the store. We were only extracting the slugs from the `cartItems` object. We will replace the previous usage of `useCartItemsStore` to access the entire store.

```js
const { cartItems, setSelectedQuantity } = useCartItemsStore();

const slugs = keys(cartItems);
```

Next, we can iterate over the responses array and set the selected quantity to the available quantity for the products whose stocks have been reduced. If any product in the cart is sold out, we will display a `Toastr` to inform the user that the product is no longer available.

```jsx {9-18}
const fetchCartProducts = async () => {
  try {
    const responses = await Promise.all(
      slugs.map(slug => productsApi.show(slug))
    );

    setProducts(responses);

    responses.forEach(({ availableQuantity, name, slug }) => {
      if (availableQuantity >= cartItems[slug]) return;

      setSelectedQuantity(slug, availableQuantity);
      if (availableQuantity === 0) {
        Toastr.error(
          `${name} is no longer available and has been removed from cart`,
          {
            autoClose: 2000,
          }
        );
      }
    });
  } catch (error) {
    console.log("An error occurred:", error);
  } finally {
    setIsLoading(false);
  }
};
```

Now, when you open the cart page, you'll receive a toastr message if any products added to the cart are sold out:

<image>product-deletion-toastr.png</image>

## Adding feature to remove cart item

Next, we will attach a delete button to the product card so that we can directly delete an item without decreasing its count:

<image>adding-delete-button.png</image>

First let's add a function to the cart items store to remove an item from the `cartItems` object.

```js {1, 8}
import { assoc, dissoc, evolve } from "ramda";
// remaining imports

const useCartItemsStore = create(
  persist(
    set => ({
      // ...
      removeCartItem: slug => set(evolve({ cartItems: dissoc(slug) })),
    }),
    { name: "cart-items-store" }
  )
);
```

We can invoke the above `removeCartItem` function when the user clicks the delete button in the product cart:

```jsx {1, 14, 20-26}
// remaining imports
import { Delete } from "neetoicons";
import { prop } from "ramda";
import useCartItemsStore from "stores/useCartItemsStore";

const ProductCard = ({
  slug,
  imageUrl,
  offerPrice,
  mrp,
  name,
  availableQuantity,
}) => {
  const removeCartItem = useCartItemsStore(prop("removeCartItem"));

  return (
    <div className="neeto-ui-rounded neeto-ui-border-black border p-2">
      <div className="flex w-full items-center space-x-5">
        {/* remaining JSX */}
        <div className="flex items-center space-x-2">
          <ProductQuantity {...{ availableQuantity, slug }} />
          <Delete
            className="cursor-pointer"
            onClick={() => removeCartItem(slug)}
          />
        </div>
      </div>
    </div>
  );
};
```

However, before executing irreversible actions such as deletion or invoking permissions, it's prudent to ask users for confirmation to avoid accidental actions. Therefore, we will show an alert using [Alert](https://neeto-ui.neeto.com/?path=/docs/overlays-alert--docs) component from `neetoUI` as shown:

<image>cart-item-delete-alert.png</image>

We will create a state `shouldShowDeleteAlert` to show an alert when the user clicks a delete button. On confirming the deletion using the submit button, we will call the `removeCartItem` function:

```jsx {9, 21, 23-35}
const ProductCard = ({
  slug,
  imageUrl,
  offerPrice,
  mrp,
  name,
  availableQuantity,
}) => {
  const [shouldShowDeleteAlert, setShouldShowDeleteAlert] = useState(false);

  const removeCartItem = useCartItemsStore(prop("removeCartItem"));

  return (
    <div className="neeto-ui-rounded neeto-ui-border-black border p-2">
      <div className="flex w-full items-center space-x-5">
        {/* remaining JSX */}
        <div className="flex items-center space-x-2">
          <ProductQuantity {...{ availableQuantity, slug }} />
          <Delete
            className="cursor-pointer"
            onClick={() => setShouldShowDeleteAlert(true)}
          />
          <Alert
            isOpen={shouldShowDeleteAlert}
            submitButtonLabel="Yes, remove"
            title="Remove item?"
            message={
              <Typography>
                You are removing <strong>{name}</strong> from cart. Do you want
                to continue?
              </Typography>
            }
            onClose={() => setShouldShowDeleteAlert(false)}
            onSubmit={() => {
              removeCartItem(slug);
              setShouldShowDeleteAlert(false);
            }}
          />
        </div>
      </div>
    </div>
  );
};
```

Confirmation modals should guide the users through decision-making without unnecessary disruption. They should have clear titles, concise bodies, and actions that are predictable and scannable. For detailed guidelines on creating confirmation modals, please refer to [this document](https://witty-tern-16b.notion.site/Confirmation-modal-best-practices-ef707f480cdd42e1bbcd3abea065a0d9), which outlines the practices we follow at BigBinary.

We should include the `cartItems` in the dependency array of the `useEffect` hook to ensure synchronization of the product list with the store:

```js
// Cart/index.jsx

useEffect(() => {
  fetchCartProducts();
}, [cartItems]);
```

## Consolidating cart information

Let's present consolidated information about the items added to the cart, including total MRP, total discounts, the total price to be paid after applying discounts, and the total number of items on the cart page:

<image>price-card.png</image>

The data for each product we receive from the backend contains the MRP and the offer price. We could calculate the total MRP by taking the sum of the MRP of each product multiplied by the quantity of the product in the cart. Similarly, we can calculate the total offer price.

We will create a utility function named `cartTotalOf` in the `src/components/utils.js` file for this:

```bash
touch src/components/utils.js
```

We will define the `cartTotalOf` function to calculate the summation of a particular key in product details. For this, we will pass two arguments: the `products` array, which should contain the details of products in the cart and `priceKey` to indicate the value for which we want to find summation.

For instance, if we pass the following array and "mrp" as the key, the function should return the sum of the MRP for the given array:

```js
const products = [
  {
    slug: "t-shirt",
    mrp: 499,
    offerPrice: 400,
  },
  {
    slug: "pants",
    mrp: 599,
    offerPrice: 500,
  },
];

const totalMrp = cartTotalOf(products, "mrp"); // 1098
const totalOfferPrice = cartTotalOf(products, "offerPrice"); // 900
```

As discussed earlier, Zustand provides us APIs to access state outside components and hooks. The Zustand hooks come with two methods, `getState` and `setState`, to access state outside the components. We will use the `getState` method on the `useCartItemsStore` hook to access the cart items inside our utility function:

```jsx
import { sum } from "ramda";
import useCartItemsStore from "stores/useCartItemsStore";

export const cartTotalOf = (products, priceKey) => {
  const { cartItems } = useCartItemsStore.getState();

  return sum(
    products.map(product => product[priceKey] * cartItems[product.slug])
  );
};
```

Instead of passing hardcoded strings, we will create constants for the price keys inside `src/components/constants.js` and use them inside cart component:

```js
// src/components/constants.js
export const MRP = "mrp";

export const OFFER_PRICE = "offerPrice";
```

```js
// Cart/index.jsx
const totalMrp = cartTotalOf(products, MRP);
const totalOfferPrice = cartTotalOf(products, OFFER_PRICE);
```

Let's define a component to show these consolidated details. Create a file named `PriceCard.jsx` under the `Cart` directory. We will pass the `totalMrp` and `totalOfferPrice` calculated from the `Cart` component to the price card component and display the total MRP, discounts, offer price, and items count:

```jsx
import classNames from "classnames";
import { Typography } from "neetoui";
import { gt, keys } from "ramda";
import useCartItemsStore from "stores/useCartItemsStore";

const PriceCard = ({ totalMrp, totalOfferPrice }) => {
  const totalDiscounts = totalMrp - totalOfferPrice;
  const isDiscountPresent = gt(totalDiscounts, 0);
  const discountPercentage = ((totalDiscounts / totalMrp) * 100).toFixed(1);

  const itemsCount = useCartItemsStore(store => keys(store.cartItems).length);

  return (
    <div className="neeto-ui-rounded neeto-ui-border-black space-y-2 border p-3">
      <Typography
        className={classNames("flex justify-between", {
          "line-through": isDiscountPresent,
        })}
      >
        Total MRP: <span>${totalMrp}</span>
      </Typography>
      {isDiscountPresent && (
        <>
          <Typography className="flex justify-between text-green-700">
            Total discounts:{" "}
            <span>
              ${totalDiscounts} ({discountPercentage}%)
            </span>
          </Typography>
          <Typography className="flex justify-between">
            Total offer price: <span>${totalOfferPrice}</span>
          </Typography>
          <span className="neeto-ui-text-gray-500 text-sm">
            {itemsCount} item(s)
          </span>
        </>
      )}
    </div>
  );
};
export default PriceCard;
```

Let's use the `PriceCard` component inside the `Cart/index.jsx` file:

```jsx {16-23}
import PriceCard from "./PriceCard";
// remaining imports

const Cart = () => {
  // remaining code

  return (
    <>
      <Header title="My Cart" />
      <div className="mt-10 flex justify-center space-x-10">
        <div className="w-1/3 space-y-5">
          {products.map(product => (
            <ProductCard key={product.slug} {...product} />
          ))}
        </div>
        {totalMrp > 0 && (
          <div className="w-1/4">
            <PriceCard {...{ totalMrp, totalOfferPrice }} />
          </div>
        )}
      </div>
    </>
  );
};
```

In the later part of this course, we will introduce a `Checkout` page to confirm orders by entering contact information and a shipping address. However, for now, let's add a "Buy now" button to navigate to the "/checkout" path, corresponding to the `Checkout` page, in our `PriceCard` component:

<image>buy-now-price-card.png</image>

First, let's add the "/checkout" path to `routes.js` file:

```js
const routes = {
  // ...
  checkout: "/checkout",
};
```

Let's include the "Buy now" button in the `PriceCard` component, directing it to the "/checkout" path:

```jsx
const PriceCard = ({/* props */}) => {
  return (
    <div className="neeto-ui-rounded neeto-ui-border-black space-y-2 border p-3">
      {/* remaining JSX */}
      <div className="flex flex-col items-center pt-4">
        <Button
          className="bg-neutral-800"
          label="Buy now"
          to={routes.checkout}
        />
      </div>
    </div>
  );
};
```

At last, let's add the "Buy now" button to the `Product` page, allowing users to make a direct purchase from the product details page:

<image>buy-now-product-page.png</image>

In addition to redirecting to the checkout path, we will add the product to the cart by setting the quantity to `1`:

```jsx {4, 12, 14-21}
const Product = () => {
  const { slug } = useParams();

  const { selectedQuantity, setSelectedQuantity } = useSelectedQuantity(slug);
  // remaining code
  return (
    <>
      <div className="m-16 flex justify-center gap-16">
        ...
        <div className="w-3/5 space-y-4">
          ...
          <div className="flex space-x-10">
            <AddToCart {...{ availableQuantity, slug }} />
            <Button
              className="bg-neutral-800 hover:bg-neutral-950"
              label="Buy now"
              size="large"
              to={routes.checkout}
              onClick={() => setSelectedQuantity(selectedQuantity || 1)}
            />
          </div>
        </div>
      </div>
    </>
  );
};
```

Let's commit the new changes:

```bash
git add -A
git commit -m "Added cart page"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/dd96554ad2f654ff67344feb17ad81dce6efc955).
