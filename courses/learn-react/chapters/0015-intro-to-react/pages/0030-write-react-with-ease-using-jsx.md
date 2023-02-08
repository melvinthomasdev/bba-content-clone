JSX is a syntax through which you can write HTML-like code inside JavaScript.

React is almost always used in combination with JSX and thus, has become a necessary first step for budding React developers.

Let us rewrite the React code in the previous example using JSX.
The commented code is using React's `createElement` directly and the one not is using `jsx`.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div id="root">
</div>
<!-- React -->
<script crossorigin src="https://unpkg.com/react@18/umd/react.development.js"></script>
<!-- React DOM -->
<script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
<!-- Babel -->
<script src="https://unpkg.com/@babel/standalone@7.8.3/babel.js"></script>
<script type="text/babel">
  const root = document.querySelector("#root");

  // using React createElement
  /*
  const mainHeading = React.createElement('h1', {
    id: "main-heading",
    className: "heading",
    children: "We are from BB Academy"
  }); 
  */

  // using jsx
  const mainHeading = <h1 id="main-heading" className="heading">We are from BB Academy</h1>

  const ReactRoot = ReactDOM.createRoot(root);
  ReactRoot.render(mainHeading);
</script>

</panel>

</code>
</codeblock>

If you're already familiar with HTML, the code above should seem very intuitive.

However, there are a few key differences between HTML and JSX to keep in mind.

## JSX uses camelCase

Since JSX is closer to JavaScript than HTML, almost all attributes in a tag are camelCased when compared to their HTML counterparts.

For example:  `<div onclick=...>` turns into `<div onClick=...>`.

Also, `class` is a reserved word in React and thus, we need to use the `className` attribute instead. For example:

```jsx
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
At all times, the JSX we are writing need to be conveted to corresponding `React.createElement` as the browser does not understand JSX natively. For our above code, this convertion or compiling is handled by a JS compiler called Babel.

Similar to how we loaded the `React` and `ReactDOM` definitions from the script, we have loaded everything we need from `Babel` using the third script above and also told which script need to be converted by adding a `type` attribute to script with a value `text/babel`. 

Before we move further, you might have noticed, we are manipulating the DOM and acheiving the same result with React that we had till now (in Level 1 and Level 2) achieved with plain JS.

Then why switch to React? We will talk more about it in the next and final chapter of Intro to React.