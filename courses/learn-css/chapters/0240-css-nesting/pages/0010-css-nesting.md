**CSS nesting** is the practice of placing
selectors inside one another, providing
a structured way to target and style
specific HTML elements. It reduces repetition,
resulting in cleaner and more concise code.

Let's look at some CSS code:

```css
.parent {
  color: black;
  background-color: red;

  & span {
    color: blue;
  }
}
```

This is equivalent to:

```css
.parent {
  color: black;
  background-color: red;
}

.parent span {
  color: blue;
}
```

The `&` is needed at the beginning of each selector
for the nesting to be valid. We can think of using `&`
as referencing the parent selector.

**Note:** CSS nesting is a recent addition to native CSS,
and its support may be limited in some web browsers.
Before using CSS nesting in your projects,
you may want to verify the browser compatibility
on websites like [caniuse.com](https://caniuse.com/css-nesting).
