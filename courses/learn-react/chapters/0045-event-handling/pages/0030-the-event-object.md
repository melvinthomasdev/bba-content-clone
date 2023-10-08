Event handlers receive only one argument which we usually call `e` for "event" by convention. This "event object" contains a few values and functions we can use in handling inputs.

If we need to stop the propagation shown in the previous page, we can use `e.stopPropogation` like this:

```jsx
{/* PageIndex.jsx */}
const IsolatedButton = ({ onClick, children }) => (
  <button onClick={e => {
    e.stopPropagation();
    onClick();
  }}>
    {children}
  </button>
)

const PageIndex = ({ pageNumber }) => (
  <div onClick={() => alert('Clicked the container div')}>
    <IsolatedButton onClick={() => alert('< Previous Page')}>
      Previous Page
    </IsolatedButton>
    {pageNumber}
    <IsolatedButton onClick={() => alert('Next Page >')}>
      Next Page
    </IsolatedButton>
  </div>
)

export default PageIndex
```

The onClick event now runs `e.stopPropogation` first preventing any further bubbling to its parent `div` component before running its `onClick` function.

We can also use the event object to get the value of an input field using `e.target.value` like this:

```jsx
{/* NameInputField.jsx */}
const NameInputField = () => (
  <label>
    User Name:
    <input onChange={e => console.log(e.target.value)} />
  </label>
)

export default NameInputField
```

`e.target` gets the element that triggered the specific event. It has a lot of other properties you can use such as:

* `e.target.className`: to get the element's class name.
* `e.target.tagName`: to get the element's tag name. (div, h1, button, etc.)
* `e.target.parentNode`: to get an element's parent.

You can simply use `console.log(e.target)` to explore all the other attributes it has
