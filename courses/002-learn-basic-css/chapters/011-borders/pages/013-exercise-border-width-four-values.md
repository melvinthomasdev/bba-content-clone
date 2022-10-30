Set a border width of `1px` on top, right and bottom,
and `4px` on the left of this `div`:

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
  border-style: solid;
}
</panel>
</code>

<solution>
div {
  width: 200px;
  height: 100px;
  background-color: lightgray;
  border-style: solid;
  border-width: 1px 1px 1px 4px;
}
</solution>
</Editor>