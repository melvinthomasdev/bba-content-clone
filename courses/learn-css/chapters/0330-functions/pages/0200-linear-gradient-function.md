The `linear-gradient` CSS function is used
to create a gradient background that
transitions between two or more colours
in a linear direction.
It is mostly applied as a value to the
`background` property.

Let's look at some examples:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  height: 100vh;
	background: linear-gradient(green, yellow);
}
</panel>
</code>
</codeblock>

As shown in the example above, to create
a linear gradient, we need to specify at
least two different colour values.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  height: 100vh;
	background: linear-gradient(red, orange, yellow, green);
}
</panel>
</code>
</codeblock>

In the example above, we created
a linear gradient with four colours. 
