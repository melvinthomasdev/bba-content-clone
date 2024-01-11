In this lesson, we will explore how React creates a root element in the DOM and renders application components within that root element. Before we dive into the details of the rendering process, let’s get a quick overview of how React performs the initial render of an application.

To see this, open the `my-app` project and go to the `index.js` file inside the `src` folder. This file contains the following code:

```jsx
const root = ReactDOM.createRoot(document.getElementById('root'));

root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
```

Let’s break down this code line by line:

In first line, the `document.getElementById('root')` method is used to select an HTML element by the `id` attribute. This element is where React will mount our application. You can find this HTML element in the `index.html` file inside the `public` folder as shown below:

```jsx
<div id="root"></div>
```

The `index.html` file is the first file that gets loaded from our app. It defines the basic structure of our web page using HTML tags. The DOM will initially be prepared using this HTML file. React will later add components to this DOM layout.

Then, the `ReactDOM.createRoot()` method is used to create a new React root for the selected HTML element. The React root is the connection point between React and the browser DOM. React uses the root to render components inside the DOM and update them when needed.

Next, the `root.render()` method is used to display the `<App />` component inside the root’s DOM node.

Now, it's time to dive into the details of all the methods that React uses in the rendering process.

## createRoot() Method

The `createRoot()` is a method of the `react-dom` library and enables us to create a root node within the browser's DOM, to display the React components inside it.

An app fully built with React will usually have only one React root. A page that uses React only for some parts of the page may have more than one root.

The `createRoot()` method returns the `root` object with two important methods: `render()` and `unmount()`. These methods facilitate rendering and unmounting components within the root element.

## render() Method

The `render()` method takes a React node as an argument and displays it inside the root’s DOM node. A React node can be anything that React can render, such as a component, an element, a string, a number, etc.

```jsx
root.render(<App />);
```

In the above example, the `<App />` component will be rendered inside the root's DOM, and React will manage the DOM inside it, like updates or deletions in the root's DOM tree.

## unmount() Method

The `unmount()` method destroys a rendered tree inside a React root.

```jsx
root.unmount();
```

Note that an app fully built with React will usually not have any calls to `root.unmount()`.

Now, let's create an additional root in our `my-app` project to apply the concepts we've just learned.

Open the `index.html` file inside the `public` folder and add the following code:

```jsx {2-2}
<div id="root"></div>
<div id="root1"></div>
```

We've added a `div` element with the `id` "root1". We'll utilize this element to mount our component.

Next, navigate to the `index.js` file within the `src` folder and add the following code:

```jsx {8-13}
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

const root1 = ReactDOM.createRoot(document.getElementById('root1'));
root1.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
```

Here, we've created a new React root node labeled as "root1", and we've once again rendered the `<App />` component. Upon opening the browser, you'll notice that the App's component UI appears twice, as demonstrated below:

<image>render-method.gif</image>

Also, notice the "Elements" tab within the developer tools and observe how the `render()` method inserts the nested elements to the root nodes.
