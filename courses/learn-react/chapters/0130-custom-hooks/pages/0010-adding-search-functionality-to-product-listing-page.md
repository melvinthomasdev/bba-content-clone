In the previous chapter, we have successfully created the product listing page. Now, it's time to enhance our application by adding a search functionality to filter products by their names. To achieve this, we will add a search input field to the `Header` component of the product listing page. The final output will look like this after implementing the search input field:

<image>header-after-integrating-search-input.png</image>

However, since the search input is only needed on the product listing page, we'll make our `Header` component more flexible by adding a prop that allows us to pass additional components for rendering when needed. We will create an optional prop named `actionBlock` which can accept any React element.

```jsx
const Header = ({ title, shouldShowBackButton = true, actionBlock }) => (
  <div className="m-2">
    <div className="mx-6 mb-2 mt-6 flex items-end justify-between">
      <div className="flex items-center">
        <Typography style="h1" weight="semibold">
          {title}
        </Typography>
      </div>
      <div className="flex items-end space-x-4">{actionBlock}</div>
    </div>
    <hr className="neeto-ui-bg-black h-1" />
  </div>
);
```

Now, let's modify the `Header` component in the `ProductList/index.jsx` file to pass the input element to the `actionBlock` prop for rendering. We will use [Input](https://neeto-ui.neeto.com/?path=/docs/components-input--default) component from `neetoUI` with a search icon from [neetoIcons](https://neeto-icons.neeto.com) as the prefix.

```jsx
import { Input } from "neetoui";
import { Search } from "neetoicons";
//rest of the imports

const ProductList = () => {
  // ...

  return (
    <div className="flex h-screen flex-col">
      <Header
        title="Smile cart"
        actionBlock={
          <Input
            placeholder="Search products"
            prefix={<Search />}
            type="search"
          />
        }
      />
      {/* rest of the code */}
    </div>
  );
};
```

### Add a state to store the search term

Create a state in the `ProductList/index.jsx` file called `searchKey` to store the search term, and initialize it with an empty string.

```js
const [searchKey, setSearchKey] = useState("");
```

We will use this state to control the input field. We will set the `searchKey` as its value. Also, we can use the input field's `onChange` handler to update the state. Now, let's see this in action:

```jsx {8-9}
<Header
  title="Smile cart"
  actionBlock={
    <Input
      placeholder="Search products"
      prefix={<Search />}
      type="search"
      value={searchKey}
      onChange={event => setSearchKey(event.target.value)}
    />
  }
/>
```

### Modify API request to include search parameter

The product listing API accepts a query parameter called `search_term`. By modifying the API request to include this query parameter, we can display products based on the user's search term.

Let's modify the `fetch` function in the `apis/products.js` file to accept an argument called `params` containing the query parameter. Then, pass these `params` as an object to the `axios.get` method. As we have already learned, Axios will automatically encode and attach these `params` to the request URL's query parameters.

```js
const fetch = params => axios.get("products", { params });
```

Now, let's return to the `ProductList/index.jsx` file. In this component, the `searchKey` state currently holds the search term, and we need to pass it as the value to the `search_term` query parameter. To maintain consistency with the JavaScript variable naming convention, we'll use the `camelCase` naming convention for our query parameter. We can use an Axios request interceptor to convert it to `snake_case`.

Modify the `fetchProducts` function to pass an object with `searchTerm` as the key and `searchKey` as its value to the `productsApi.fetch` method.

```js {3}
const fetchProducts = async () => {
  try {
    const data = await productsApi.fetch({ searchTerm: searchKey });
    setProducts(data.products);
  } catch (error) {
    console.log("error", error);
  } finally {
    setIsLoading(false);
  }
};
```

### Add a request interceptor to convert keys to snake_case

Just like the Axios response interceptors we created earlier, we will now implement request interceptors to automatically create a copy of the request object with all the keys of `request.params` converted to `snake_case`. Additionally, as our project progresses, we will need to make `POST` requests, therefore we need to transform the keys of `request.data` object as well. This transformed object will then be passed along with the request.

