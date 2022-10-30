Apply `dashed` border on the top,
`solid` border at the bottom and
`groove` border on right and left
of this paragraph:

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
  border-style: dashed groove solid;
}
</solution>
</Editor>