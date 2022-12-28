Text input fields
and
textareas have a border by default.
But we can change their
look using the `border` property:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<form>
  <input type="text" placeholder="First Name" />
  <br>
  <input type="text" placeholder="Last Name" />
  <br>
  <textarea rows="3" placeholder="Tell us about you"></textarea>
</form>
</panel>
<panel language="css">
input[type="text"], textarea {
  width: 300px;
  padding: 15px;
  margin: 10px 0;
}
input[type="text"] {
  border: none;
  border-bottom: 1px solid lightgray;
}
textarea {
  border: 1px solid lightgray;
}
</panel>
</code>
</codeblock>

We can create rounded corners
for these fields using the
`border-radius` property:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<form>
  <input type="text" placeholder="First Name" />
  <br>
  <input type="text" placeholder="Last Name" />
  <br>
  <textarea rows="3" placeholder="Tell us about you"></textarea>
</form>
</panel>
<panel language="css">
input[type="text"], textarea {
  width: 300px;
  padding: 15px;
  margin: 10px 0;
  border: 1px solid teal;
  border-radius: 10px;
}
</panel>
</code>
</codeblock>