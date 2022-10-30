Set a `thin` border on top, `thick` border at the bottom,
and `0px` on the left and right of this `div`,
using three values for the `border-width` property:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div>
</div>
</panel>
<panel lang="css">
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
</Editor>