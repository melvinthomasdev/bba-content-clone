Just like any other element in HTML,
you can give a width and height to
text fields and text areas using
any of the sizing units.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<form>
    <input type="text" placeholder="Your Name">
    <textarea placeholder="Your Bio"></textarea>
</form>
</panel>
<panel language="css">
form {
  width: 300px;
  border: 3px solid black;
}
input {
  width: 200px;
  height: 25px;
}
textarea {
  width: 100%;
  height: 100px;
}
</panel>
</code>
</codeblock>

The `textarea` in the above example
occupies 100% width of its parent
element, `form`.