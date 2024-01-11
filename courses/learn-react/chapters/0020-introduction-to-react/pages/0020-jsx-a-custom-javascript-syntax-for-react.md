
React element is the smallest building block of React application. It is just a plain object that tells React what we want to see on the screen. React components are built using React elements.

Consider the following HTML:

```html
<h1 class="chapter-title">Hello World!</h1>.
```

The React Element for the above HTML will look like this:

```jsx
{
  type: "h1",
  props: {
    className: "chapter-title",
    children: "Hello World!"
  },
  key: null,
  ref: null,
  _owner: null,
  _store: {}
}
```

React uses this object representation to build nodes in React DOM.

Note that the `class` attribute of the `h1` tag is provided as the `className` property of React Element. It is because `class` is a reserved keyword in JavaScript for defining [classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes), and JavaScript follows `camelCase` for naming object properties.

The `createElement` function from React lets you create such React elements. You can use it this way:

```jsx
import { createElement } from "react";

const REACT_ELEMENT = createElement(type, props, ...children)
```

Here the first argument, `type`, can be a string specifying an HTML tag such as `"h1"` or `"p"`.

The second argument, `props`,  is used to supply the attributes that need to be attached to the previously specified HTML element. It can be any native HTML element attributes like `id`, `name`,  `src`, `width`, `height`, etc., or renamed attributes, like `className`, `onClick`, etc. `props` should be either an `object` or `null`.

The optional rest parameter `...children` receive zero or more child nodes.

The `createElement` function returns React element object.

Below is an example of `createElement` function usage:

```jsx
const GREETINGS = createElement("h1", { className: "chapter-title" }, "Hello World!");
```

It corresponds to the following HTML output:

```html
<h1 class="chapter-title">Hello World!</h1>
```

Note that creating React element does not render it to DOM. It only creates an object called React element in the memory. We can use the `render` function from React to convert the React element to an HTML element and attach it to the DOM. We will learn about that later.

Let's see one more example of `createElement` usage.

Consider the following HTML code:

```html
<div class="card">
  <div class="thumbnail">
    <img src="link" />
  </div>
  <div class="content">
    <h2>Title</h2>
    <p>Description</p>
  </div>
</div>
```

We would create the React Element corresponding to the above HTML code like this:

```jsx
const CARD_REACT_ELEMENT = createElement(
  "div",
  { className: "card" },
  createElement(
    "div",
    { className: "thumbnail" },
    createElement("img", { src: "link" })
  ),
  createElement(
    "div",
    { className: "content" },
    createElement("h2", null, "Title"),
    createElement("p", null, "Description")
  )
);
```

That's a lot of work, right? Also pretty hard to read.

To avoid this kind of boilerplate code, React introduced a custom syntax for JavaScript, named JavaScript XML or JavaScript Syntax Extension, abbreviated as JSX. With JSX, we can write HTML-like markup inside a JavaScript file.

Here is what the code will look like with JSX.

```jsx
const CARD_REACT_ELEMENT = (
  <div className="card">
    <div className="thumbnail">
      <img src="link" />
    </div>
    <div className="content">
      <h2>Title</h2>
      <p>Description</p>
    </div>
  </div>
);
```

Under the hood, React converts these JSX tags into React elements by replacing them with `createElement` calls. Such conversions of source code from one format to another are termed as ***Transpiling***. We will dive into this concept later.

Now that we have introduced JSX, let's now explore what a React component is and how we can utilize JSX to build them in the next chapter.
