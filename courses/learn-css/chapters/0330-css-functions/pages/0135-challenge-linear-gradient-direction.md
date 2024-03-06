Change the direction of the gradient,
so that it starts from the bottom and
goes to the **top**.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  height: 100vh;
	background: linear-gradient(green, yellow, orange);
}
</panel>
</code>

<solution>
div {
  height: 100vh;
	background: linear-gradient(to top, green, yellow, orange);
}
</solution>
</codeblock>
