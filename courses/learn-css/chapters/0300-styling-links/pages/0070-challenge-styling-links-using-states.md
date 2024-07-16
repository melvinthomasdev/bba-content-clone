Change the `background-color` of the link to `#1e90ff` on mouse hover:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h2>Button Link on Hover</h2>
<a href="#">
  Click me
</a>
</panel>
<panel language="css">
a {
  font-family: sans-serif;
  padding: 10px;
  background-color: #00bfff;
  border-radius: 5px;
  color: white;
  text-decoration: none;
}
</panel>
</code>

<solution>
a {
  font-family: sans-serif;
  padding: 10px;
  background-color: #00bfff;
  border-radius: 5px;
  color: white;
  text-decoration: none;
}
a:hover {
  background-color: #1e90ff;
}
</solution>
</codeblock>