Change the selector
`div` to the more specific
ID selector. This should apply **teal**
background color to the square:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div id="div1" class="shape"></div>
</panel>
<panel lang="css">
div {
  background-color: teal;
}
.shape {
  width: 100px;
  height: 100px;
  background-color: purple;
}
</panel>
</code>

<solution>
#div1 {
  background-color: teal;
}
.shape {
  width: 100px;
  height: 100px;
  background-color: purple;
}
</solution>
</Editor>