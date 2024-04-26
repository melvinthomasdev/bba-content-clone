The `border-radius` property can take one, two, three
or four values.
If this property has a single value,
as seen in the previous lesson,
it applies to all four corners.

If this property has **two values**:

- The first value is for the top-left and right-bottom.
- The second value is for top-right and left-bottom

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
</div>
</panel>
<panel language="css">
div {
  width: 250px;
  height: 150px;
  background-color: teal;
  border-radius: 40px 10px;
}
</panel>
</code>
</codeblock>

If this property has **three values**:

- The first value is for the top-left corner.
- The second value is for top-right and left-bottom.
- The third value is for the bottom-right corner.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
</div>
</panel>
<panel language="css">
div {
  width: 250px;
  height: 150px;
  background-color: teal;
  border-radius: 40px 10px 0px;
}
</panel>
</code>
</codeblock>

If this property has **four values**:

- The first value is for the top-left corner.
- The second value is for the top-right corner.
- The third value is for the bottom-right corner.
- The fourth value is for the bottom-left corner.

Values get assigned in the clockwise direction starting from top-left.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
</div>
</panel>
<panel language="css">
div {
  width: 250px;
  height: 150px;
  background-color: teal;
  border-radius: 40px 10px 0 100px;
}
</panel>
</code>
</codeblock>
