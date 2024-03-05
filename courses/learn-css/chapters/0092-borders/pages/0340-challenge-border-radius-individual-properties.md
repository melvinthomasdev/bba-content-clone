Turn this square div into a quarter-circle by specifying a `100%` top-left border radius:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  </div>
</panel>
<panel language="css">
div {
  width: 150px;
  height: 150px;
  background-color: turquoise;
}
</panel>
</code>

<solution>
div {
  width: 150px;
  height: 150px;
  background-color: turquoise;
  border-top-left-radius: 100%;
}
</solution>
</codeblock>