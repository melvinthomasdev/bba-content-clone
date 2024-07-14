The `border-color` property is used
to specify the colour of the borders
using **color names** or **RGB** or **HEX** values.

When this property is not set,
the border takes the value
of the `color` property of the element.
The default value for `color` is black.

Border colour can also be set to `transparent`.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="first">
  Orange border
</div>
<div id="second">
  Double, light grey border
</div>
<div id="third">
  Green border, same as the color property value.
</div>
</panel>
<panel language="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: solid;
  border-color: orange;
}
#second {
  border-style: double;
  border-color: #cccccc;
}
#third {
  border-style: solid;
  color: green;
  /* Border color not specified */
}
</panel>
</code>
</codeblock>

Without the `border-style` property,
`border-color` does not work.
Try removing `border-style` in the example above.