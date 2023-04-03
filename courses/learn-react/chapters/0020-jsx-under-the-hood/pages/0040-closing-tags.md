In HTML, elements such as `<img>`, `<hr>`, `<input>` and `<br>` do not
necessarily need to be closed, but they **must** be closed in JSX.

When you write a line with an `li` tag like this:

```js
<ul>
  <li>apples
  <li>oranges
  <li>grapes
</ul>
```

Your transpiler doesn't know where one tag ends and the next one begins. Thus it
can't translate `<li>apple` to `React.createElement('li', ...)`. They must be
closed in JSX with a closing tag like this: `<li>apple</li>`.

Similarly, breakpoints need to be written as `<br />` rather than `<br>` and
images need to be written as `<img />` rather than `<img>`.

A few examples of such conversions are shown below:

```jsx
<div>
  <img src="https://xyz.com/abc.jpg" alt="Fruit Salad" />
  <br />
  <ul>
    <li>apples</li>
    <li>oranges</li>
    <li>grapes</li>
  </ul>
</div>
```
