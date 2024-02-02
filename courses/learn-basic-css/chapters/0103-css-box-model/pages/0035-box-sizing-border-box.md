When an element has `box-sizing: border-box`,
it changes the default behavior of how
the browser calculates the total width
and
height of the element.

The width and height properties
will include the content, padding,
and border of the element.

Let us take a look at an example:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  Superman
</div>
</panel>
<panel language="css">
div {
  background-color: green;
  width: 250px;
  height: 150px;
  padding: 20px;
  color: lightblue;
  border: solid 20px darkgreen;
  margin: 30px;
}
</panel>
</code>
</codeblock>

In the above code the height
and
width is calculated automatically
by the  browser as follows:

<image>border-box.png</image>

As we can see, the width
and
height includes the padding
and
border values.
