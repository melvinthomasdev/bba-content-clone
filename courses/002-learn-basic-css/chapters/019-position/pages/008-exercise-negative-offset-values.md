For the `div`, set `position` to `relative`, and `top` and `left` properties to `-100px`. The  `div` should look like a quarter circle. It should be positioned in the top left corner of the window:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div></div>
</panel>
<panel lang="css">
body {
  margin: 0;
}
div {
  width: 200px;
  height: 200px;
  background-color: indigo;
  border-radius: 100px;
}
</panel>
</code>

<solution>
body {
  margin: 0;
}
div {
  width: 200px;
  height: 200px;
  background-color: indigo;
  border-radius: 100px;
  position: relative;
  top: -100px;
  left: -100px;
}
</solution>
</Editor>