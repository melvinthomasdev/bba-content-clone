In our previous lesson, we observed in the `Product.jsx` component, we were manually extracting the `data` from the response object within the `fetchProduct` function, as shown below:

```js
const fetchProduct = async () => {
  try {
    const response = await productsApi.show();
    setProduct(response.data);
  } catch (error) {
    // ...
  } finally {
    // ...
  }
};
```

Since Axios response schema is designed that way, we have to repetitively extract `data` from the response for all API requests throughout our codebase. Luckily, we can use Axios interceptors to automate this process.

Axios interceptors are functions that can be registered globally with Axios. They allow you to intercept and modify HTTP requests before they are sent and responses before they are processed.

Let's start by creating an `axios.js` file in the `src/apis` folder. As per our convention at BigBinary, this is where we'll store all the axios configurations for our project.

```bash
touch src/apis/axios.js
```

Now, we will create a function that registers a response interceptor to manipulate HTTP responses.

```js
import axios from "axios";

const responseInterceptors = () => {
  axios.interceptors.response.use(response => response.data);
};

export default responseInterceptors;
```

The `axios.interceptors.response.use` method sets up a response interceptor. It takes two functions as arguments:

1. The first function is for handling successful responses. When you register a response interceptor, it is designed to receive the entire response object from Axios. Within the response interceptor, you have the flexibility to apply custom logic to the response object, and you can return the modified version as the value of the interceptor. If you have multiple interceptors registered, they will be executed in the order they were registered. The return value of the first registered response interceptor will be passed as the response argument to the next registered interceptor. Ultimately, the result of `const result = await axios.get(...)` will be the return value of the last registered interceptor.

2. The second function is optional and is used for handling errors. Let us ignore it for now.

In our case, the interceptor function is `response => response.data`. The interceptor is getting the response object from Axios as an argument and it is returning the `data` attribute of it. We have attached this interceptor to `axios`, so that we will get the `data` attribute directly when we call `await axios.get(...)`.

Navigate to the `src/index.jsx` file, import and call the `responseInterceptors` to ensure Axios is initialized before rendering the React components.

```jsx
import responseInterceptors from "apis/axios";
// ...

responseInterceptors();
const root = ReactDOM.createRoot(document.getElementById("root"));

//rest of the code
```

With the addition of our response interceptor, the API will automatically return the `data` portion of the response. Here's how we can modify the `fetchProduct` function in `Product.jsx` component to avoid unnecessary nesting of `data` from the response:

```js {3-4}
const fetchProduct = async () => {
  try {
    const product = await productsApi.show();
    setProduct(product);
  } catch (error) {
    // ...
  } finally {
    // ...
  }
};
```

### Implement response data key transformation

In our `Product.jsx` component, we currently transform the keys of the response data manually from `snake_case` to `camelCase` by renaming the keys of the product object while destructuring, as shown below:

```js
const {
  name,
  description,
  mrp,
  offer_price: offerPrice,
  image_urls: imageUrls,
  image_url: imageUrl,
} = product;
```

We can make use of Axios response interceptors to handle this transformation globally. We are going to modify the response interceptor to automatically create a copy of `response.data` with all its keys converted to `camelCase`. This transformed object will then be returned as the value of the interceptor, effectively becoming the result of `await axios.get(...)` calls.

To create a copy of an object by recursively camel casing its keys, we can use [`keysToCamelCase`](https://github.com/bigbinary/neeto-cist/blob/main/docs/pure/objects.md#keystocamelcase) function from `@bigbinary/neeto-cist`. [`neeto-cist`](https://github.com/bigbinary/neeto-cist) is a utility functions library that encapsulates the most commonly used functions across neeto. You can read our [blog](https://www.bigbinary.com/blog/extending-pure-utility-functions-of-ramda) to understand the motivation behind building such a library.

Let us see how we are going to add this transformation into our response interceptor. First, we will define a function that applies `keysToCamelCase` to `response.data`.

```js
import { keysToCamelCase } from "neetocist";
// ...

const transformResponseKeysToCamelCase = response => {
  if (response.data) response.data = keysToCamelCase(response.data);
};

//rest of the code
```

Inside the interceptor, we call the `transformResponseKeysToCamelCase` function to transform the response data.

```js
// ...
const responseInterceptors = () => {
  axios.interceptors.response.use(response => {
    transformResponseKeysToCamelCase(response);

    return response.data;
  });
};
//rest of the code
```

This is how the response data looks like before and after the transformation:

Before:

<image>product-response-before-transforming-response-keys.png</image>

After:

<image>product-response-after-transforming-response-keys.png</image>

Now, we can use the response without the need to rename the keys into `camelCase`:

```js
const { name, description, mrp, offerPrice, imageUrls, imageUrl } = product;
```

### Setting default HTTP headers

Axios also allows us to set application-wide default HTTP headers. When we send an API request, these headers will be attached to it automatically.

To inform the server about the expected data format Axios should receive in response, we can include an `Accept` header in the HTTP request configuration, specifying the desired data format. In our case, we expect the response from the server to be in `JSON` format. To achieve this, we can set the `Accept` header to `application/json`.

To inform the server about the format of the data being sent in the request body, we can include `Content-Type` header in the HTTP request. Since we are sending request data in `JSON` format, we can set the `Content-Type` header to `application/json`.

Create a function to configure the default HTTP headers as follows.

```js
const setHttpHeaders = () => {
  axios.defaults.headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
};
```

Headers defined inside `axios.defaults.headers` will be attached to every API request we make using `axios`.

### Setting default baseURL

As our project continues, we'll be making multiple API requests. In all the cases, we will be making requests to the same API backend, `https://smile-cart-backend-staging.neetodeployapp.net`.

To avoid the repetition of specifying this URL in every request in the codebase, Axios provides a convenient feature that allows us to set a default `baseURL`, which can be achieved like this:

```js
axios.defaults.baseURL =
  "https://smile-cart-backend-staging.neetodeployapp.net/";
```

Now, remove the existing default export for the `responseInterceptors` function and create a new default export function called `initializeAxios`, which sets the default `baseURL` and calls two functions, `setHttpHeaders()` and `responseInterceptors()`.

```js
export default function initializeAxios() {
  axios.defaults.baseURL =
    "https://smile-cart-backend-staging.neetodeployapp.net/";
  setHttpHeaders();
  responseInterceptors();
}
```

Also, in your `src/index.jsx` file, replace the `responseInterceptors` import with `initializeAxios`.

```jsx
import initializeAxios from "apis/axios";
// ...

initializeAxios();
const root = ReactDOM.createRoot(document.getElementById("root"));

//rest of the code
```

Since we have set the default `baseURL`, let's update the `show` function in the `apis/products.js` file to use only the URL path.

```js
const show = () => axios.get("products/infinix-inbook-2");
```

Let's commit the new changes:

```bash
git add -A
git commit -m "Implemented Axios interceptors to set http headers and to transform response"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/11a7e148c35cac77d2e0184324d3110e3869e790).
