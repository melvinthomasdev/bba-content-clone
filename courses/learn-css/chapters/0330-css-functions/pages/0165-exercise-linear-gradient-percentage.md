Modify the gradient such that there is no mixing of colours.
The colour **purple** ends at 30%, **pink** at 50%,
**lightblue** at 70% and **coral** at 100%.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  height: 100vh;
  background: linear-gradient(to right, purple, pink, lightblue, coral);
}
</panel>
</code>

<solution>
div {
  height: 100vh;
  background: linear-gradient(to right, purple 0% 30%, pink 30% 50%, lightblue 50% 70%, coral 70% 100%);
}
</solution>
</codeblock>
