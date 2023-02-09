Till now, you have used
HTML and CSS to build good
looking webpages. Later, we added
JS to achieve interactivity.
Now, we are about to learn React.

Look at this code:

<codeblock language="html" type="lesson">
<code>
<div id="root"></div>
</code>
</codeblock>

Here, let us try to do this:
1. Select the root div element.
2. Create an `h1` element.
3. Append that `h1` element inside the `div`with the id `root`.

## Firstly, let's make HTML Changes

In this example given above,
we have an empty `div` with an
`id` value of `root`. We need to add
an `h1` inside this `div` with the
content **React will give you wings!**
with an `id` value of `main-heading`
and a `class` value of `heading`.

<codeblock language="html" type="lesson">
<code>
<div id="root">
  <h1 id="main-heading" class="heading">React will give you wings!</h1>
</div>
</code>
</codeblock>

## Now, let's use JavaScript to manipulate the DOM

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

## Finally, let's build the same thing, using React

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

You don't need to understand the
React code for now. But note that in
both the JavaScript code, as well as
React, this part remains the same:

```js
const root = document.querySelector("#root");
```

This is how we are selecting the root
`div` element.