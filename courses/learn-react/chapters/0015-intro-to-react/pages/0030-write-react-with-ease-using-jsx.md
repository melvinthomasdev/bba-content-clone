
Let us rewrite the HTML
DOM manipulation code with plain JS
using [innerHTML](https://academy.bigbinary.com/learn-htmldom/manipulating-dom-elements-part-1/updating-html-inside-an-element) to make it
easier to read
and
reduce the number of lines.

Here is our JavaScript code for manipulating
the DOM:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div id="root"></div>
</panel>
<panel language="javascript">
const root = document.querySelector("#root");
const mainHeading = document.createElement('h1');
mainHeading.textContent = "React will give you wings!";
mainHeading.id = 'main-heading';
mainHeading.className = 'heading';
root.appendChild(mainHeading);
</panel>
</code>
</codeblock>

Using `innerHTML`, this is how the code
will look:

```js
const root = document.querySelector("#root");
root.innerHTML = `<h1 id="main-heading" class="heading">React will give you wings!</h1>`
```

Even in React, we can reduce the
number of lines in our React code
and
make it easier to read by using
something called `JSX`.

JSX is a syntax through which you
can write HTML-like code inside
JavaScript.

React is almost always used
in combination with JSX and thus,
has become a necessary first
step for budding React developers.

Let us rewrite the React code
in the previous example using JSX.
The commented code is using
React's `createElement` directly
and
the one not is using `jsx`.

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
    children: "React will give you wings!"
  });
  */

  // using jsx
  const mainHeading = <h1 id="main-heading" className="heading">React will give you wings!</h1>

  const ReactRoot = ReactDOM.createRoot(root);
  ReactRoot.render(mainHeading);
</script>

</panel>

</code>
</codeblock>

If you're already familiar
with HTML, the code above
should seem very intuitive.