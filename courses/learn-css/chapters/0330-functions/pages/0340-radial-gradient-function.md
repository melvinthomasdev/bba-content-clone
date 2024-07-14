The `radial-gradient` CSS function is used
to create a gradient background that
starts from the center and radiates outward.
It is applied as a value to the
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
	background: radial-gradient(red, yellow);
}
</panel>
</code>
</codeblock>

As shown in the example above, to create
a radial gradient, we need to specify at
least two different colour values.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  height: 100vh;
	background: radial-gradient(red, yellow, green);
}
</panel>
</code>
</codeblock>

In the example above, we created
a radial gradient with three colours.
