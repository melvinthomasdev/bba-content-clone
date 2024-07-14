The `top`, `right`, `bottom` and `left` properties can also have negative values:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="static">
</div>
<div id="relative">
</div>
</panel>
<panel language="css">
div {
  width: 80px;
  height: 80px;
}
#static {
  background-color: teal;
}
#relative {
  background-color: orange;
  position: relative;
  top: -40px;
  right: -40px;
  /* Same as left: 40px in this case */
}
</panel>
</code>
</codeblock>