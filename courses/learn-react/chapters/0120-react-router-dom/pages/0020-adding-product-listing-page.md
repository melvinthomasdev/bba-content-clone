In this lesson, we will build a product listing page that lists a set of products with their thumbnail, title and price. Clicking on a particular product should take us to the product details page and display the corresponding product details. Here is how our application should function after implementing this feature:

<image>product-listing-page-requirement.gif</image>

Since this feature has a lot of moving parts, let's break it down into smaller requirements:

- Add an API for fetching a list of products.
- Display the product list as cards.
- Add navigation to the `Product` component from the product listing page.
- Display the detail of the product clicked.

Let's get started by adding an API connector to fetch the products list from the [product listing API](https://courses.bigbinaryacademy.com/learn-react/setting-up-smilecart/project-overview/#listing-products) available to us. Since we have already set the Axios for managing API requests, we can directly add a function to our `productsApi` to send a get request to fetch products:

```js
// remaining code in products.js as it is

const fetch = () => axios.get("products");

const productsApi = { show, fetch };
```

We can use the `Home` component to display the product list. Let's rename the `Home` component to `ProductList` to indicate what it does:

```bash
mv src/components/Home.jsx src/components/ProductList.jsx
```

We will display the `ProductList` component under the "/products" URL. Let's replace the `Route` for the `Home` component with the `ProductList` route. We can also remove the `NavLink` components added in the previous lesson from `App.jsx`:

```jsx {1, 6}
import ProductList from "./components/ProductList";
// remaining imports

const App = () => (
  <Switch>
    <Route exact component={ProductList} path="/products" />
    <Route exact component={Product} path="/product" />
    <Route component={PageNotFound} path="*" />
  </Switch>
);
```

But now, when the user opens the application, they will see the `PageNotFound` component under the root URL, which is not desirable. Instead, they should be taken to the `ProductList` component when they visit our application.

We can enable this by redirecting users to the "/products" path from the root URL. The React Router provides the `<Redirect>` component, which accepts a `from` and `to` prop to add redirection. Similar to the `<Route>` component, we should pass the `exact` prop to `<Redirect>` to match the path completely.

```jsx {5}
const App = () => (
  <Switch>
    <Route exact component={ProductList} path="/products" />
    <Route exact component={Product} path="/product" />
    <Redirect exact from="/" to="/products" />
    <Route component={PageNotFound} path="*" />
  </Switch>
);
```

Now, if you open the application, you will get redirected to the "/products" URL, and the `ProductList` component will be rendered. From the `ProductList` component, we will fetch the products and render them as cards.

Let's import `productsApi` from the `apis` directory and add a function to fetch products inside the `ProductList` component:

```js
// ProductList.jsx
import productsApi from "apis/products";

const fetchProducts = async () => {
  try {
    const response = await productsApi.fetch();
    console.log(response);
  } catch (error) {
    console.log("An error occurred:", error);
  }
};
```

We will call the above function inside the `useEffect` hook with an empty dependency array to fetch products data on the initial render.

```js
useEffect(() => {
  fetchProducts();
}, []);
```

As you can see from the console, the product listing API returns an object containing an array of products and the total product count in the database. We will destructure the products array from this object and store it in a state:

```js {1, 5-6}
const [products, setProducts] = useState([]);

const fetchProducts = async () => {
  try {
    const { products } = await productsApi.fetch();
    setProducts(products);
  } catch (error) {
    console.log("An error occurred:", error);
  }
};
```

We should also handle the loading state while fetching products:

```js {1, 3, 11-13, 16-22}
import { Spinner } from "neetoui";
// ...
const [isLoading, setIsLoading] = useState(true);

const fetchProducts = async () => {
  try {
    const { products } = await productsApi.fetch();
    setProducts(products);
  } catch (error) {
    console.log("An error occurred:", error);
  } finally {
    setIsLoading(false);
  }
};

if (isLoading) {
  return (
    <div className="flex h-screen w-full items-center justify-center">
      <Spinner />
    </div>
  );
}

// rest of the code
```

Now, instead of the placeholder text "Home", let's render the product list.

For that, first, create a `ProductListItem` component to render the product card. Since we need to display the thumbnail, name and offer price of products, let's have a prop for each of them:

```jsx
import { Typography } from "neetoui";

const ProductListItem = ({ imageUrl, name, offerPrice }) => (
  <div className="neeto-ui-border-black neeto-ui-rounded-xl flex w-48 flex-col items-center justify-between border p-4">
    <img alt={name} className="h-40 w-40" src={imageUrl} />
    <Typography className="text-center" weight="semibold">
      {name}
    </Typography>
    <Typography>${offerPrice}</Typography>
  </div>
);

export default ProductListItem;
```

Next, map the `products` array over the `ProductListItem`.

