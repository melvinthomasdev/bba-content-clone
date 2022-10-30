When you set the `right` property
of a `relative` element, the element
actually moves to the left.
That is because the element
is pushed from the right side:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  Relative element
</div>
</panel>
<panel lang="css">
div {
  padding: 10px;
  background-color: orange;
  position: relative;
  right: 50px;
  border: 5px solid darkorange;
}
</panel>
</code>
</Editor>

Similarly, when you set the
`bottom` property of a relative
element, it moves upwards,
because it is pushed from the bottom:

<Editor lang="css">
<code>
<panel lang="html">
<div>
    Relative element pushed up from the bottom
</div>
</panel>
<panel lang="css">
body {
  margin: 0;
}
div {
  width: 150px;
  padding: 10px;
  background-color: orange;
  position: relative;
  bottom: 20px;
  border: 5px solid darkorange;
}
</panel>
</code>
</Editor>