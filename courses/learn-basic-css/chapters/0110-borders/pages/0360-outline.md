The `outline` property in CSS is
used to draw a line around an
HTML element.
We can style the `outline` by
specifying its line style, colour,
and width.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  width: 400px;
  height: 100px;
  margin: 30px auto;
  background-color: lightgrey;
  border: 4px dotted black;
  outline: 4px dashed tomato;
}
</panel>
</code>
</codeblock>

In the above example, we can see that the
`outline` is drawn outside the element's
`border`, thereby not affecting the total
width and height of the element.
