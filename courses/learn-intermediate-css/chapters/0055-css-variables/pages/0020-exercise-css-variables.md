Define a CSS variable `--font-color`
with a value of `red` in
the scope of *div* element.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <h1>Apple</h1>
</div>
</panel>
<panel language="css">
/* Write code here */

div > h1 {
  color: var(--font-color)
}
</panel>
</code>
<solution>
<panel language="html">
<div>
  <h1>Apple</h1>
</div>
</panel>
<panel language="css">
div {
  --font-color: red;
}

div > h1 {
  color: var(--font-color);
}
</panel>
</solution>
</codeblock>
