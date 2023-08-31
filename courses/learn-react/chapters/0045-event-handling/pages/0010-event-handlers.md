To add interactivity to your app, you need to be able to handle events such as
hovering, clicking or recording inputs. We use functions called "event handlers"
to do so. We simply pass it as a prop to an appropriate JSX tag.

Here's a simple example of a button that can handle events using an event
handler called `handleClick` passed to its `onClick` attribute:

```jsx
{
  /* AlertButton.jsx */
}
const AlertButton = () => {
  const handleClick = () => alert("Clicked!");

  return <button onClick={handleClick}>The Alert Button</button>;
};

export default AlertButton;
```

[As mentioned previously](https://courses.bigbinaryacademy.com/learn-react/naming-conventions/naming-functions/),
we use generally use the prefix `handle` when creating named event handlers such
as the `handleClick` function shown above.

You could also define the event handler inline as such:

```jsx
{
  /* AlertButton.jsx */
}
const AlertButton = () => (
  <button onClick={() => alert("Clicked!")}>The Alert Button</button>
);

export default AlertButton;
```

React has many default event-handler attributes you can use such as:

- onClick
- onDrag
- onTouchMove

If you'd like to dive deeper into the custom event handlers you can insert into
components, you can refer to React's official docs on:

- [Mouse Events](https://reactjs.org/docs/events.html#mouse-events)
- [Touch Events](https://reactjs.org/docs/events.html#touch-events)
- [Pointer Events](https://reactjs.org/docs/events.html#pointer-events)
