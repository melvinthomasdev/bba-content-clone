There are a few key
differences between HTML
and
JSX to keep in mind.

## JSX uses camelCase

Since JSX is closer to JavaScript
than HTML, almost all attributes
in a tag are camelCased when
compared to their HTML counterparts.

For example:  `<div onclick=...>`
turns into `<div onClick=...>`.

Also, `class` is a reserved word
in React and thus, we need to use
the `className` attribute instead.
For example:

```jsx
<div className="greetingBox">
  Hello World!
</div>
```