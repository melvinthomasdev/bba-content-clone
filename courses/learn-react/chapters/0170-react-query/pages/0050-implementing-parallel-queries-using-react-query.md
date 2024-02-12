In the Global state management chapter, we have successfully implemented the cart page feature and parallel fetching of the cart products. In this lesson, we will learn how we can use react query for parallel fetching.

While the `useQuery` hook is excellent for managing the state of a single query, it may not be sufficient when we need to handle multiple API requests concurrently. Additionally, we cannot use `useQuery` hook inside a loop to send multiple API requests, as it violates the rules of hooks.

To address this, React query provides a hook called `useQueries`. This hook allows us to fetch and manage the state of multiple queries simultaneously. It takes an array of query configuration objects and returns an array of results. Each query configuration object represents a separate API request.

Here's how you can use the `useQueries` hook.

Consider an example, where we want to simultaneously fetch data for two products with slugs `mens-cotton-jacket` and `mens-casual-slim-fit`.

```js
const slugs = ["mens-cotton-jacket", "mens-casual-slim-fit"];
```

Similar to the `useQuery` hook, this hook also supports specifying the `queryKey` and `queryFn` options for each query configuration object.

We can map over slugs to generate the configuration objects for each slug and then use the resulting array as the argument of the `useQueries` hook.

We can use `QUERY_KEYS.PRODUCTS` and `slug` as the `queryKey` to uniquely identify each configuration object. The `queryFn` option will call the `productsApi.show` method, which is responsible for fetching the product data for each `slug`.

```js
useQueries(
  slugs.map(slug => ({
    queryKey: [QUERY_KEYS.PRODUCTS, slug],
    queryFn: () => productsApi.show(slug),
  }))
);
```

The `useQueries` hook sends API requests to fetch both products in parallel and retrieve an array of query result objects. Each object contains properties such as `data`, `isLoading`, `isFetching` etc.

### Define a hook to fetch cart products

Inside the `useProductsApi.js` file, we will define a hook called `useFetchCartProducts` which takes a single parameter `slugs`. Within this hook, we will call the `useQueries` hook.

```js
import { useQueries } from "react-query";
// ...

export const useFetchCartProducts = slugs => {
  useQueries(
    slugs.map(slug => ({
      queryKey: [QUERY_KEYS.PRODUCTS, slug],
      queryFn: () => productsApi.show(slug),
    }))
  );
};
```

As we know, `useQueries` hook returns an array of query result objects. We will extract the `data` property from each response object. If the `data` property is `undefined` or `null` due to the corresponding query not being resolved or if there was an error fetching the data, we will filter out such objects from the resulting array.

```js {10, 12}
// ...

export const useFetchCartProducts = slugs => {
  const responses = useQueries(
    slugs.map(slug => ({
      // ...
    }))
  );

  const data = responses.map(prop("data")).filter(Boolean);

  return { data };
};
```

We need to check whether any of the requests are still in progress. To achieve this, we will examine whether any object in the responses array has an `isLoading` property set to `true`. We can make use of the [existsBy](https://github.com/bigbinary/neeto-cist/blob/main/docs/pure/arrays.md#existsby) function from `neetocist`. It returns true if the array contains an item that matches the provided pattern.

```js {13, 15}
import { existsBy } from "neetocist";

// ...

export const useFetchCartProducts = slugs => {
  const responses = useQueries(
    slugs.map(slug => ({
      // ...
    }))
  );

  const data = responses.map(prop("data")).filter(Boolean);
  const isLoading = existsBy({ isLoading: true }, responses);

  return { data, isLoading };
};
```

Within the `fetchCartProducts` function in the `Cart/index.jsx` file, we have already added the logic to verify and update the cart items store if the quantity of a specific item in the cart exceeds its current stock, as shown below.

```js {6-13}
const fetchCartProducts = async () => {
  try {
    //...

    responses.forEach(({ availableQuantity, name, slug }) => {
      if (availableQuantity >= cartItems[slug]) return;

      setSelectedQuantity(slug, availableQuantity);
      if (availableQuantity === 0) {
        Toastr.error(t("product.error.removedFromCart", { name }), {
          autoClose: 2000,
        });
      }
    });
  }
  // ...
};
```

We will incorporate this same logic within the `onSuccess` callback of the `useQueries` option. This callback will be invoked upon the successful API call, and it will receive the fetched data as an argument.

```js {7-16}
// ...

export const useFetchCartProducts = slugs => {
  const responses = useQueries(
    slugs.map(slug => ({
      // ...
      onSuccess: ({ availableQuantity, name }) => {
        if (availableQuantity >= cartItems[slug]) return;

        setSelectedQuantity(slug, availableQuantity);
        if (availableQuantity === 0) {
          Toastr.error(t("product.error.removedFromCart", { name }), {
            autoClose: 2000,
          });
        }
      },
    }))
  );

  // ....
};
```

We will now update the existing logic related to fetching product details through parallel queries in the `Cart/index.jsx` file by replacing the `useEffect`, `fetchCartProducts`, and `useState` with the `useFetchCartProducts` hook, passing `slugs` as an argument. Also, we will replace the existing usage of `useCartItemsStore` to extract only `slugs` from the store.

To improve readability, we will alias the `data` property returned by the `useFetchCartProducts` hook to `products`. We will also set its default value to an empty array.

```jsx {8}
import { useFetchCartProducts } from "hooks/reactQuery/useProductsApi";
// ...

const Cart = () => {
  // ...
  const slugs = useCartItemsStore(store => keys(store.cartItems));

  const { data: products = [], isLoading } = useFetchCartProducts(slugs);

  // rest of the code
};
```

Let's commit the new changes:

```bash
git add -A
git commit -m "Created React query custom hook to implement parallel queries"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/00cc56acf1d5942cedc29e71b3b72dbc3fe4e236).