We can use the [`serializeKeysToSnakeCase`](https://github.com/bigbinary/neeto-cist/blob/main/docs/pure/objects.md#serializekeystosnakecase) function from `neetocist` to convert the keys of the request object to `snake_case`.

To build a transformed copy of an object, we can use the [evolve](https://ramdajs.com/docs/#evolve) function from ramda.js. It takes two arguments: The first argument is an object containing the keys that we need to transform, along with the function that needs to be applied for transformation. The second argument is the object you want to transform.

We can make use of the following code to get the transformed request object:

```js
const transformedRequest = evolve(
  { data: serializeKeysToSnakeCase, params: serializeKeysToSnakeCase },
  request
);
```

We will be getting this `request` object from the request interceptors.

Now let's see this in action. Navigate to the `apis/axios.js` file to register a request interceptor.

```js
import { serializeKeysToSnakeCase } from "neetocist";
import { evolve } from "ramda";

const requestInterceptors = () => {
  axios.interceptors.request.use(request =>
    evolve(
      { data: serializeKeysToSnakeCase, params: serializeKeysToSnakeCase },
      request
    )
  );
};

//rest of the code

export default function initializeAxios() {
  // ...
  requestInterceptors();
}
```

The `axios.interceptors.request.use` method is used to set up a request interceptor. It takes two functions as arguments:

1. The first function is the request interceptor. It receives the entire request object from Axios as an argument. Just like the response interceptor we learned earlier, the modified request object returned by it will be used to send the HTTP request to the server.

2. The second function is the error interceptor. It is optional and will be executed if an error occurs during the request. Let us ignore it for now.

Now, go to the `ProductList/index.jsx` file to add `searchKey` state as a dependency to the `useEffect` hook to execute the `fetchProducts` function whenever the value of `searchKey` changes.

```js
useEffect(() => {
  fetchProducts();
}, [searchKey]);
```

Now as you type into the search products input, you can see the corresponding products displayed, as shown below:

<image>search-after-request-interceptor-integrated.gif</image>

If you search for a product and it's not found in the database, you may encounter a blank page, which can be confusing. To enhance the user experience, it is beneficial to implement a dedicated "no data" page. This page communicates to the user that there is currently no information available for the requested product.

This is the final output after implementing the "no data" page:

<image>product-listing-with-no-data-page.png</image>

Within the `ProductList/index.jsx` file we will implement a "no data" page. To achieve this, we will make use of the [NoData](https://neeto-ui.neeto.com/?path=/docs/components-nodata--default) component from `neetoUI` library. We will utilize the `title` prop of this component to display the message `No products to show` as shown below.

```jsx
<NoData className="h-full w-full" title="No products to show" />
```

This component needs to be rendered only when the products list is empty. To check whether the `products` is empty or not we can use the `isEmpty` function from `ramda.js`. Let's take a look:

```jsx {1-2, 9, 12-14, 20}
import { NoData } from "neetoui";
import { isEmpty } from "ramda";
// ...

const ProductList = () => {
  // ...

  return (
    <div className="flex h-screen flex-col">
      {/* Rest of the code */}

      {isEmpty(products) ? (
        <NoData className="h-full w-full" title="No products to show" />
      ) : (
        <div className="grid grid-cols-2 justify-items-center gap-y-8 p-4 md:grid-cols-3 lg:grid-cols-4">
          {products.map(product => (
            <ProductListItem key={product.slug} {...product} />
          ))}
        </div>
      )}

      {/* Rest of the code */}
    </div>
  );
};

export default ProductList;
```

Before we commit the changes, let us make a minor refactoring to our request interceptor in the `axios.js` file. All ramda functions are curried by default. So, we don't need to explicitly pass in the `request` argument to the `evolve` function. If we call `evolve` with only one argument, it will return a function that will pick up the second argument implicitly. With that, we can rewrite the interceptor as:

```js
const requestInterceptors = () => {
  axios.interceptors.request.use(
    evolve({ data: serializeKeysToSnakeCase, params: serializeKeysToSnakeCase })
  );
};
```

Let's commit the new changes:

```bash
git add -A
git commit -m "Implemented search functionality to product listing page"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/40fb75425458f35176b1ef4dcd2faecb7da141e2).
