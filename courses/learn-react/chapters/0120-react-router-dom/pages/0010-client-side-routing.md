In traditional websites, the browser requests a document from a web server, downloads and evaluates CSS and JavaScript assets, and renders the HTML sent from the server. When the user clicks a link, it starts the process all over again for a new page.

In contrast, most modern applications use a process called **Client side routing**, which allows applications to update the URL from a link click and immediately render some new UI without making another request for another document from the server.

This enables faster user experiences because the browser doesn't need to request an entirely new document or re-evaluate CSS and JavaScript assets for the next page. It also facilitates more dynamic user experiences with things like animation.

In this chapter, we will learn how to implement **Client side routing** with the help of **React Router**, a popular routing library for React. React router enables us to implement client-side routing by specifying the components to be rendered for each URL declaratively. React router will render respective components based on the current URL.

To utilize React Router in a web application, we should install the package `react-router-dom`. Even though the latest version of React Router is v6, we will be using v5 in this course. React Router v6 was released recently with significant architectural changes from v5. It takes a lot of work to migrate to v6. So, most of the products you will encounter today will be using v5 because, in most cases, there aren’t many significant advantages in migrating. So, we will also go with v5 because the goal of this book is to prepare you for the industry. If interested, you can utilize the [official documentation](https://reactrouter.com/en/main/start/tutorial) to learn v6 architecture.

Now, let's get started by adding `react-router-dom` to our project by executing the command below:

```bash
 yarn add react-router-dom@5.3.2
```

React Router offers a range of components and hooks for various purposes, such as tracking the current URL, managing browser history, updating URLs on user clicks, and rendering specific components based on URL matches.

`BrowserRouter` is an important component among them. It serves as a wrapper around the entire application, enabling routing functionality by allowing other React Router components to interact with the browser's URL. It utilizes the HTML5 history API to synchronize the UI with the URL, stores the current location in the browser's address bar, and navigates through the built-in history stack.

Let's wrap the `App` component in the `src/index.jsx` with the `BrowserRouter` to enable routing in our application.

```jsx {1, 6, 8}
import { BrowserRouter } from "react-router-dom";
// remaining code

root.render(
  <React.StrictMode>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </React.StrictMode>
);
```

Next, we will implement routing in our application by adding links to switch between two components: `Home` and `Product`. We will render the `Home` component for the root URL ("/"), i.e., http://localhost:3000, and the `Product` component for the "/product" URL (http://localhost:3000/product).


We already have the `Product` component ready with us. Let's create a `Home` component under the components directory. Add JSX to display a title, 'Smile Cart', and include placeholder text 'Home' as the content:

```jsx
import { Typography } from "neetoui";

const Home = () => (
  <div className="flex flex-col">
    <div className="m-2">
      <Typography className="mx-6 mb-2 mt-6" style="h1" weight="semibold">
        Smile Cart
      </Typography>
      <hr className="neeto-ui-bg-black h-1" />
    </div>
    <Typography className="mx-auto" style="h2">
      Home
    </Typography>
  </div>
);

export default Home;
```

Now, let's head back to the `App` component and add two links to the URLs: **/** and **/product**. React router provides the `Link` component to create navigation links. Even though the `Link` component uses the anchor tag `<a>` under the hood, it updates the URL without full page reloads.

The `Link` component accepts the prop `to` to specify the URL:

```jsx
import { Link } from "react-router-dom";

const App = () => (
  <div className="flex space-x-2">
    <Link to="/">Home</Link>
    <Link to="/product">Product</Link>
  </div>
);

export default App;
```

Now you should be able to navigate between the root URL and the product URL:

<image>links.gif</image>

The next step is to render the `Home` component and the `Product` component for the respective URLs. The `Route` component from React Router enables this by accepting the `path` and `component` prop. If the current URL matches the `path`, it renders the `component` specified.

Let's add routes to `Home` and `Product` component in our app:

```jsx {1, 3-4, 7, 12-14}
import { Link, Route } from "react-router-dom";

import Home from "./components/Home";
import Product from "./components/Product";

const App = () => (
  <>
    <div className="flex space-x-2">
      <Link to="/">Home</Link>
      <Link to="/product">Product</Link>
    </div>
    <Route component={Home} path="/" />
    <Route component={Product} path="/product" />
  </>
);

export default App;
```

Now, try clicking the `Home` and `Product` links. You can see that the root URL renders the `Home` component. But the product URL renders both the `Home` and `Product` components, which was not expected.

<image>without-switch-and-exact-prop.gif</image>

This happens because, by default, the `Route` component doesn't perform an exact match of the current URL and path. Instead, if the specified path is a prefix of the current URL, it renders the associated component. In this case, the route "/" matches the "/product" URL because "/product" starts with "/". So both the routes "/" and "/product" will be rendered when the user visits "/product" URL.

However, if you want to ensure that the route only matches when the current URL and the specified path are the same, you can use the `exact` prop:

```jsx
<Route exact component={Home} path="/" />
<Route exact component={Product} path="/product" />
```

Now, the links would work as expected:

<image>with-exact-prop.gif</image>

While the above code works as intended, we will encapsulate the `Route` components within the `Switch` component from the React Router. The `Switch` component renders the first child `Route` that matches the location, rendering only one `Route` component inside the `Switch` at a time. Moreover, the `Switch` component halts when it encounters the first route that matches the current location, thus enhancing the efficiency of the code.

```jsx {1, 10, 13}
import { Link, Route, Switch } from "react-router-dom";
// remaining imports

const App = () => (
  <>
    <div className="flex space-x-2">
      <Link to="/">Home</Link>
      <Link to="/product">Product</Link>
    </div>
    <Switch>
      <Route exact component={Home} path="/" />
      <Route exact component={Product} path="/product" />
    </Switch>
  </>
);
```

Since the `Switch` component renders the first matching route, the order in which you define the routes becomes significant when there are multiple matches.

For example, in the below route declaration, since the "/product" URL matches the first route with the path "/", the `Switch` will render the `Home` component.

```jsx
<Switch>
  <Route component={Home} path="/" />
  <Route component={Product} path="/product" />
</Switch>
```

To handle this, it's a good idea to place common or basic routes at the end of the `Switch` component:

```jsx
<Switch>
  <Route component={Product} path="/product" />
  <Route component={Home} path="/" />
</Switch>
```

At present, navigating to any URL other than "/" or "/product" in our application by directly inputting the URL in the address bar leads to an empty page.

<image>without-404.png</image>

For a seamless user experience, it's essential to address such scenarios where users navigate to a location not defined within our application or isn't accessible to them. React Router provides a way to render fallback components to handle such unmatched routes.

Let's add a `PageNotFound` component as a fallback component to display a helpful message when a user navigates to an undefined route.

First, let's create a `PageNotFound` component. You can use the following `JSX` to define the component:

```jsx
import { NoData } from "neetoui";

const PageNotFound = () => (
  <div className="absolute left-1/3 top-1/3">
    <NoData
      title="The page you're looking for can't be found"
      primaryButtonProps={{
        label: "Back to home",
        className: "bg-neutral-800 hover:bg-neutral-950",
        to: "/",
      }}
    />
  </div>
);

export default PageNotFound;
```

Next, to render this component when the user navigates to a route other than the root URL or product URL, we only need to add a `Route` component to the end of the `Switch` block with the path as "*" and the component as `PageNotFound`. It's that simple.


```jsx {1, 8}
import PageNotFound from "./components/PageNotFound";
// remaining imports

const App = () => (
  <Switch>
    <Route exact component={Home} path="/" />
    <Route exact component={Product} path="/product" />
    <Route component={PageNotFound} path="*" />
  </Switch>
);
```

As we learned earlier, the `Switch` component renders the first matched child `Route`. Since the first two routes don't match, it checks the path of the last `Route`. The wildcard character * matches any location, thus rendering the `PageNotFound` component.

Now, when navigating to a URL other than "/" or "/product", you will be directed to the `PageNotFound` component.

<image>with-404.png</image>

To enhance the user experience further, we can use the `NavLink` component, a special version of the `Link` that will add styling to the rendered element when it matches the current URL. `NavLink` component accepts the `activeClassName` prop for this:

```jsx {1, 6-11}
import { Route, Switch, NavLink } from "react-router-dom";

const App = () => (
  <>
    <div className="mx-4 flex space-x-2">
      <NavLink exact activeClassName="underline font-bold" to="/">
        Home
      </NavLink>
      <NavLink exact activeClassName="underline font-bold" to="/product">
        Product
      </NavLink>
    </div>
    {/* remaining code */}
  </>
);

export default App;
```

After making the above change, the active link will be rendered with an underlined and bold text:

<image>routing-with-navlink.gif</image>

With this, we have covered the basics of client-side routing. In the next lesson, we will build upon these concepts to create a product listing page to display a set of product thumbnails and add navigation to the corresponding product details page upon clicking those thumbnails.

Let's commit the new changes:

```bash
git add -A
git commit -m "Added routing functionality"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/9b9f4e1bde61ad9b7f939a78fe3e4cd893397c91).
