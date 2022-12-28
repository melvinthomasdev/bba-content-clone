## Event Handlers

To add interactivity to your app, you need to be able to handle events such as hovering, clicking or recording inputs. We use functions called "event handlers" to do so. We simply pass it as a prop to an appropriate JSX tag.

Here's a simple example of a button that can handle events using an event handler called `handleClick` passed to its `onClick` attribute:

```jsx
{/* AlertButton.jsx */}
const AlertButton = () => {
  const handleClick = () => alert('Clicked!')

  return (
    <button onClick={handleClick}>
      The Alert Button
    </button>
  )
}
```

You could also define the event handler inline as such:

```jsx
{/* AlertButton.jsx */}
const AlertButton = () => (
  <button onClick={() => alert('Clicked!')}>
      The Alert Button
  </button>
)
```

By convention, all named event handlers are prefixed with the word `on` such as `onClick` and `onSubmit`.

## Event Propagation

Event Handlers don't just catch events from your component but also its children if they have event handlers too.

Here's a simple demonstration of the propagation in action:

```jsx
{/* PageIndex.jsx */}
const PageIndex = ({page, setPage}) => (
  <div onClick={() => alert('Clicked the container div')}>
    <button onClick={() => alert('< Previous Page')}>
      Previous Page
    </button>
    {page}
    <button onClick={() => alert('Next Page >')}>
      Next Page
    </button>
  </div>
)
```
In the above example, clicking either button will cause the button's onClick to trigger first followed by the div's onClick as the event "bubbles up". Clicking on the div alone will cause only the div's onClick function to run.

## The Event Object
Event handlers receive only one argument which we usually call `e` for "event" by convention. This event object contains a few values and functions we can use in handling inputs.

### Stopping Propagation

If we need to stop the propagation shown in the previous section, we can use `e.stopPropogation` like so:

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

const PageIndex = ({pageNumber}) => (
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
```

The onClick event now runs `e.stopPropogation` first preventing any further bubbling to its parent `div` component before running its `onClick` function.

### Using Input Fields

We can also use the event object to get the value of an input field using `e.target.value` like so:

```jsx
{/* NameInputField.jsx */}
const NameInputField = () => (
  <label>
    User Name:
    <input onChange={e => console.log(e.target.value)} />
  </label>
)
```

`e.target` gets the element that triggered the specific event. It has a lot of other properties you can use such as:

* `e.target.className`: to get the element's class name.
* `e.target.tagName`: to get the element's tag name. (div, h1, button, etc.)
* `e.target.parentNode`: to get an element's parent.

They aren't commonly used but do have a few niche purposes.

TODO: Check whether this needs to be moved to the advanced course

### Hooking Inputs into States

In React, input fields like the ones shown above are almost always controlled by a state object like so:

```jsx
{/* NameInputField.jsx */}
const NameInputField = () => {
  const [name, setName] = useState("")
  return (
    <>
      <label>
        User Name:
        <input
          value={name}
          onChange={e => setName(e.target.value)}
        />
      </label>
      <button onClick={() => alert(name)}>
        Display Name
      </button>
    </>
  )
}
```

In the above example, we set the value of the `input` tag to the value of the `name` state. We add an inline event handler to the `onChange` prop of the `input` tag to set the `name` to `e.target.value`.