Set a border width of `1px` on top and bottom,
and `2px` on left and right of this `div`:

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
  border-style: solid dashed;
}
</panel>
</code>

<solution>
div {
  width: 200px;
  height: 100px;
  background-color: lightgray;
  border-style: solid dashed;
  border-width: 1px 2px;
}
</solution>
</Editor>