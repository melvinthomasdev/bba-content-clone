Create 2 **CSS variables**
`--primary-font-weight`
and `--secondary-font-weight`
in root.

Give `--primary-font-weight` a
value of **900** and
`--secondary-font-weight` a value
of **400**.

Add `font-weight` property with
the value of `--primary-font-weight`
to `h1` tag.
Similarly, add the same property,
with the value of `--secondary-font-weight`
to `p` tag.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <h1>Primary Font weight</h1>
  <p>Secondary font weight</p>
</div>
</panel>
<panel language="css">
/* Write your code here */
</panel>
</code>
<solution>
<panel language="html">
<div>
  <h1>Primary Font weight</h1>
  <p>Secondary font weight</p>
</div>
</panel>
<panel language="css">
:root {
  --primary-font-weight: 900;
  --secondary-font-weight: 400;
}

h1 {
  font-weight: var(--primary-font-weight);
}

p {
  font-weight: var(--secondary-font-weight);
}
</panel>
</solution>
</codeblock>
