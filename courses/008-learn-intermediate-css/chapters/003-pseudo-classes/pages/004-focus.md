When you click or tap on an element,
or when you use the `tab` key on
keyboard to move to it,
an element gets **focus**.
By default, the browser
adds a blue `outline` to
an element that is focused.
This can be changed
using the `:focus` pseudo-class:

<Editor lang="css">
<code>
<panel lang="html">
<form>
  <h3>Register:</h3>
  <input type="text" id="name" placeholder="Full name" />
  <button type="button">Submit</button>
</form>
</panel>
<panel lang="css">
input[type="text"] {
  border: 1px solid lightgray;
  padding: 4px 8px;
  font-size: 1em;
}
button {
  border: none;
  padding: 4px 8px;
  background-color: purple;
  color: white;
  font-size: 1em;
}
#name:focus {
  outline: 1px solid black;
}
button:focus {
  outline: 1px solid darkblue;
}
</panel>
</code>
</Editor>

Tap on the text input to notice the `:focus` styles applied. Now use the `tab` key on your keyboard to move to the button and notice the `:focus` styles of button applied.