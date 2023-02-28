When writing a function, its name should convey what the function is doing. They
must always be meaningful and self-explanatory.

A function that deletes a note can be named `deleteNote()` but if it handles
events triggered by `click` or `submit`, it would be more appropriate to prefix
it with the `handle` keyword and make it `handleDeleteNote()`.

Similarly, when defining prop names for your custom component, it is preferable
to match built-in conventions such as the usage of the `onClick` prop for a
function that handles the click event.

Take an example of a `CustomButton` component that takes in a `handleDeleteTask`
function to be triggered on clicking the component. Using the `onClick` prop
name rather than a generic `handleClick` prop name allows a reader to understand
the prop's purpose in your custom component immediately. This is because default
React components like `button` and `div` use the `onClick` built-in prop for a
similar purpose.

```jsx
// Good
<CustomButton onClick={handleDeleteTask} />

// This is also fine. But above one is preferred
<CustomButton handleClick={handleDeleteTask} />
```
