In the previous lesson, we discussed the setup process for React query and how to make the query client instance available across our components. In this lesson, we will learn, how we can use React query for fetching and managing data from an API. To facilitate this process, React query provides a hook called `useQuery`.

The `useQuery` hook supports various configuration options, the two main options are:

1. `queryKey`: It is a unique identifier used by React query to identify, cache, and re-fetch the query result. It can be any string or an array with a string and any number of serializable objects.
2. `queryFn`: It is a function that performs the actual data fetching.

To illustrate the usage of `useQuery`, let's consider an example where we want to fetch and manage data from the product GET API.

We start by setting the `queryKey` option within the `useQuery` hook. We pass an array that includes the string `"products"`, which represents the key for the products query, and the slug `mens-cotton-jacket`. This ensures that the query is specific to this product. The next time you fetch product details for `mens-cotton-jacket`, the React query checks if the query has been previously cached. If it is cached, it returns the cached data instead of making a new network request.

```js
useQuery({
  queryKey: ["products", "mens-cotton-jacket"],
});
```

Next, we will specify the `queryFn` option, which calls the `productsApi.show` method to fetch the product data for the slug `mens-cotton-jacket`.

```js
useQuery({
  queryKey: ["products", "mens-cotton-jacket"],
  queryFn: () => productsApi.show("mens-cotton-jacket"),
});
```

The `useQuery` hooks return an object with several properties containing information about the query's state and data. Here are the main properties returned by the hook:

1. `data`: It is the return value of `queryFn`. In our case, it is the API response object.
2. `isLoading`: A boolean flag that indicates whether the query is currently in the process of fetching data. It will be `true` while the query is loading and `false` once the data has been fetched or if there was an error.
3. `isError`: It is a boolean value that returns `true` if an error occurs during the data fetching process otherwise, it returns `false`.

Instead of directly calling the `useQuery` hook inside our component, we will encapsulate the `useQuery` hook inside a custom hook signifying the name of the query that it handles. We will be placing all such hooks related to products API under a single file called `useProductsApi.js` inside the `src/hooks/reactQuery` folder to keep it organized. The convention we follow is formatting the file name as `use*Api`, where `*` represents the specific set of APIs we are using. We follow this convention at BigBinary to organize the hooks related to react query.

Use the below command to create the `useProductsApi.js` file.

```bash
mkdir src/hooks/reactQuery
touch src/hooks/reactQuery/useProductsApi.js
```

We will be using the query key `products` in multiple places, so we should move it to a constant file. We should store the query keys in the `src/constants/query.js` file. Run the below command to create `query.js` file.

```bash
mkdir src/constants
touch src/constants/query.js
```

Inside the `query.js` file, let's add the query key called `products` with the key `PRODUCTS` to uniquely identify the queries related to products.

```js
export const QUERY_KEYS = {
  PRODUCTS: "products",
};
```

### Define a hook to fetch product data

Inside the `useProductsApi.js` file, we will define the `useShowProduct` hook, which takes a single parameter `slug`. Within this hook, we will call the `useQuery` hook to handle the fetching and management of data associated with a product.

```js
import { QUERY_KEYS } from "constants/query";
import { useQuery } from "react-query";
import productsApi from "apis/products";

export const useShowProduct = slug =>
  useQuery({
    queryKey: [QUERY_KEYS.PRODUCTS, slug],
    queryFn: () => productsApi.show(slug),
  });
```

We will now update the existing logic related to fetching the product details in the `Product/index.jsx` by replacing the `useEffect`, `fetchProduct`, and `useState` with the `useShowProduct` hook, passing `slug` as an argument.

To improve readability, we will alias the `data` property returned by the `useShowProduct` hook to `product`. We will also set its default value to an empty object. By setting the default value, we can avoid potential issues that may arise if the `data` value is not available or not yet loaded.

```jsx {7}
import { useShowProduct } from "hooks/reactQuery/useProductsApi";
// ...

const Product = () => {
  const { slug } = useParams();

  const { data: product = {}, isLoading, isError } = useShowProduct(slug);

  // rest of the code
};
```

### Define a hook to fetch the product list

Similarly, we will define a custom hook called `useFetchProducts` inside the `useProductsApi.js` file to fetch the product list.

Just like the API connector `productsApi.fetch`, the `useFetchProducts` hook takes a single parameter `params`. We will forward `params` to `productsApi.fetch` via the `queryFn`. Let us use `QUERY_KEYS.PRODUCTS` and `params` as the `queryKey`.

```js
export const useFetchProducts = params =>
  useQuery({
    queryKey: [QUERY_KEYS.PRODUCTS, params],
    queryFn: () => productsApi.fetch(params),
  });
```

Now let's replace the existing logic for fetching the product list in the `ProductList/index.jsx` with the `useFetchProducts` hook, passing `debouncedSearchKey` to the `searchTerm` param.

We will destructure the `products` property from `data` and default it to an empty array for our convenience. Since the API results may not be available immediately, we are setting `data` to default to an empty object `{}`.

```jsx {9-11}
import { useFetchProducts } from "hooks/reactQuery/useProductsApi";
// ...

const ProductList = () => {
  const [searchKey, setSearchKey] = useState("");

  const debouncedSearchKey = useDebounce(searchKey);

  const { data: { products = [] } = {}, isLoading } = useFetchProducts({
    searchTerm: debouncedSearchKey,
  });

  // rest of the code
};
```

React query reuses the API result even if it is called from multiple components using the same key. It won't trigger multiple API calls. Let us use this knowledge to refactor our `Carousel` component.

In the `Product/index.jsx` file, we currently pass `imageUrls` and `title` as props to the `Carousel` component. We no longer need to prop-drill those values. We can directly retrieve product details from `useShowProduct` hook within the `Carousel` component.

First, let's go to the `Product/index.jsx` file, and remove the props passed to the `Carousel` component.

```jsx {9}
// ...
const Product = () => {
  // ...

  return (
    // ...
    <div className="m-16 flex justify-center gap-16">
      {isNotNil(imageUrls) ? (
        <Carousel />
      ) : (
        <img alt={name} className="w-48" src={imageUrl} />
      )}
      {/* rest of the code */}
    </div>
  );
};
```

Then, go to the `Product/Carousel.jsx` and call the `useShowProduct` hook. This hook expects the `slug` as an argument. To access the `slug` from the URL parameter, we can use the `useParams` hook from `react-router-dom`.

```jsx {7, 11}
import { useShowProduct } from "hooks/reactQuery/useProductsApi";
import { useParams } from "react-router-dom";
// ...

const Carousel = () => {
  // ...
  const { slug } = useParams();

  const timerRef = useRef(null);

  const { data: { imageUrl, imageUrls, title } = {} } = useShowProduct(slug);

  // rest of the code
};
```

Let's commit the new changes:

```bash
git add -A
git commit -m "Created React query custom hook to fetch product and product list"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/72de9b34da604df149d1c5255d58de28a21493fe).
