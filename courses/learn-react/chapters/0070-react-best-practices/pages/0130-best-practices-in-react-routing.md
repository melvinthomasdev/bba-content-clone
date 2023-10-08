## Navigating using window.location.href vs history API

It is often required to re-route the application to a different component.
Developers sometimes use `window.location.href` instead of the history API for
this purpose.

It is very important to understand the difference between the two and when to
use them.

- `window.location` object contains the information about the current page
  address(URL). It also contains a method called `href` to change the current
  page location. `window.location.href` accepts an URL and it redirects the
  browser to the provided address. It is like visiting a new page.

- React router's `history` API makes use of the HTML5 history API. Passing a URL
  or path to `history.push` pushes that URL as a new history to the history
  stack. `history.push` does not revisit the page. It navigates the application
  to another component.

`window.location.href` should be used for navigating to a different webpage.
Another use case of `window.location.href` is navigating to the login page upon
a successful logout. This is so because a React app contains the user
information as well as other sensitive data in state which should only be
accessible to a logged in user.

If you navigate to the `login` page using `history.push`, the state might be
preserved since the app is not reloaded. This is not the case with
`window.location.href`. The latter reloads the application and all application
state is reset.

`history.push` should be used for in-app navigation as it preserves the
application state and also provides a way to navigate using the navigation
buttons in the browser's toolbar since the locations are stored as items in the
history stack.

## Using `<a>` tag vs `<Link>`

`<a>` tag is used to create a hyperlink. It accepts a url and redirects to that
URL when the hyperlink is clicked. Using the `<a>` tag is not the React way of
routing because it reloads the whole page even if the application is directed to
a different page within the same application.

If the page is reloaded during in-app navigation then you won't be able to reap
the benefits of a single page application. In React, the `Link` API from
`react-router` should be used for in-app navigation. It doesn't reload the page
during navigation and preserves the application state.

To learn more about the `Link` API you can refer to the
[official documentation](https://v5.reactrouter.com/web/api/Link) of
`react-router`.

## Prefer render prop over children in the router

We can add a route in any React app using the `component` and `path` prop in the `Route` component, like this:

```jsx
<Route path="/" component={Dashboard} />
```

But how can we pass some props into this `Dashboard` component?

We can pass props by rendering an inline function that renders the `Dashboard` component with the required props, like this:

```jsx
<Route path="/" component={() => <Dashboard name={name} />} />
```

But if we pass an inline function to the `component` prop, then it would create a new component on every render. This results in unmounting the existing component and mounting the new component instead of just updating the existing one.

Here we can use the `render` and `children` props which accept the inline functions for rendering.
Both of these props work the same but if we are using the `children` prop, then it will be called even if the `path` is not matched and that's the reason `render` is preferred over the `children` prop.

For example:

```jsx
<Route path="/" render={() => <Dashboard name={name} />} />
```

We can optionally pass the route props, that is `match`, `location`, and `history`, inside the `render` function, like this:

```jsx
<Route
  path="/"
  render={routeProps => <Dashboard name={name} {...routeProps} />}
/>
```

For more details about `render` prop, check out the [official documentation](https://v5.reactrouter.com/web/api/Route/render-func) of `react-router`.

**Please note that we are still using react router version 5. Version 6 has
major breaking changes and we haven't still adopted it yet in our codebases**.
