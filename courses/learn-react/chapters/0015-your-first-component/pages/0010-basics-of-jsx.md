JSX is a syntax through which you can write HTML-like code inside JavaScript.

React is almost always used in combination with JSX and thus, has become a
necessary first step for budding React developers.

Here's an example of a simple piece of JSX code:

```jsx
<div>
  <h1>Hello World!</h1>
  <h2>Let's get started with React</h2>
</div>
```

If you're already familiar with HTML, the code above should seem very intuitive.

However, there are a few key differences between HTML and JSX to keep in mind:

- There must always be exactly one root element such as the `div` container in
  the above example.
- All tags must be closed. `<li>apple` must be converted to `<li>apple</li>`.
- JSX uses camelCase. Tag attributes like `onclick` become `onClick` in JSX.

We will be explaining these rules in detail in the next chapter but for now,
let's create our first component.
