Make the button appear at the right
bottom corner positioned `1.5rem` from
the right and `1.5rem` from the bottom,
using the `inset` property:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<button>Chat with us</button>
</panel>
<panel language="css">
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
</codeblock>