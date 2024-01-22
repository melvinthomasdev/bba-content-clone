We can define a linear gradient with colour stops
specified using **percentage** values.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  height: 100vh;
	background: linear-gradient(to right, red 20%, orange 40%, yellow 60%, green 80%, blue 100%);
}
</panel>
</code>
</codeblock>

In the above example, each colour in the gradient starts at
its specified percentage position, and creates a smooth transition.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  height: 100vh;
	background: linear-gradient(to right, red 0% 20%, orange 20% 40%, yellow 40% 60%, green 60% 80%, blue 80% 100%);
}
</panel>
</code>
</codeblock>

In the above example, the start and end percentages
for each colour stop are specified, resulting in
no mixing or overlapping of colours.
