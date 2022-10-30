Make the heading and paragraph appear next to each other using the `display` property:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<h3>Quote for the day:</h3>
<p>
  <em>"You can get everything you want in life if you will just help other people get what they want."</em>
</p>
</panel>
<panel lang="css">
h3, p {
  font-size: 18px;
}
</panel>
</code>

<solution>
h3, p {
  font-size: 18px;
  display: inline;
}
</solution>
</Editor>