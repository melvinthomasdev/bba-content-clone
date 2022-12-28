The `min-width` property
is used to define the
minimum width of an element.

If the content is larger than the `min-width` value,
this property has no effect.
But if the content is smaller than the `min-width` value,
the minimum width is applied.

When both `min-width` and `width` are defined,
the larger of the two values is applied.

View the editor in full screen mode
and change the width
of the output panel
to feel the difference.

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
  width: 50%;
  min-width: 250px;
  /* Greatest value is applied */
  background-color: yellow;
}
#second {
  width: 50%;
  min-width: 500px;
  /* Greatest value is applied */
  background-color: orange;
}
</panel>
</code>
</codeblock>