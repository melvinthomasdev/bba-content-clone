The `min-height` property
is used to define the
minimum height of an element.

If the content is larger than the value
given to the `min-height`,
this property has no effect.
But, if it is smaller than the `min-height` value,
the minimum height is applied.

When both `min-height` and `height` are defined,
the larger of the two values is applied, as can be
seen in the code examples given below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p id="first">
  Web design encompasses many different skills and disciplines in the production and maintenance of websites.
</p>
<p id="second">
  The different areas of web design include web graphic design; user interface design (UI design); authoring, including standardised code and proprietary software; user experience design (UX design); and search engine optimization.
</p>
</panel>
<panel language="css">
#first {
  /*Minimum height has no effect */
  min-height: 10px;
  background-color: yellow;
}
#second {
  height: 50px;
  min-height: 100px;
  /* Greatest value is applied */
  background-color: orange;
}
</panel>
</code>
</codeblock>