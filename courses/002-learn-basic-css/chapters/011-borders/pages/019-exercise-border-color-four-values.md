Set a `transparent` border for the top, right and bottom
side of the `p` element in the code editor give below.
Also, make the left border have the colour `#008B8B`.

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
  border-color: transparent transparent transparent #008B8B;
}
</solution>
</Editor>