In this lesson, we will see how to fetch the product details using Axios in our SmileCart project.

We can utilize the following API endpoint to fetch the details of a product by its slug.

```plaintext
https://smile-cart-backend-staging.neetodeployapp.com/products/:product_slug
```

Throughout this lesson, we will be using `infinix-inbook-2` as `product_slug`.

### Import Axios

Let's return to our `Product.jsx` component and import the Axios library.

```js
import axios from "axios";
```

### Create an async function

We will define an async function named `fetchProduct` that will be responsible for fetching product details from the API.

```js
const fetchProduct = async () => {
  const response = await axios.get(
    "https://smile-cart-backend-staging.neetodeployapp.com/products/infinix-inbook-2"
  );
  console.log("Api response", response);
};
```

`axios.get` function will send a `GET` request to the product details endpoint and return a Promise. We use the `await` keyword to pause the execution until this Promise is resolved or rejected. `fetchProduct` is declared as an async function to indicate that it involves asynchronous operations.

When you use Axios to make an HTTP request, the response is a JavaScript object having the following attributes:

- `data`: It's an object representing the actual server response data. Axios automatically deserializes the data if it is in `JSON` format.
- `status`: It's a number representing the status code returned by the server.
- `statusText`: It's a string representing the status message corresponding to the HTTP status code. For example, this would be `OK` for a status code `200`, `Continue` for `100`, `Not Found` for `404`.
- `headers`: It's an object that includes HTTP response header information like content type, caching, cookies, etc.
- `config`: It's an object containing the configuration options that were used to make the request. This includes properties like method, URL, headers, and other options.
- `request`: It's an `XMLHttpRequest` containing the HTTP request information.

### Initialize useEffect for initial data fetch

Now let's create a `useEffect` hook to trigger the `fetchProduct` function on the initial render of the product component.

```jsx
const Product = () => {
  const fetchProduct = async () => {
    ...
  };

  useEffect(() => {
    fetchProduct();
  }, []);

  //rest of the code
};
```

As we have learned already, this `useEffect` hook will run only once, immediately after the component mounts because its dependency array is empty.
To view the API request getting triggered, open the `Network` tab of your browser's developer tools.

> Press F12 or right-click and select "Inspect" to open the browser's developer tools.

<image>product-api-network-tab.png</image>

### Wrap async code in a try...catch block for error handling

To handle errors gracefully when dealing with asynchronous operations like API requests, we should wrap the code awaiting the promises in a `try/catch` block.

Here's how you can modify the `fetchProduct` to include the `try/catch` block:

```js
const fetchProduct = async () => {
  try {
    const response = await axios.get(
      "https://smile-cart-backend-staging.neetodeployapp.com/products/infinix-inbook-2"
    );
    console.log("Api response", response);
  } catch (error) {
    console.log("An error occurred:", error);
  }
};
```

To illustrate the importance of the `try/catch` block, let's consider a situation where an invalid URL is provided.

<codeblock language="javascript" type="lesson" packages="axios">
<code>
const fetchProduct = async () => {
  try {
    const response = await axios.get(
      "https://nonexistent-api.example.com/products/infinix-inbook-2"
    );
    console.log("Product name", response.data.name);
  } catch (error) {
    console.log("An error occurred:", error);
  }
};

fetchProduct();

</code>
</codeblock>

In this example, error that occurs will be caught by the `try/catch` block, and we can log the error message to the console. However, if we don't use a `try/catch` block, and an error occurs during the execution, the error will not be caught and handled. It will lead to an `unhandled promise rejection` warning. Moreover, on attempting to access `response.data.name` it will result in a runtime error like `"Cannot read properties of undefined (reading 'name')"`, because there is no valid response object to extract the data.

Remember, when working with asynchronous operations, using `try/catch` blocks is a best practice to ensure that your code handles errors effectively and maintains the stability of your application.

### Initialize state to store API response

To store the product data from the response in a state variable, you can use the `useState` hook. Let’s create a state variable named `product` to hold this data.

```js
const [product, setProduct] = useState({});
```

To update the `product` state with the response `data`, you can modify the `fetchProduct` function as follows:

```js
const fetchProduct = async () => {
  try {
    const response = await axios.get(
      "https://smile-cart-backend-staging.neetodeployapp.com/products/infinix-inbook-2"
    );
    setProduct(response.data);
  } catch (error) {
    console.log("An error occurred:", error);
  }
};
```

This is how data in the product state looks like:

```plaintext
{
    name: "Infinix INBOOK",
    slug: "infinix-inbook-2",
    available_quantity: 5,
    image_url: "https://ik.imagekit.io/d9mvewbju/SmileCart/thumbnail_61_7PaLfb.jpg",
    mrp: 32678,
    offer_price: 30990,
    description:
      "Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey - 1 Year Warranty.",
    image_urls: [
        "https://ik.imagekit.io/d9mvewbju/SmileCart/1_yuRfcETI5.jpg",
        "https://ik.imagekit.io/d9mvewbju/SmileCart/2_HoKD2OblW.png",
        "https://ik.imagekit.io/d9mvewbju/SmileCart/3_-6sHqwicC.png"
    ]
}
```

Now let's replace all the hardcoded product details present in the `Product.jsx` component with the data in the `product` state.

This can be accomplished by destructuring the essential properties from the product state. Furthermore, we will calculate the discount percentage for the product and store it in the variable `discountPercentage`.

Additionally, we should remove the `IMAGE_URLS` constant from the `src/constants.js` file.

