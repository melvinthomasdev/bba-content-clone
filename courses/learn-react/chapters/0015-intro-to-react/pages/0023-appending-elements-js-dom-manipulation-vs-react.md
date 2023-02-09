Now, let's see how we append the `h1`
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

Look at how we append that `h1`
inside the **root div** using JavaScript:

```js
root.appendChild(mainHeading);
```

Now, this is how we append that `h1`
inside the **root div** using React:

```js
const ReactRoot = ReactDOM.createRoot(root);
ReactRoot.render(mainHeading);
```

With plain JavaScript, we append
our heading to the root element which is
the `div` element with the id `root`. For this,
we use a single method called `appendChild`.

In the case of React, we use two methods
provided by ReactDOM, `createRoot` and `render`.

By passing the root element
as an argument to `createRoot`,
we create a **React root**.

We then call the `render` method
on this **react root**. For `render`
method, we pass in whatever element
we want inside this root, which in our case,
is the `mainHeading` that we created.

As you read about React above, we
also need to connect a script
where the definition for ReactDOM
methods like `createRoot` or `render`
are given.

```html
<!-- React DOM -->
<script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
```
