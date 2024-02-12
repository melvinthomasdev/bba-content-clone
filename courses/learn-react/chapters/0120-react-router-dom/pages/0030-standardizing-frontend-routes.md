While dealing with code in large and complex applications containing a large number of routes, we encountered an issue with the searchability of components and links corresponding to a given path.

Consider that we need to search for the component corresponding to the path `"settings/general/users/a4cf-4efd-582a-38d3/manage-profile"` in an application. But we don't know whether the path segment `a4cf-4efd-582a-38d3` is referred to as `:id`, `:user_id` or with some other name in the codebase. Consequently, finding the corresponding `<Route>` or components with navigation to this route via `<Redirect>`, `<Link>`, etc., becomes a difficult task.

To overcome the above issue, we introduced a standard to keep all the routes in our application in a `route.js` file under the `src` directory as an object with static segments of the URL as the object path for the routes.

For example, if the route corresponding to the URL `"settings/general/users/a4cf-4efd-582a-38d3/manage-profile"` is `"settings/general/users/:id/manage-profile"`, then it would be stored in the `src/routes.js` file as shown below along with all other routes in the application.

```js
// src/route.js

const routes = {
  settings: {
    general: {
      users: {
        manageProfile: "settings/general/users/:id/manage-profile",
      },
    },
  },
  login: "/login",
  // ...other routes
};

export default routes;
```

We will use the above route by importing the `routes` object and passing the object path for the route like this:

```jsx
import routes from "routes";

<Route path={routes.settings.general.users.manageProfile} component={UserProfile} />
```

Defining routes like this enables us to search the occurrences of a route by typing in the static parts of the URL, which was difficult when we used strings and template literals. To search for the component or links corresponding to the URL `"settings/general/users/a4cf-4efd-582a-38d3/manage-profile"`, we only need to search for the occurrences of `settings.general.users.manageProfile` in our editor.

Moreover, declaring and default exporting routes object provides us autocompletion for routes, making the development experience better:

<image>routes-ide-support.gif</image>

Let's implement this in our project. First, create a `routes.js` file under `src`:

```bash
touch src/routes.js
```

From the `App` component, you can see that our project has three routes: "/", "/products", and "/products/:slug". We need to organize them in the `routes` object. We will keep the root URL "/" as `routes.root`. Since the static part of "products" and "products/:slug" are the same, we will create two keys `index` and `show` inside the `products` key to distinguish between them. The `index` key indicates the listing route and the `show` key for the individual product route. Here is how the `routes.js` file will look like:

```js
const routes = {
  root: "/",
  products: {
    index: "/products",
    show: "/products/:slug",
  },
};

export default routes;
```

While defining the `routes` object, it is important to ensure that the object path matches the corresponding route. However, in our case, we have added extra keys to the object path to have unique keys for "/products" and "/products/:slug". Also, note that we have not included the slug as the object key to make the object path deterministic by avoiding the dynamic segments in the object path.

Now, replace the hardcoded routes in the `App` component:

```jsx
import routes from "routes";
//remaining imports

const App = () => (
  <Switch>
    <Route exact component={Product} path={routes.products.show} />
    <Route exact component={ProductList} path={routes.products.index} />
    <Redirect exact from={routes.root} to={routes.products.index} />
    <Route component={PageNotFound} path="*" />
  </Switch>
);
```

Although we repeat the `routes.products` key here, we haven't destructured it as shown below.

```js
const { show, index } = routes.products
```

Instead, we've used the complete object path. This choice is deliberate because our aim is to enhance the searchability of route usages, requiring the full object path.

Now that we have replaced all the hardcoded paths in the `<Route>` components, we should also replace the template string passed as a prop to the `Link` component. However, we should not store the template string ``` `/products/$slug` ``` into the `route.js` file.

Instead, we will create a utility function `buildUrl` to generate a URL from a string like "products/:slug" and an object containing dynamic values in a URL like `{ slug: "mens-cotton" }`. We will pass the routes object path to this function. We should be able to use the `buildUrl` function in our `ProductListItem` component as shown below:

```jsx {3}
<Link
  className="neeto-ui-border-black neeto-ui-rounded-xl flex w-48 flex-col items-center justify-between border p-4"
  to={buildUrl(routes.products.show, { slug })}
>
```

This approach allows us to look up the links to a path as we did for the `<Route>` components.

Now, let's define the `buildUrl` function. Given that this function will be utilized throughout the application, we'll place it under `src/utils`. Create a `url.js` file under `src/utils` for this:

```bash
mkdir src/utils
touch src/utils/url.js
```

The `buildUrl` function should accept a string representing routes with dynamic placeholders like `:slug`, `:id`, etc. Additionally, it should take an object containing key-value pairs representing the dynamic parts and their values. For instance, if our route includes `:id`, the params object would have a key `id` with its respective value, like this:

