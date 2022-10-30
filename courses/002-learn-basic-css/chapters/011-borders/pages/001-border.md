The border properties in CSS
are used to create borders
around an HTML element.
We can control the width, color
and
the general styling of the border
using these properties.

Given below are some examples:

<Editor lang="css">
<code>
<panel lang="html">
<div id="first">
  Border on all sides
</div>
<div id="second">
  Green dotted border at the bottom
</div>
<button>
  Button with 3D effect
</button>
</panel>
<panel lang="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border: solid 1px darkgrey;
}
#second {
  border-bottom-style: dotted;
  border-color: green;
}
button {
  margin-top: 10px;
  padding: 8px 12px;
  border-style: outset;
}
</panel>
</code>
</Editor>