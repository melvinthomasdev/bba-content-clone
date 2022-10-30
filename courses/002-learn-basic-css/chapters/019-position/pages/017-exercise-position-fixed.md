Using `fixed` position, make the button
appear at the right bottom corner. It should be
positioned `1.5rem` from the
right and `1.5rem` from the bottom:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<button>Chat with us</button>
</panel>
<panel lang="css">
body {
  min-height: 300px
}
button {
  background-color: indigo;
  color: white;
  padding: 10px 20px;
  border-radius: 10px;
}
</panel>
</code>

<solution>
body {
  min-height: 300px
}
button {
  background-color: indigo;
  color: white;
  padding: 10px 20px;
  border-radius: 10px;
  position: fixed;
  right: 1.5rem;
  bottom: 1.5rem;
}
</solution>
</Editor>