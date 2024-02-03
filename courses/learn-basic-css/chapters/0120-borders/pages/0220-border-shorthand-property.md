The three different border properties
for style, width and color
can be combined into a single
`border` shorthand property.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="first">
  Border created using border-style, border-width and border-color properties
</div>
<div id="second">
  Border created using border shorthand
</div>
</panel>
<panel language="css">
div {
  padding: 10px;
  margin: 10px;
  background-color: pink;
}

/* Border created using border-style, border-width and border-color properties */
#first {
border-width: 5px;
border-style: dashed;
border-color: red;
}

/* Border created using border shorthand */
#second {
border: 5px dashed red;
}
</panel>
</code>
</codeblock>