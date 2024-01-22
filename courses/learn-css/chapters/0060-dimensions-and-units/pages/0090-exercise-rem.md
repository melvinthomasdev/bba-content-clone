Set the height of the paragraph to twice the font size of the `html` element, using `rem`:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p>
  A small paragraph
</p>
</panel>
<panel language="css">
html {
  font-size: 18px;
}
p {
  background-color: lightblue;
}
</panel>
</code>

<solution>
html {
  font-size: 18px;
}
p {
  background-color: lightblue;
  height: 2rem;
}
</solution>
</codeblock>