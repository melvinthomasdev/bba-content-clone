Make the button appear at the right
bottom corner positioned `1.5rem` from
the right and `1.5rem` from the bottom,
using the `inset` property:

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
  position: fixed;
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
  inset: auto 1.5rem 1.5rem auto;
}
</solution>
</Editor>