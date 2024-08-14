As the application grows, the number of API's to interact with the server will also increase nearly proportional to the routes that we define. Sticking to the principle of modularity and reusability, we will be creating all our API's in the `src/apis` directory. The files containing the API requests are referred as `API connector` file.

Here is an example showing how the folder structure looks.

```
└── src
    └── apis
        ├── products.js
        ├── countries.js
        ├── states.js
        └── orders.js
```

Always try to name the API connector file aligned with the resource that the particular API will be interacting with.
Resources are typically represented as endpoints, where each endpoint corresponds to a specific resource. In our current scenario, we have the following endpoints associated with the resource `products`:

```
GET /products
GET /products/:slug
```

Following this convention, you should name the API connector file as `products.js`. This file will serve as the central location for all APIs related to the `products` resource.

Refer [Building an API](https://courses.bigbinaryacademy.com/learn-rubyonrails/building-and-organizing-apis/#building-an-api) section in Building and organizing APIs to learn more about the conventions while creating the API's. We at BigBinary strictly follow these conventions while creating the API's.

Now, let’s create the `products.js` file inside `src/apis` folder. Make sure that you are in the project root and after that run the following command:

```bash
mkdir src/apis
touch src/apis/products.js
```

Next, inside the `products.js` file define a function called `show` to fetch the product details.

```js
import axios from "axios";

const show = () =>
  axios.get(
    "https://smile-cart-backend-staging.neetodeployapp.net/products/infinix-inbook-2"
  );
```

We have created the `show` function, now we need to export them. To achieve this, we'll create an object named `productsApi`, which will contain our `show` function.

```js
const productsApi = { show };
```

Encapsulating the functions within an object is beneficial, when you have multiple functions related to products (e.g., show, create, update, delete), you can include all of them within the `productsApi` object, making it a convenient and logical container for all product-related functionality.

Finally, default export the `productsApi`.

```js
export default productsApi;
```

Now we will modify the `Product.jsx` component to make `fetchProduct` function use the `show` method from the `productsApi` to make the HTTP GET request.

Here's how we can modify the `fetchProduct` function.

```js
import productsApi from "apis/products";
// ...

const fetchProduct = async () => {
  try {
    const response = await productsApi.show();
    setProduct(response.data);
  } catch (error) {
    console.log("An error occurred:", error);
  } finally {
    setIsLoading(false);
  }
};

// rest of the code
```

In the above code snippet, we have used path aliases to import `productsApi` from the `apis` folder. Path aliases are a way to use alternative or shorter names for file paths or directories instead of using full, lengthy paths to access a file or folder. The `smile-cart-frontend` project is configured to alias commonly used files and directories, making the imports shorter.

For example, in this case, the `apis` string in the import statement `"apis/products"` is configured to point to the absolute path of the `src/apis` directory of the project. By doing so, we can avoid the usage of relative paths, as shown below in our project:

```js
import productsApi from "../../apis/products";
```

Using path aliases over relative paths makes the import statement shorter and less error-prone.

You can refer to the [Path aliases section](https://courses.bigbinaryacademy.com/learn-react/miscellaneous/setting-up-template-repository/#path-aliases) to understand how we configured our project to use path aliases.

Let's commit the new changes:

```bash
git add -A
git commit -m "Created product API connector file"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/965f54d3fddf8f783249e44e4087cd5cddd07f97).
