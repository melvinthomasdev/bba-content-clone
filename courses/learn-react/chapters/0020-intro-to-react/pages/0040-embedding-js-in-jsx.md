While string literal attributes can easily be passed on using single or double quotes `<div className="userCard"/>`, if you need to insert actual JavaScript, you'll need to use curly braces `{...}` like so:

```jsx
{/* UserWelcome.jsx */}
const UserWelcome = () => {
  const cardClass = "userCard";
  const name = "Oliver";

  return (
    <div className={cardClass}>
      Hello {name}
    </div>
  )
};
```

We inserted JavaScript as the attribute value for the div tag in the first instance and the content of the div tag in the second.

In both instances above, the contents inside the curly braces are evaluated as JavaScript variables rather than string literals. They act as a window to the JavaScript outside the JSX.

You are not limited to simple variable names, you can also insert entire expressions within those curly branches such as `<p> {maxSoda - sodaTaken + 1} bottles of soda on the wall! </p>`

## Inline Styling

One important use of these curly braces to keep in mind while coding with JSX is inline styling.
When you need inline styles in JSX, you can pass an object to the `style` attribute in the following format:

```jsx
{/* UserWelcome.jsx */}
const UserWelcome = () => (
  <div style={{
    height: '100px',
    width: '100px',
    backgroundColor: 'black',
    color: 'white'
  }}>
    Hello Oliver
  </div>
)
```

The double curly braces `{{...}}` just represent a JavaScript object within a set of curly braces.