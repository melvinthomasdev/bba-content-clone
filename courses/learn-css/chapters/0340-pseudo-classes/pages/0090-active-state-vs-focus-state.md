Let's look at an example:

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
input:focus {
  border: 2px solid #007bff;
  background-color: #f0f0f0;
  outline: none;
}

button:focus {
  border: 2px solid #007bff;
  background-color: #f0f0f0;
  outline: none;
}

button:active {
  color: #fff;
  background-color: #007bff;
}
</panel>
</code>
</codeblock>

In the above example, the `focus`
state styling is applied to both
the input fields and buttons, and
the `active` state styling is
applied only to the button.

When the button is clicked, both the `focus`
and `active` state stylings are triggered
simultaneously. To observe the `active` state
styling try keeping the button **clicked**
for a moment.

An element remains in the `focus` state
until we navigate away from it,
and it stays in `active` state until we release
the mouse click or key,
maintaining its activated status.
