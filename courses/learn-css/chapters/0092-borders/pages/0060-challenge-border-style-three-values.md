Apply `dashed` border on the top,
`solid` border at the bottom and
`groove` border on right and left
of this paragraph:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p>
  The Internet is the global system of interconnected computer networks that uses the Internet protocol suite to communicate between networks and devices.
</p>
</panel>
<panel language="css">
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
</codeblock>