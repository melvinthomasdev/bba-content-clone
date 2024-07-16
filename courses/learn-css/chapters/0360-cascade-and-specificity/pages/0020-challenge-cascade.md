Change background colour of the
`div` to **teal** by adding
another rule later in the code. Add
this rule to the second `div` selector:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  width: 100px;
  height: 100px;
  background-color: purple;
}
div {
  border-radius: 50px;
}
</panel>
</code>

<solution>
div {
  width: 100px;
  height: 100px;
  background-color: purple;
}
div {
  border-radius: 50px;
  background-color: teal;
}
</solution>
</codeblock>