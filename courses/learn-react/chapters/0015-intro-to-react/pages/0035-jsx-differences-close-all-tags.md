## All tags must be closed

Unlike HTML, you can't use closing
and
wrapping tags in JSX.

Elements such as `<img>`, `<hr>`, 
`<input>` and `<br>` do not necessarily
need to be closed in raw HTML,
but they **must** be closed in JSX.

Elements such as `<li>` which can
be written as `<li>apple` in HTML must
be closed in JSX with a closing tag like
so:  `<li>apple</li>`.
Similarly, `<br>` (breakpoints) can be
written as `<br />` instead.

A few examples of such conversions
are shown below:

```jsx
<div>
  <img
    src="https://xyz.com/abc.jpg"
    alt="Fruit Salad"
  />
  <br />
  <ul>
    <li>apples</li>
    <li>oranges</li>
    <li>grapes</li>
  </ul>
</div>
```
At all times, the JSX we
are writing needs to be converted
to corresponding `React.createElement`
as the browser does not understand
JSX natively. For our above code,
this convertion or compiling is
handled by a JS compiler called Babel.

Similar to how we loaded the `React`
and
`ReactDOM` definitions from the script,
we have loaded everything we need from
`Babel` using the third script above
and
also told which script needs to be
converted by adding a `type` attribute
to script with a value `text/babel`.
