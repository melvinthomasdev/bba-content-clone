While string literal attributes can easily be passed on using single or double
quotes like `<div className="userCard"/>`, if you need to insert actual
JavaScript, you'll need to use curly braces `{...}` like this:

```jsx
const UserWelcome = () => {
  const cardClass = "userCard";
  const name = "Oliver";

  return <div className={cardClass}>Hello {name}</div>;
};
```

We inserted JavaScript as the `className` attribute value for the div tag in the
first instance and as the contents of the div tag in the second.

In both instances above, the contents inside the curly braces are evaluated as
JavaScript variables rather than string literals. They act as a window to the
JavaScript outside the JSX.

You are not limited to simple variable names, you can also insert entire
expressions within those curly branches such as

```jsx
<p>{maxSoda - sodaTaken + 1} bottles of soda on the wall!</p>
```

You can even insert JavaScript objects as attribute values using double curly
braces `{{...}}`.

A very common use of this technique is to pass inline style to a component or
tag.

Unlike HTML where you use strings to pass inline styles like this:

```html
<div style="height:100px; width:100px; background-color:black; color:white">
  Hello Oliver
</div>
```

In React, the above example is the equivalent of:

```jsx
const UserWelcome = () => (
  <div
    style={{
      height: "100px",
      width: "100px",
      backgroundColor: "black",
      color: "white",
    }}
  >
    Hello Oliver
  </div>
);
```