```jsx {1, 14-18}
import ProductListItem from "./ProductListItem";
// remaining imports

const ProductList = () => {
  // ... remaining code
  return (
    <div className="flex flex-col">
      <div className="m-2">
        <Typography className="mx-6 mb-2 mt-6" style="h1" weight="semibold">
          Smile Cart
        </Typography>
        <hr className="neeto-ui-bg-black h-1" />
      </div>
      <div className="grid grid-cols-2 justify-items-center gap-y-8 p-4 md:grid-cols-3 lg:grid-cols-4">
        {products.map(product => (
          <ProductListItem key={product.slug} {...product} />
        ))}
      </div>
    </div>
  );
};

export default ProductList;
```

We have completed the first phase of the feature by listing the product details:

<image>product-list.png</image>

Our next goal is to enable users to view the corresponding product details when they click the product card. To achieve this, we'll utilize a technique called **dynamic routing**. This technique allows us to define routes that can accept parameters.

We can apply this technique to include the slug of a product as part of the product path like this:

```jsx {4}
const App = () => (
  <Switch>
    <Route exact component={ProductList} path="/products" />
    <Route exact component={Product} path="/products/:slug" />
    <Redirect exact from="/" to="/products" />
    <Route component={PageNotFound} path="*" />
  </Switch>
);
```

Now, the product component will be displayed when we visit any URL of the form `/products/:slug`, where `:slug` can be any string. For the path "/products/mens-casual-slim-fit", `mens-casual-slim-fit` is the `:slug`. The `:` at the beginning of the `:slug` indicates that it is the dynamic part of the URL.

Next, we can replace the `div` tag in the `ProductListItem` component with `Link` to add navigation to the product URL with the corresponding `slug`:

```jsx {1-5, 11}
const ProductListItem = ({ imageUrl, name, offerPrice, slug }) => (
  <Link
    className="neeto-ui-border-black neeto-ui-rounded-xl flex w-48 flex-col items-center justify-between border p-4"
    to={`products/${slug}`}
  >
    <img alt={name} className="h-40 w-40" src={imageUrl} />
    <Typography className="text-center" weight="semibold">
      {name}
    </Typography>
    <Typography>${offerPrice}</Typography>
  </Link>
);
```

At this point, you can navigate to the `Product` component by clicking the product cards, and the URL will contain the slug of the product clicked.

Now, from the `Product` component, we can access the slug from the URL using the `useParams` hook from the `react-router-dom`. The `useParams` hook returns an object containing dynamic params from the current URL matched by the `<Route path>`.

Let's extract the `slug` from the URL params. We can use this `slug` to send API requests for the given product using the `productsApi.show` function.

```jsx {1, 5, 9}
import { useParams } from "react-router-dom";
// remaining imports

const Product = () => {
  const { slug } = useParams();

  const fetchProduct = async () => {
    try {
      const response = await productsApi.show(slug);
      setProduct(response);
    } catch (error) {
      console.log("An error occurred:", error);
    } finally {
      setIsLoading(false);
    }
  };

  //rest of the code
};
```

We can enable the `show` function of `productsApi` to send the request to the given slug, replacing the hard-coded slug `infinix-inbook-2` with a slug parameter:

```js
const show = slug => axios.get(`products/${slug}`);
```

With this, users will be able to view product details of the selected product from the list:

<image>product-listing-without-back-button.gif</image>

Nevertheless, if a user enters a URL with an invalid slug, the backend will throw a 404 error since there's no product corresponding to the given slug. To address this scenario, we will set an `isError` state inside the catch block while fetching the product data and use it to display a `PageNotFound` component.

```jsx {4, 11, 17}
// Product.jsx

const Product = () => {
  const [isError, setIsError] = useState(false);

  const fetchProduct = async () => {
    try {
      const response = await productsApi.show(slug);
      setProduct(response);
    } catch {
      setIsError(true);
    } finally {
      setIsLoading(false);
    }
  };

  if (isError) return <PageNotFound />;

  // remaining code
};
```

As the final touch, let's add a back button on the product page to navigate back to the product listing page:

<image>back-button-requirement.png</image>

To achieve this, we'll make use of the `useHistory` hook, which provides access to the browser history. The `useHistory` hook returns a `history` object with a set of properties and methods for managing browser history. You can refer to the [official documentation](https://v5.reactrouter.com/web/api/history) for a comprehensive list of properties and methods.

For our specific use case, we'll utilize the `goBack` method from the history object, which helps us navigate to the previous location in the history stack:

```jsx {1-2, 6, 13-16}
import { LeftArrow } from "neetoicons";
import { useParams, useHistory } from "react-router-dom";
// remaining imports

const Product = () => {
  const history = useHistory();

  // ...

  return (
    <div className="m-2">
      <div className="flex items-center">
        <LeftArrow
          className="hover:neeto-ui-bg-gray-400 neeto-ui-rounded-full mr-6"
          onClick={history.goBack}
        />
        <Typography style="h1" weight="semibold">
          {name}
        </Typography>
      </div>
      <hr className="neeto-ui-bg-black h-1" />
    </div>
    // ...
  );
};
```

