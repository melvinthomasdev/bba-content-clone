The `calc()` function allows us to
perform mathematical calculations
within CSS property values.

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
body{
  background-color: yellow;
}

div {
  height: calc(100vh - 50px);
  width: calc(100vw - 50px);
  background-color: teal;
}
</panel>
</code>
</codeblock>

In the example above, we used the `calc()` function
to dynamically calculate the `height` and `width`
of the `<div>` element based on changes in the viewport size.
