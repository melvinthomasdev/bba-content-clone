Set the height of the paragraph to twice the font size of the `html` element, using `rem`:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<p>
  A small paragraph
</p>
</panel>
<panel lang="css">
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
</Editor>