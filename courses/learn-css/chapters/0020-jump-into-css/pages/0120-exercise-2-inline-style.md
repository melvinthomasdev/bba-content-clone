Apply inline styling to the HTML elements
to achieve the same styling as provided
in the CSS panel. Then remove those
styles from the CSS panel.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h1>
  The Great Barrier Reef
</h1>
<p>
  The Great Barrier Reef is the world's largest coral reef system, composed of over 2,900 individual reefs and 900 islands stretching over 2,300 kilometers.
</p>
</panel>
<panel language="css">
h1 {
  color: red;
}

p {
  color: blue;
  font-size: 20px;
}
</panel>
</code>

<solution>
<panel language="html">
<h1 style="color: red">
  The Great Barrier Reef
</h1>
<p style="color: blue; font-size: 20px">
  The Great Barrier Reef is the world's largest coral reef system, composed of over 2,900 individual reefs and 900 islands stretching over 2,300 kilometers.
</p>
</panel>
<panel language="css">

</panel>
</solution>
</codeblock>
