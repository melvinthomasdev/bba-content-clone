When deciding to update the DOM, React renders your component and compares the new render with the previous render. If the render results are different, React updates the DOM.

These comparisons between renders are fast. But there is a method to speed up this comparison using `React.memo()`

When a component is wrapped in `React.memo()`, React renders the component and memoizes the result. Before the next render, if the new props are the same, React reuses the memoized result skipping the next render.

Here's a simple example of a User Card being memoized

```jsx
const UserCard = ({ name, image }) => (
  <div className="userCard">
    <h1>{name}</div>
    <img src={image} alt={`${name}'s image`} />
  </div>
);

export const MemoizedUserCard = React.memo(UserCard);
```

A few things to note, however:

  - `React.memo` is more of a hint than a rule, you can't rely on it to always prevent rendering under specific circumstances
  - React will always re-render a component if the state has changed, even if the component is wrapped in a `React.memo`. Thus, you can use hooks inside a `React.memo` component.