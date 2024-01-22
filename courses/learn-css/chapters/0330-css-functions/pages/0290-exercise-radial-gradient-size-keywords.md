Move the center of the gradient to **70%** on both X and Y axis, and set the size in a way that it touches the **closest corner**.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  height: 100vh;
  background: radial-gradient(purple, yellow, red);
}
</panel>
</code>

<solution>
div {
  height: 100vh;
  background: radial-gradient(closest-corner at 70% 70%, purple, yellow, red);
}
</solution>
</codeblock>
