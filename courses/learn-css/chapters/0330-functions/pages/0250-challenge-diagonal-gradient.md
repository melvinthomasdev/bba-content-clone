Change the direction of the gradient,
so that it starts from the top left corner and
goes to the **bottom right**.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  height: 100vh;
	background: linear-gradient(pink, orange, red);
}
</panel>
</code>

<solution>
div {
  height: 100vh;
	background: linear-gradient(to bottom right, pink, orange, red);
}
</solution>
</codeblock>
