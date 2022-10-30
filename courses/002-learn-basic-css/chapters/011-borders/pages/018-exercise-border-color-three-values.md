Set a `turquoise` color for top border,
`teal` color for bottom border and
`transparent` for right and left borders
of the `p` element:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<p>
  "You can get everything you want in life if you will just help other people get what they want."
  <br>
  -- Zig Ziglar
</p>
</panel>
<panel lang="css">
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
</Editor>