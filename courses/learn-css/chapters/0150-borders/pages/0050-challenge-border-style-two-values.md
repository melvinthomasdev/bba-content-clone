Apply `solid` borders on the top and bottom
of this paragraph and
no borders on the right and left:

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
  border-style: solid none;
}
</solution>
</codeblock>