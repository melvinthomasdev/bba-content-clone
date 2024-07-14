Set `lightblue` colour for top and bottom borders,
and `black` color for right and left borders
of the `p` element:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p>
  "You can get everything you want in life if you will just help other people get what they want."
  <br>
  -- Zig Ziglar
</p>
</panel>
<panel language="css">
p {
  padding: 15px;
  border-style: solid double;
}
</panel>
</code>

<solution>
p {
  padding: 15px;
  border-style: solid double;
  border-color: lightblue black;
}
</solution>
</codeblock>