Use the individual
side border shorthand properties,
`border-top`, `border-bottom`,
`border-left` and `border-right`
as shown below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="first">
  Solid red border of 5px width only at the left
</div>
<div id="second">
  Dashed border of 1px width of default colour at the bottom
</div>
</panel>
<panel language="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-left: 5px solid red;
}
#second {
  border-bottom: thin dashed;
}
</panel>
</code>
</codeblock>