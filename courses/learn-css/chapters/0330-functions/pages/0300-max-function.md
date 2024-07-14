The CSS `max()` function is used to determine
the maximum value from a list of
comma-separated values.

```css
max(value1, value2, ...);
```

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  width: max(50%, 300px);

  height: 100px;
  background: orchid;
  border-radius: 5px;
  border: 2px solid black;
}
</panel>
</code>
</codeblock>

In the above example, the element's width is
defined by the `max()` function.
It will select the greater value between
**50%** and **300px**.
If the viewport is wider than **600px**,
the element will occupy a maximum of **50%**
of the viewport width.
Otherwise, it will maintain a fixed width of **300px**.