```jsx {12-14, 22, 30-31, 33, 36}
const Product = () => {
  const [product, setProduct] = useState({});

  const fetchProduct = async () => {
    ...
  };

  useEffect(() => {
    fetchProduct();
  }, []);

  const { name, description, mrp, offer_price } = product;
  const totalDiscounts = mrp - offer_price;
  const discountPercentage = ((totalDiscounts / mrp) * 100).toFixed(1);

  //...

  return (
    <div className="px-6 pb-6">
      <div>
        <Typography className="py-2 text-4xl font-semibold" style="h1">
          {name}
        </Typography>
        {/* rest of the code */}
      </div>

       {/* rest of the code */}

      <div className="w-3/5 space-y-4">
        <Typography>{description}</Typography>
        <Typography>MRP: {mrp}</Typography>
        <Typography className="font-semibold">
          Offer price: {offer_price}
        </Typography>
        <Typography className="font-semibold text-green-600">
          {discountPercentage}% off
        </Typography>
      </div>

      {/* rest of the code */}
    </div>
)};
```

> [toFixed()](https://courses.bigbinaryacademy.com/learn-javascript/number-methods/to-fixed) method rounds to a specified number of decimals.

Next, we will replace the hardcoded product image URLs passed to the `Carousel.jsx` component with the image URLs from the product APIs. To accomplish this, we need to extract two variables from the `product` state: `image_urls`, which contains a list of product image URLs, and `image_url`, which contains the URL of the default product image. We will then use the `append` function from `ramda.js` to append the `image_urls` and `image_url` together. Finally, we will pass the combined URLs as a prop to the `Carousel.jsx` component.

```jsx {1, 7-8, 16, 18-20, 22}
import { append } from "ramda";
// ...

const Product = () => {
  // ...

  const { name, description, mrp, offer_price, image_urls, image_url } =
    product;

  // ...

  return (
    <>
      {/* rest of the code */}

      <div className="mt-16 flex gap-4">
        <div className="w-2/5">
          <div className="flex justify-center gap-16">
            <Carousel imageUrls={append(image_url, image_urls)} title={name} />
          </div>
        </div>
      <div>

        {/* rest of the code */}
      </div>
    </>
  );
};
```

We need to render the `Carousel` component only if the `image_urls` is not null. Otherwise, we will show the default product image. We can use the `isNotNil` function from `ramda.js` to conditionally render the `Carousel` component.

```jsx {1, 12-16}
import { isNotNil, append } from "ramda";
// ...

const Product = () => {
  // ...

  return (
    <>
      {/* rest of the code */}

      <div className="flex justify-center gap-16">
        {isNotNil(image_urls) ? (
          <Carousel imageUrls={append(image_url, image_urls)} title={name} />
        ) : (
          <img alt={name} className="w-48" src={image_url} />
        )}

        {/* rest of the code */}
      </div>
    </>
  );
};
```

In JavaScript, it's a best practice to use `camelCase` for naming variables to maintain consistency and readability. However, when dealing with API responses where the keys are typically in `snake_case`, it's often necessary to reassign them to `camelCase`.

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

At this point, you may see empty content on the product page as shown below for a brief amount of time:

<image>product-page-with-no-loader.png</image>

This happens because the product data is empty when React renders the component for the first time. The component can render correctly only after receiving a proper API response from the server.

To overcome such issues it's a good practice to include a loading indicator while data is being fetched. This prevents the user from interacting with an incompletely rendered UI.

To achieve this, we will create a new state variable named `isLoading`.

```jsx
const [isLoading, setIsLoading] = useState(true);
```

The initial value of `isLoading` is set to `true`, indicating that the product component is in the loading state initially. Regardless of whether the API call succeeds or encounters an error, the `isLoading` state needs to be set to `false` to indicate the completion of the API request. To ensure this, we have called the `setIsLoading` function inside the `finally` block.

```js
const fetchProduct = async () => {
  try {
    const response = await axios.get(
      "https://smile-cart-backend-staging.neetodeployapp.com/products/infinix-inbook-2"
    );
    setProduct(response.data);
  } catch (error) {
    console.log("An error occurred:", error);
  } finally {
    setIsLoading(false);
  }
};
```

Let's implement a loader in the product component to indicate to the user that data is being fetched. We will utilize the `isLoading` state to dynamically display the loader.
To achieve this, we can use the [Spinner](https://neeto-ui.neeto.com/?path=/docs/components-spinner--default) component from `neetoUI` library.

```jsx {26-32}
import { useState, useEffect } from "react";

import { Spinner } from "neetoui";

const Product = () => {
  const [isLoading, setIsLoading] = useState(true);
  const [product, setProduct] = useState({});

  const fetchProduct = async () => {
    try {
      //Product API
    } catch (error) {
      //Handle error
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    fetchProduct();
  }, []);

  //destructing product
  //discount percentage calculations

  if (isLoading) {
    return (
      <div className="flex h-screen w-full items-center justify-center">
        <Spinner />
      </div>
    );
  }

  //rest of the code
};

export default Product;
```

By following these steps, you've successfully updated the product component to show product details through an API. Users will see a loader while the data is being fetched, and once the data is available, the spinner will be replaced with the actual product information.

Here's how the modified product page looks.

<image>product-page-after-api-integration.png</image>

Let's commit the new changes:

```bash
git add -A
git commit -m "Integrated API to display product details"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/1fcc17f0565b37905925fbe66b12b32f04811c58).
