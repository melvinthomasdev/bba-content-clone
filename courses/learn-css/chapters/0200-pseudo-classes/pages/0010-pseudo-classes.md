When you want to apply styles to
an element in a specific state, such as,
when the element is hovered over
by the mouse pointer or when the
element is focused on by user's click
or tap, you can use **pseudo-classes**
like `:hover` or `:focus`.

Let's look at some examples below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<form>
  <input type="text" id="name" placeholder="First name">
  <input type="text" placeholder="Last name">
  <button type="button">Submit</button>
</form>
</panel>
<panel language="css">
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
  outline: none;
  border: 1px solid black;
}
button:hover {
  background-color: darkblue;
}
</panel>
</code>
</codeblock>

Take your mouse pointer over the
button to see it change color.
Also, click on both the input
fields to notice the difference.
We will learn more about these
pseudo-classes in the next few
lessons.

Pseudo-classes act
similar to classes, but without
actually adding class names to
your HTML. This is why, they are
called pseudo-classes.