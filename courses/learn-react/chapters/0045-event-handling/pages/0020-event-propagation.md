Most event handlers don't just catch events from your component but also its children if they have event handlers too.

Here's a simple demonstration of the propagation in action:

```jsx
{/* PageIndex.jsx */}
const PageIndex = ({ page, setPage }) => (
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

export default PageIndex
```

In the above example, clicking either button will cause the button's onClick to trigger first followed by the div's onClick as the event "bubbles up". Clicking on the div alone will cause only the div's onClick function to run.

To understand how to stop this propagation, we'll first need to understand the event object shown in the next chapter.