```jsx
routes.users.manageProfile = "/users/:id/manage-profile"
buildUrl(routes.users.manageProfile, { id: userId })
```

The `buildUrl` function will prepare the URL string with the dynamic value: `/products/${slug}`. However, instead of simple interpolation, we will encode the value using the [encodeURIComponent](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent) function. This encoding ensures that any special characters within the provided parameters are converted into a valid URL format. For instance, if we pass a name parameter with the value "John Doe", it will be converted to "John%20Doe," where "%20" represents the [UTF-8](https://developer.mozilla.org/en-US/docs/Glossary/UTF-8) code for space:

```js
import { toPairs } from "ramda";

export const buildUrl = (route, params) => {
  toPairs(params).forEach(([key, value]) => {
    if (route.includes(`:${key}`)) {
      route = route.replace(`:${key}`, encodeURIComponent(value));
    }
  });

  return route;
};
```

In addition to passing parameters as path segments, it's common to include query strings in the URL to send additional information. For instance, when a user is searching for a specific term in a search engine, the URL might look like this: www.google.com/search?q=bigbinary%20academy. In this URL, `q=bigbinary%20academy` is the query string, where `q` is the parameter for the `search` query and `bigbinary academy` is the value being searched.

To accommodate this, the `buildUrl` function needs to accept query parameters along with the params argument. As query parameters are passed with the params object, which also contains values for generating path segments, we will filter the keys used for path segments into an array called `placeHolders` and exclude them from the query parameters.

```js {4, 7, 12}
import { toPairs, omit } from "ramda";

export const buildUrl = (route, params) => {
  const placeHolders = [];
  toPairs(params).forEach(([key, value]) => {
    if (route.includes(`:${key}`)) {
      placeHolders.push(key);
      route = route.replace(`:${key}`, encodeURIComponent(value));
    }
  });

  const queryParams = omit(placeHolders, params);

  return route;
};
```

We'll adopt snake case for naming query parameter keys in the URL.  So our next step entails converting the type case of `queryParams` object keys to snake case, utilizing the curried function `keysToSnakeCase` available in the `neetocist` library. Considering multiple transformations to be applied to the `params` object, we will employ `pipe` from Ramda to execute them sequentially.

```js {1, 2, 13-16}
import { keysToSnakeCase } from "neetocist";
import { toPairs, omit, pipe } from "ramda";

export const buildUrl = (route, params) => {
  const placeHolders = [];
  toPairs(params).forEach(([key, value]) => {
    if (route.includes(`:${key}`)) {
      placeHolders.push(key);
      route = route.replace(`:${key}`, encodeURIComponent(value));
    }
  });

  const queryParams = pipe(
    omit(placeHolders),
    keysToSnakeCase,
  )(params);

  return route;
};
```

Now that we have the valid query parameters as an object, we will create the query string using the [stringify](https://www.npmjs.com/package/qs#stringifying) function from the [qs](https://www.npmjs.com/package/qs) package. The stringify function converts an object into a string of the form `key1=value1&key2=value2` after encoding both keys and values. Finally, if `queryParams` is not empty, we will append it to the route followed by the `?` symbol, adhering to the URL format.

```js {2-3, 18, 21}
import { keysToSnakeCase } from "neetocist";
import { stringify } from "qs";
import { isEmpty, toPairs, pipe, omit } from "ramda";

export const buildUrl = (route, params) => {
  const placeHolders = [];
  toPairs(params).forEach(([key, value]) => {
    if (route.includes(`:${key}`)) {
      placeHolders.push(key);
      route = route.replace(`:${key}`, encodeURIComponent(value));
    }
  });

  const queryParams = pipe(
    omit(placeHolders),
    keysToSnakeCase,
    stringify
  )(params);

  return isEmpty(queryParams) ? route : `${route}?${queryParams}`;
};
```

Now, we can use the above function to generate URLs dynamically, passing the `route` and `params`. Pass the path prepared using `buildUrl` to the `Link` component in the `ProductListItem` component:

```jsx {1-2, 7}
import routes from "routes";
import { buildUrl } from "utils/url";
//...

<Link
  className="neeto-ui-border-black neeto-ui-rounded-xl flex w-48 flex-col items-center justify-between border p-4"
  to={buildUrl(routes.products.show, { slug })}
>
```

While this standardization may not seem to provide substantial value for our small project, given the effort involved, it significantly assists developers in navigating through the code within a large codebase.

Now, it's time to commit the changes. As we haven't made any functional changes to our application, it should continue to work as before.

```bash
git add -A
git commit -m "Standardized frontend routes"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/a21f5b39cf122083e6d558b5f331abd4ebce6eb8).
