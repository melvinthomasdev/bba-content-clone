Since all JSX is transpiled to plain JavaScript, almost all attributes in a tag
are camelCased when compared to their HTML counterparts.

For example:

- `<div onclick=...>` turns into `<div onClick=...>`.
- `<div onmouseover=...>` turns into `<div onMouseOver=...>`.

Also, `class` is a reserved keyword in JavaScript used to create JavaScript
classes. So we use the `className` attribute instead. For example:

```jsx
<div className="greetingBox">Hello World!</div>
```

Similarly, `for` is a reserved keyword in JavaScript used to create for-loops.
So we use the `htmlFor` attribute instead. For example:

```jsx
<form>
  <label htmlFor="name">Name</label>
  <input id="name" type="text" />
  <button type="submit">Submit</button>
</form>
```

The only exceptions to this rule are the `data` and `aria` attributes in JSX
which still use kebab-case even in JSX as shown:

```jsx
<input
  type="text"
  aria-required="true"
  data-country="India"
  onChange={streetChangeHandler}
  value={streetValue}
  name="street"
/>
```
