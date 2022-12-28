Set a `turquoise` color for top border,
`teal` color for bottom border and
`transparent` for right and left borders
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
  border-style: solid;
  border-width: 5px;
}
</panel>
</code>

<solution>
p {
  padding: 15px;
  border-style: solid;
  border-width: 5px;
  border-color: turquoise transparent teal;
}
</solution>
</codeblock>