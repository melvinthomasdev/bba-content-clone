Components are one of the core concepts of React. React components are reusable building blocks in a React application. A React component is essentially a JavaScript function that returns a React element.

Here is a simple React component:

```jsx
const HelloWorld = () => <h1 className="headerBlock">Hello World!</h1>;
```

Once we have defined a component, we can use it within other components just like any other JSX tag:

```jsx
const App = () => (
  <div>
    <HelloWorld />
    <button>Click here</button>
  </div>
);
```

From the previous chapter, you may recollect that the JSX tags like `div` and `button` are transpiled to `createElement` call like this:

```jsx
<button>Click here</button>

// Transpiles to createElement("button", null, "Click here");
```

Similarly, the JSX tag `<HelloWorld />`, corresponding to our React component, is also transpiled to a `createElement` call. However, there is a distinction in how the `type` parameter is passed to the `createElement` function.

For custom components, the type parameter is a function reference instead of a string:
```jsx
<HelloWorld />

// Transpiles to createElement(HelloWorld, null)
```

JSX identifies the tag names starting with small letters as HTML tags and passes string argument to `createElement` function. Whereas tag names starting with capital letters are considered as React components and passes the function reference as type.

So, if we try to define and call the `HelloWorld` component in the name `helloWorld`, the transpiled code would look like this:

```jsx
<helloWorld />

// Transpiles to createElement("helloWorld", null, null)
```

The above code will cause React to search for a nonexistent HTML tag named `helloWorld`. As a result, the component will not get rendered into the DOM. Therefore, we must use `PascalCase` to name our components.

There is another approach to building React components called the class-based approach. But we won't be discussing much on that because it is outdated and too verbose. If you are interested you can learn more [here](https://react.dev/reference/react/Component) .
