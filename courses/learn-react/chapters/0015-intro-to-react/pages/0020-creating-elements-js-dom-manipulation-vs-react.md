Now, let's see how we create the `h1`
element in JavaScript as compared to React:

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

Here is the same thing in React:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div id="root">
</div>
<!-- React -->
<script crossorigin src="https://unpkg.com/react@18/umd/react.development.js"></script>
<!-- React DOM -->
<script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
</panel>
<panel language="javascript">
const root = document.querySelector("#root");
const mainHeading = React.createElement('h1', {
  id: "main-heading",
  className: "heading",
  children: "React will give you wings!"
});
const ReactRoot = ReactDOM.createRoot(root);
ReactRoot.render(mainHeading);
</panel>
</code>
</codeblock>


Let's extract our code from
the above examples:


JavaScript:

```js
const mainHeading = document.createElement('h1');
mainHeading.textContent = "React will give you wings!";
mainHeading.className = 'main-heading';
```

React:

```js
const mainHeading = React.createElement('h1', {
    id: "main-heading",
    className: "heading",
    children: "React will give you wings!"
});
```

This is where we first
use the term `React` in our code.

In the second example, we use the `createElement`
method provided by `React` and not
the one provided by `document`.

Similarity between the two
approaches is that in both
the functions, the first argument
provided is the element to be
created, in our case `h1`.

Then, unlike `document`,
we apply the properties for the `h1`
and the text content at the creation
itself by passing it as the second argument
for React's createElement object.

```js
{
    id: "main-heading",
    className: "heading",
    children: "React will give you wings!"
}
```

The document's `createElement` method
is by default defined in the browser,
so we can run the same without any
external resource as long as
JavaScript is allowed.

This is not the case with React.
The methods from React like `createElement`
are not something the
browser understands by default.

There are different ways to provide
this definition. A simple way is
by **connecting a script** where this
definition is given to us the
same way we connect any external
script to our HTML. This is the script
we used:

```html
<!-- React -->
<script src="https://unpkg.com/react@16.12.0/umd/react.development.js"></script>
```