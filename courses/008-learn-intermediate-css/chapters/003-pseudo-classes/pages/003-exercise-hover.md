Change the background color of
the button to `orange` and text
color to `black` on hover:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<button type="button">Hover over me</button>
</panel>
<panel lang="css">
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
</Editor>