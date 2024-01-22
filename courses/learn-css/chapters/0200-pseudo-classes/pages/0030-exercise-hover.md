Change the background color of
the button to `orange` and text
color to `black` on hover:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<button type="button">Hover over me</button>
</panel>
<panel language="css">
button {
  padding: 12px 20px;
  background-color: black;
  color: white;
  border: none;
  border-radius: 5px;
  font-size: 0.9em;
}
</panel>
</code>

<solution>
button {
  padding: 12px 20px;
  background-color: black;
  color: white;
  border: none;
  border-radius: 5px;
  font-size: 0.9em;
}
button:hover {
  background-color: orange;
  color: black;
}
</solution>
</codeblock>