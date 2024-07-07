Since React is at its core just plain JavaScript, you can add comments to your
code the same way you add comments to JavaScript code using `//` for single-line
comments and `/* */` for a multiline comment.

```jsx
const WelcomeText = () => {
  // This is a single line comment
  /*
    This is the first line of a multiline comment.
    This is the second line of a multiline comment
  */
  return (
    <>
      <h1>Welcome to JSX</h1>
      <p>Please do enjoy your stay</p>
    </>
  );
};
```

When you need to insert a comment into JSX, using `<!– –>` to write comments as
you did with HTML will not work.

We can instead use the same syntax we use to write comments in JavaScript by embedding
it with `{}` tags.

```jsx
const WelcomeText = () => (
  <>
    <h1>Welcome to JSX</h1>
    {/*
      This is the first line of a multiline comment.
      This is the second line of a multiline comment
    */}
    <p>Please do enjoy your stay</p>
  </>
);
```

Just keep in mind that you **cannot** include a one-line comment using `//` like
shown below:

```jsx
<>
  <h1>Welcome to JSX</h1>
  {// This is a broken comment that causes a syntax error }
  <p>Please do enjoy your stay</p>
</>
```

The closing bracket `}` becomes part of the comment and is ignored, causing an
error due to an unbound closure.

If you prefer using `//` ensure that the line doesn't contain the closing
bracket like this:

```jsx
<>
  <h1>Welcome to JSX</h1>
  {
    // This single line comment now works
  }
  <p>Please do enjoy your stay</p>
</>
```