While the product listing functionality is complete, there are still opportunities for improving code quality.

Let's clean up the code before committing the changes.

## Grouping components into folder

In the current project structure, all components are placed in the `src/components` directory. However, as the project grows, this approach becomes impractical, making it challenging to locate specific components. To address this, we should organize components into folders based on their functionality.

For example, the `Carousel` and `Product` components, used together to display the Product page, should be grouped into a folder named `Product`. The `Product` component becomes the entry point of this folder, and therefore, we will rename the `Product.jsx` file into `index.jsx`.

Similarly, we can group the `ProductListItem` and `ProductList` into `ProductList` folder and rename the `ProductList.jsx` into `index.jsx`:

```bash
src/
|-- components/
|   |-- Product/
|       |-- index.jsx
|       |-- Carousel.jsx
|   |-- ProductList/
|       |-- index.jsx
|       |-- ProductListItem.jsx
```

## Extract common components

In both the product list page and the product detail page, the page headers share a similar UI, with the only difference being the presence of a back button on the product detail page:

<image>header-component-extraction.jpeg</image>

However, we are writing the same JSX in the `ProductList` and `Product` components. To eliminate redundancy, we can extract the common code into a component named `Header.jsx`. We can add two props, `title` and `shouldShowBackButton`, to make it flexible. Since both the `Product` and `ProductList` components need to use this, we will keep it inside a separate folder `src/components/commons`.

```jsx
import { LeftArrow } from "neetoicons";
import { Typography } from "neetoui";
import { useParams, useHistory } from "react-router-dom";

const Header = ({ title, shouldShowBackButton = true }) => {
  const history = useHistory();

  return (
    <div className="m-2">
      <div className="flex items-center">
        {shouldShowBackButton && (
          <LeftArrow
            className="hover:neeto-ui-bg-gray-400 neeto-ui-rounded-full mr-6"
            onClick={history.goBack}
          />
        )}
        <Typography style="h1" weight="semibold">
          {title}
        </Typography>
      </div>
      <hr className="neeto-ui-bg-black h-1" />
    </div>
  );
};

export default Header;
```

Now, you can use the `Header` component inside the `Product` and `ProductList` components by passing the necessary props:

```jsx {2, 6-7, 11}
// ProductList/index.jsx
<Header shouldShowBackButton={false} title="Smile Cart" />

// Product/index.jsx
return(
  <>
    <Header title={name} />
    <div className="mt-16 flex gap-4">
      {/* rest of the code */}
    <div>
  </>
);
```

We can also create a separate component for `PageLoader` to avoid code repetition and use it inside `Product` and `ProductList` components:

```jsx
import { Spinner } from "neetoui";

const PageLoader = () => (
  <div className="flex h-screen w-full items-center justify-center">
    <Spinner />
  </div>
);

export default PageLoader;
```

Similarly, the `PageNotFound` component, which is not specific to any page, can also be moved into the `src/components/commons` folder.

Here is how the folder structure will look like after refactoring:

```bash
src/
|-- components/
|   |-- commons/
|       |-- Header.jsx
|       |-- PageLoader.jsx
|       |-- PageNotFound.jsx
|   |-- Product/
|       |-- index.jsx
|       |-- Carousel.jsx
|   |-- ProductList/
|       |-- index.jsx
|       |-- ProductListItem.jsx
```

## Exporting multiple components from a namespace

Examining the directory structure above, you will notice that we are exporting multiple components from the commons folder, resulting in several imports under the `components/commons` namespace:

```js
import Header from "components/commons/Header";
import PageLoader from "components/commons/PageLoader";
import PageNotFound from "components/commons/PageNotFound";
```

To reduce the number of import statements, we will introduce a file `index.js` within the `components/commons` directory to group these exports.

Create an `index.js` file inside the `src/components/commons` folder and export all the components from the `commons` folder as shown:

```js
import Header from "./Header";
import PageLoader from "./PageLoader";
import PageNotFound from "./PageNotFound";

export { Header, PageNotFound, PageLoader };
```

After adding the above `index.js` file, we can replace the multiple imports from `components/commons` with a single import like this:

```js
import { Header, PageNotFound, PageLoader } from "components/commons";
```

To learn more about code structuring, check out [this lesson](https://courses.bigbinaryacademy.com/learn-react/miscellaneous/structuring-code) in the miscellaneous section.

Ensure that the application works properly as before after refactoring the code.

Let's commit the new changes:

```bash
git add -A
git commit -m "Added product listing page"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/22a9cb2088d448a8d0b0bf838d039947af8e00fe).
