We can specify one, two, three or four values
for `border-width` for defining
different border thickness on different sides:

When it has **two values**, the first value is applied to the top and bottom borders, and the second value is applied to the right and left borders:

<Editor lang="css">
<code>
<panel lang="html">
<div id="first">
  Thin borders on top and bottom, 4px width on right and left.
</div>
</panel>
<panel lang="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: solid;
  border-width: thin 4px;
}
</panel>
</code>
</Editor>

When it has **three values**, the first value is applied to the top border, the second value is applied to the right and left borders, and the third value is applied to the bottom border:

<Editor lang="css">
<code>
<panel lang="html">
<div id="first">
  1px border on top, 2px border on right and left, 4px border at the bottom.
</div>
</panel>
<panel lang="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: solid;
  border-width: 1px 2px 4px;
}
</panel>
</code>
</Editor>

When it has **four values**, the values are applied to top, right, bottom and left - in that order.

<Editor lang="css">
<code>
<panel lang="html">
<div id="first">
  1px border on top, 2px border on right, 3px border at the bottom and 4px border on the left.
</div>
</panel>
<panel lang="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: solid;
  border-width: 1px 2px 3px 4px;
}
</panel>
</code>
</Editor>