Set a `thin` border on top, `thick` border at the bottom,
and `0px` on the left and right of this `div`,
using three values for the `border-width` property:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
</div>
</panel>
<panel language="css">
div {
  width: 200px;
  height: 100px;
  background-color: lightgray;
  border-style: double;
}
</panel>
</code>

<solution>
div {
  width: 200px;
  height: 100px;
  background-color: lightgray;
  border-style: double;
  border-width: thin 0px thick;
}
</solution>
</codeblock>