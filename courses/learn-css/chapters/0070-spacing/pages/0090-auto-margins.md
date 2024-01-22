The `margin` property can be
set to `auto` value.
This horizontally centers an element.

The `left` and `right` margins are auto calculated
by equally splitting the remaining space.

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
  width: 75%;
  margin: auto;
}
#second {
  width: 75%;
  margin: 10px auto 0px;
}
</panel>
</code>
</codeblock>

If `margin-left` is set to auto,
the remaining space is assigned to left margin
and hence the element aligns to the right.

If `margin-right` is set to auto,
the element aligns to the left.

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
  width: 75%;
  margin-left: auto;
}
#second {
  width: 75%;
  margin-right: auto;
}
</panel>
</code>
</codeblock>