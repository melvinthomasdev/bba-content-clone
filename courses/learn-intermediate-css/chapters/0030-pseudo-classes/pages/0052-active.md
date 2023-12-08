When you click or tap on an element,
it goes into the active state **during the click**.

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<form>
  <h3>Register:</h3>
  <input type="text" id="name" placeholder="Full name">
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
  background-color: rebeccapurple;
  color: white;
  font-size: 1em;
}

button:active {
  background-color: purple;
}
</panel>
</code>
</codeblock>

In the above example, the background color of the
**button** changes to **purple** when it is actively
clicked or tapped. This is often used to simulate
a **pressed** or **clicked** effect.
