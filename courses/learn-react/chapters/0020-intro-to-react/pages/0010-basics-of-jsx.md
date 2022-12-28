JSX is a syntax through which you can write HTML-like code inside JavaScript.

React is almost always used in combination with JSX and thus, has become a necessary first step for budding React developers.

Here's an example of a simple piece of JSX code:

```jsx
{/* JSX */}
<>
  <h1>Hello World!</h1>
  <h2>Let's get started with React</h2>
</>
```

If you're already familiar with HTML, the code above should seem very intuitive.

However, there are a few key differences between HTML and JSX to keep in mind.

## JSX uses camelCase

Since JSX is closer to JavaScript than HTML, almost all attributes in a tag are camelCased when compared to their HTML counterparts.

For example:  `<div onclick=...>` turns into `<div onClick=...>`.

Also, `class` is a reserved word in React and thus, we need to use the `className` attribute instead. For example:

```jsx
{/* JSX */}
<div className="greetingBox">
  Hello World!
</div>
```

## All tags must be closed

Unlike HTML, you can't use closing and wrapping tags in JSX.

Elements such as `<img>`, `<hr>`, `<input>` and `<br>` do not necessarily need to be closed in raw HTML, but they **must** be closed in JSX.

Elements such as `<li>` which can be written as `<li>apple` in HTML must be closed in JSX with a closing tag like so:  `<li>apple</li>`.
Similarly, `<br>` (breakpoints) can be written as `<br />` instead.

A few examples of such conversions are shown below:

```jsx
{/* JSX */}
<div>
  <img
    src="https://xyz.com/abc.jpg"
    alt="Fruit Salad"
  />
  <br />
  <ul>
    <li>apples</li>
    <li>oranges</li>
    <li>grapes</li>
  </ul>
</div>
```