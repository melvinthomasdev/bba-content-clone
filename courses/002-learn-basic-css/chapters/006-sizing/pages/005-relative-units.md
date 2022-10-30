When we use relative units to specify a length,
it depends on the size of other elements.

Let us look at some commonly used relative units:

## Percentage - %

When width, height or font size of an element is specified in `%`, it is relative to the parent element's width, height or font-size:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  Width, height and font size in %
</div>
<p>
  Normal font size
</p>
</panel>
<panel lang="css">
html, body {
  width: 100%;
  height: 100%;
  background-color: yellow;
}
div {
  width: 50%;
  height: 50%;
  background-color: orange;
  font-size: 200%;
}
</panel>
</code>
</Editor>

Try changing `width` of the `div` to `100%` and `font-size` to `50%`.