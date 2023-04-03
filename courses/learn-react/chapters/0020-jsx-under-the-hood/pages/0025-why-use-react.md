Before we move further, it is important to understand why we use React rather
than just manipulate the DOM ourselves.

If you're familiar with HTML, you may have learned about how web documents are
structured using tree-like objects called DOMs or Document Object Models that
allow you to perform operations via JavaScript to add, remove or modify the
document’s content

While the operations themselves are extremely quick, re-rendering the entire
page after the operation has been completed is not.

If we could specifically target the new changes and not re-render the entire
page, we can make Single Page Applications a lot faster. Many JavaScript
frameworks tackle this problem of optimizing re-renders and React's method is to
use a virtual DOM.

The exact mechanisms by which this occurs will be explained later but the key
thing to understand is that React optimizes the necessary changes making updates
faster and more concise.

This is best demonstrated in the following JavaScript code example:

<!-- Placeholder for React code editor -->

```jsx
const htmlDomSection = document.getElementById("plain-js-section-red");
const reactSection = document.getElementById("react-section-blue");
const ReactRoot = ReactDOM.createRoot(reactSection);

const updateTime = () => {
  const time = new Date().toLocaleTimeString();

  const contentUpdatedUsingPlainJS = `
    <div class="container">
        <h1>JS Timer</h1>
        <p class="current-time">${time}</p>
        <form>
            <input type="text" placeholder="type here"/>
            <button>Submit</button>
        </form>
    <div>
    `;
  htmlDomSection.innerHTML = contentUpdatedUsingPlainJS;

  const contentUpdatedUsingReact = (
    <div className="container">
      <h1>React Timer</h1>
      <p className="current-time">{time}</p>
      <form>
        <input type="text" placeholder="type here" />
        <button>Submit</button>
      </form>
    </div>
  );

  ReactRoot.render(contentUpdatedUsingReact);
};
setInterval(updateTime, 1000);
```

Try running the above example yourself to see if it works
[over here](https://replit.com/@Yedhin/Why-Use-React#src/index.jsx)

While both `contentUpdatedUsingPlainJS` and `contentUpdatedUsingReact` look
identical, when running the example, you will notice that everything typed into
the plain JS text input gets cleared out every time the timer changes.

This is because all the elements inside `contentUpdatedUsingPlainJS` are being
updated every time `setInterval` executes `updateTime`.

While we could solve this issue if we selected just the `p` element via its
`current-time` class name, React can do this automatically for you. It figures
out how the data being changed affects the HTML DOM and doesn't update unrelated
elements.

Try typing into the React text input to ensure this is the case.

If you wish to dive deeper into React's virtual DOM, check out these resources:

- [What is the virtual DOM in React](https://blog.logrocket.com/virtual-dom-react/)
- [Official guide on how the UI tree is updated](https://beta.reactjs.org/learn/preserving-and-resetting-state)

If you need a refresher on HTML DOMs, we recommend going through
[this course](https://academy.bigbinary.com/learn-htmldom) first.
