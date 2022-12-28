When you set the `right` property
of a `relative` element, the element
actually moves to the left.
That is because the element
is pushed from the right side:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  Relative element
</div>
</panel>
<panel language="css">
div {
  padding: 10px;
  background-color: orange;
  position: relative;
  right: 50px;
  border: 5px solid darkorange;
}
</panel>
</code>
</codeblock>

Similarly, when you set the
`bottom` property of a relative
element, it moves upwards,
because it is pushed from the bottom:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
    Relative element pushed up from the bottom
</div>
</panel>
<panel language="css">
body {
  margin: 0;
}
div {
  width: 150px;
  padding: 10px;
  background-color: orange;
  position: relative;
  bottom: 20px;
  border: 5px solid darkorange;
}
</panel>
</code>
</codeblock>