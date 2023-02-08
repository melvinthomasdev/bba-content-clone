You have used HTML and CSS to built good looking webpages and then later added JS to achieve interactivity, and now we are about to learn React.

<codeblock language="html" type="lesson">
<code>
<div id="root"></div>
</code>
</codeblock>
Let us do a challenge.
To start with, we have an empty `div` above with an `id` value of `root`. We need add a `h1` inside this div with the content "We are from BB Academy" with an `id` value of `main-heading` and a `class` value of `heading`.

## First with HTML

<codeblock language="html" type="lesson">
<code>
<div id="root">
  <h1 id="main-heading" class="heading">We are from BB Academy</h1>
</div>
</code>
</codeblock>

This would probably the first thing we all learned in HTML.

## Now with JavaScript by manipulating the DOM

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div id="root"></div>
</panel>
<panel language="javascript">
const root = document.querySelector("#root");
const mainHeading = document.createElement('h1');
mainHeading.textContent = "We are from BB Academy";
mainHeading.id = 'main-heading';
mainHeading.className = 'heading';
root.appendChild(mainHeading);
</panel>
</code>
</codeblock>

## Now the same using React

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
  children: "We are from BB Academy"
});
const ReactRoot = ReactDOM.createRoot(root);
ReactRoot.render(mainHeading);
</panel>
</code>
</codeblock>

In the next lesson, we will discuss in detail the React code by comparing it with the plan JS code.
