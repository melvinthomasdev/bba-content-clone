The CSS `min()` function is used to determine
the minimum value from a list of
comma-separated values.

```css
min(value1, value2, ...);
```

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  width: min(50%, 300px);
  height: 100px;
  background: coral;
  border-radius: 5px;
  border: 2px solid black;
}
</panel>
</code>
</codeblock>

In the above example, the element's width is
defined by the `min()` function.
That means, if the viewport is smaller than **600px**,
the element will take up at least **50%** of the viewport width.
Otherwise, it will stay at a fixed width of **300px**.
