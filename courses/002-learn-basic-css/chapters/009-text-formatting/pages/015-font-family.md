The `font-family` property can help us choose which font
we want for our text.

By default, this value is `serif`.
The other **generic** font families available are
`sans-serif`, `monospace`, `cursive` and `fantasy`.

<Editor lang="css">
<code>
<panel lang="html">
<p id="serif">
  This is a serif font.
</p>
<p id="sans-serif">
  This is a sans serif font.
</p>
<p id="monospace">
  This is a monospace font.
</p>
<p id="cursive">
  This is a cursive font.
</p>
<p id="fantasy">
  This is a fantasy font.
</p>
</panel>
<panel lang="css">
#serif {
  font-family: serif;
}
#sans-serif {
  font-family: sans-serif;
}
#monospace {
  font-family: monospace;
}
#cursive {
  font-family: cursive;
}
#fantasy {
  font-family: fantasy;
}
p {
  font-size: 1.2em;
  margin-top: 10px;
}
</panel>
</code>
</Editor>