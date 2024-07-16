Apply `dotted` border on the top,
`solid` border at the bottom,
`double` border on the left and
`ridge` border on the right
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
  border-style: dotted ridge solid double;
}
</solution>
</codeblock>