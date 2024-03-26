## Navigating using `window.location.href` vs `history API`

It is often required to re-route the application to a different component. Developers sometimes use `window.location.href` instead of the history API for this purpose.

It is very important to understand the difference between the two and when to use them.

The `window.location` object contains the information about the URL of the current page. It also contains a property called `href`, that will tell you the URL location of the current web page. By assigning a URL to `window.location.href,` you can redirect the browser to the provided address. It is like visiting a new page.

```js
// Get the current URL
console.log(window.location.href);

// Redirect to a new URL
window.location.href = "https://www.example.com";
```

React router's `history` API makes use of the HTML5 history API. Passing a URL or path to `history.push` pushes that URL as a new history to the history stack. `history.push` does not revisit the page. It navigates the application to another component.

```js
history.push("/another-route");
```

`window.location.href` should be used for navigating to a different webpage. Another use case of `window.location.href` is navigating to the login page upon a successful logout. This is so because a React app contains the user information as well as other sensitive data in the state which should only be accessible to a logged in user.

If you navigate to the `login` page using `history.push`, the state might be preserved since the app is not reloaded. This is not the case with `window.location.href`. The latter reloads the application and all application state are reset.

`history.push` should be used for in-app navigation as it preserves the application state and also provides a way to navigate using the navigation buttons in the browser's toolbar since the locations are stored as items in the history stack.

## Using `<a>` tag vs `<Link>`

The `<a>` tag is used to create a hyperlink. It accepts a URL and redirects to that URL when the hyperlink is clicked. Using the `<a>` tag is not the React way of routing because it reloads the whole page even if the application is directed to a different page within the same application.

```html
<!-- Using <a> tag for redirecting to external link -->
<a href="https://www.example.com" target="_blank"> External Link </a>

<!-- Using <a> tag for in-app navigation (not recommended in React) -->
<a href="/about">Go to About Page</a>
```

If the page is reloaded during in-app navigation then you won't be able to reap the benefits of a single page application. In React, the `Link` API from `react-router` should be used for in-app navigation. It doesn't reload the page during navigation and preserves the application state.

```jsx
import React from "react";
import { Link } from "react-router-dom";

const App = () => (
  <div>
    <Link to="/about">Go to About Page</Link>
  </div>
);

export default App;
```

To learn more about the `Link` API you can refer to the [official documentation](https://v5.reactrouter.com/web/api/Link) of `react-router`.

## useRouteMatch react-router-dom hook

The `useRouteMatch` hook attempts to match the current URL in the same way that a `Route` would. It will contain the following properties:

- isExact: This is a boolean value, check if the entire URL was matched.
- params: This is an object that contains the variable part of the URL.
- path: A string that contains the path pattern used to match.
- url: A string that contains the matched portion of the URL.

```jsx
import { useRouteMatch } from "react-router-dom";

const App = () => {
  const match = useRouteMatch("/product/:slug");

  return <div>Now showing product for {match.params.slug}</div>;
};
```

Here `match.params.slug` provides the value for `slug` from the matched object.

We should use the `useRouteMatch` when we need the match data without actually rendering a `Route`.

## Passing Props to Components in React Route

To render a component for a specific route, we typically use the `component` prop in the Route component. However, if we need to pass props to the rendered component, it's better to use the `render` prop instead. This is because the `component` prop creates a new component on every render. As a result, the existing component is unmounted and a new one is mounted instead of just updating the existing component.

This is how we can pass props to a component using the `render` prop:

```jsx
<Route path="/" render={() => <Dashboard name={name} />} />
```

We can optionally pass the route props, that is `match`, `location`, and `history`, inside the `render` function, like so:

```jsx
<Route
  path="/"
  render={routeProps => <Dashboard name={name} {...routeProps} />}
/>
```

For more details about the `render` prop, check out the [official documentation](https://v5.reactrouter.com/web/api/Route/render-func) of `react-router`.

**Please note that we are still using React Router version 5. Version 6 has major breaking changes and we haven't still adopted it yet in our codebase**.

## Important reads

- To learn when we should not use the `exact` prop in a React route component refer to the [exact prop](https://courses.bigbinaryacademy.com/learn-rubyonrails/basics-of-react-router-dom/#route-component-and-associated-props) section in the "Basics of React Router Dom" chapter.

- To learn the real-world scenarios where we should not be embedding routes within the `Switch` component refer to the [Switch component](https://courses.bigbinaryacademy.com/learn-rubyonrails/basics-of-react-router-dom/#switch-component) section in the "Basics of React Router Dom" chapter.

- Refer [BrowserRouter component](https://courses.bigbinaryacademy.com/learn-rubyonrails/basics-of-react-router-dom/#browserrouter-component) section in the "Basics of React Router Dom" chapter to learn more about the `BrowserRouter` component and why it should be placed at the topmost level of the component hierarchy tree.
