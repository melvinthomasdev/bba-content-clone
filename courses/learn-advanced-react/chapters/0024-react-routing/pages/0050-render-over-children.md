Please note that the information given here is regarding React Router version 5.

As shown before, to add a route, we just need a `component` and `path` prop in the `Route` component, like this:

```jsx
<Route path="/" component={Dashboard} />
```

But how do you pass props into the `Dashboard` component if you need to?

Although the easiest method is to just render an inline function with the props embedded like this:

```jsx
<Route path="/" component={() => <Dashboard name={name} />} />
```

The problem is that the above example creates a new component on every render, unmounting and mounting rather than just updating.

Here we can use the `render` or `children` prop which accepts an inline function for rendering. The `children` prop works exactly like `render` except that it gets called whether there is a match or not. Thus, while both props work, the `render` prop is preferred over the `children` prop.

Here's an example of the render prop in use:

```jsx
<Route path="/" render={() => <Dashboard name={name} />} />
```

For more details about the `render` prop, check out the [official documentation](https://v5.reactrouter.com/web/api/Route/render-func) of React Router v5.
