For the four sides of an element, we can provide different border styles.

When this property has **only one value** specified, the same style is applied to all four sides.

When it has **two values**, the first value is applied to the top and bottom borders, and the second value is applied to the right and left borders:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="first">
  Solid borders on top and bottom, dotted borders on right and left.
</div>
</panel>
<panel language="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: solid dotted;
}
</panel>
</code>
</codeblock>

When it has **three values**, the first value is applied to the top border, the second value is applied to the right and left borders, and the third value is applied to the bottom border:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="first">
  Solid border on top, dotted borders on right and left, double border at the bottom.
</div>
</panel>
<panel language="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: solid dotted double;
}
</panel>
</code>
</codeblock>

When it has **four values**, the values are applied to top, right, bottom and left - in that order.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="first">
  Solid border on top, dotted border on right, double border at the bottom and no border on the left.
</div>
</panel>
<panel language="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: solid dotted double none;
}
</panel>
</code>
</codeblock>