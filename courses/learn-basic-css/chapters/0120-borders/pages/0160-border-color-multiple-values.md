We can specify one, two, three or four values
for `border-color` for applying different colors on different sides.

When the property has **two values**, the first value is applied to the top and bottom borders, and the second value is applied to the right and left borders:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="first">
  Grey borders on top and bottom, red borders on right and left.
</div>
</panel>
<panel language="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: solid;
  border-color: grey red;
}
</panel>
</code>
</codeblock>

When it has **three values**, the first value is applied to the top border, the second value is applied to the right and left borders, and the third value is applied to the bottom border:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="first">
  Blue border on top, transparent border on right and left, green border at the bottom.
</div>
</panel>
<panel language="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: dashed;
  border-color: blue transparent green;
}
</panel>
</code>
</codeblock>

When it has **four values**, the values are applied to top, right, bottom and left - in that order.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="first">
  Blue border on top, red border on right, green border at the bottom and yellow border on the left.
</div>
</panel>
<panel language="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: solid;
  border-color: blue red green yellow;
}
</panel>
</code>
</codeblock>