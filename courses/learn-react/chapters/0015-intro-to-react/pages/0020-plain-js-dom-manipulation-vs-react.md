Let us compare the React code above with the plain JavaScript code to manipulating the DOM by dividing it into 3 parts.

1. Selecting the root div element.
2. Creating an `h1` element.
3. Appending that `h1` element inside the root `div`. (`div` with the id `root`)

## Selecting the root div element.
This remains the same in both;

```js
const root = document.querySelector("#root");
```

## Creating an h1 element.

This is where we first encounter the term `React`.

```js
const mainHeading = document.createElement('h1');
mainHeading.textContent = "We are from BB Academy";
mainHeading.className = 'main-heading';
```

```js
const mainHeading = React.createElement('h1', {
    id: "main-heading",
    className: "heading",
    children: "We are from BB Academy"
});
```

In the second example we use the `createElement` method provided by React and not document. This method is slightly different as you can see from the above example.
Similar to document's `createElement`, the first argument provided is the element to be created, in our case `h1`.

Then, unlike with document, we apply the properties for the `h1` and the text content at the creation itself by passing it as the second argument for React's createElement an object.

```js
{
    id: "main-heading",
    className: "heading",
    children: "We are from BB Academy"
}
```

The document's `createElement` method is by default defined in the browser, so we can run the same without any external resource as long as JavaScript is allowed. 

This is not the case with React. The methods from React like `createElement` are not something browser understands by default.

There are different ways to provide this definition, one simple way is by connecting a script where this definition is given to us the same way we connect any external script to our HTML.

```html
<!-- React -->
<script src="https://unpkg.com/react@16.12.0/umd/react.development.js"></script>
```

## Appending that h1 element inside the root div.

```js
root.appendChild(mainHeading);
```

```js
const ReactRoot = ReactDOM.createRoot(root);
ReactRoot.render(mainHeading);
```

With plain JavaScript, we append our heading to the root element. (`div` with the id `root`).
In the case of React, we use two methods provided by ReactDOM, `createRoot` and `render`. 

By passing the root element (`div` with the id `root`) as an argument to `createRoot`, we create a React root.
We then call the `render` method on this react root. For `render` method we pass in whatever element we want inside this root. In our case, the `mainHeading` we created.

As you read about React above, we also need to connect a script where the definition for ReactDOM methods like `createRoot` or `render` are given.

```html
<!-- React DOM -->
<script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
```
Let us rewrite the above HTML DOM manipulation with plain JS using [innerHTML](https://academy.bigbinary.com/learn-htmldom/manipulating-dom-elements-part-1/updating-html-inside-an-element) to make it easier to read and reduce the number of lines:

```js
const root = document.querySelector("#root");
const code = `<h1 id="main-heading" class="heading">We are from BB Academy</h1>`
root.appendChild(code);
```

Even in React we can reduce the number of lines in our React code and make it easier to read by using something called `JSX`. More about it in the next chapter.
