Apply `solid` borders on the top and bottom
of this paragraph and
no borders on the right and left:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<p>
  The Internet is the global system of interconnected computer networks that uses the Internet protocol suite to communicate between networks and devices.
</p>
</panel>
<panel lang="css">
p {
  padding: 10px;
}
</panel>
</code>

<solution>
p {
  padding: 10px;
  border-style: solid none;
}
</solution>
</Editor>