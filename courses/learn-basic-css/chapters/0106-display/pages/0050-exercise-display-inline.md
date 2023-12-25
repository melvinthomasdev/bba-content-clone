Make the heading and paragraph appear next to each other using the `display` property:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h3>Quote for the day:</h3>
<p>
  <em>"You can get everything you want in life if you will just help other people get what they want."</em>
</p>
</panel>
<panel language="css">
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
</codeblock>