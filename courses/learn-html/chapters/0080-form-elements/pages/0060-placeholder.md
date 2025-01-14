Placeholder text is the text that appears in
an `input` field before the user clicks it and
starts typing. Placeholder text disappears
as soon as the user starts typing.

<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>Full Name:</label>
  <input placeholder="Sam Smith">
</form>
</code>
</codeblock>

**Placeholder vs Label:**

In HTML forms, **placeholders** are often used to give
users a hint or an example of what should be entered
in the respective input field.

While **labels** are used to add a label or short description
to an input field.

<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<h2>Sign up</h2>
<form>
  <label>First Name:</label>
  <input placeholder="Sam"><br>
  <label>Last Name: </label>
  <input placeholder="Smith"><br>
  <label>Date of Birth:</label>
  <input placeholder="DD/MM/YYYY"><br>
  <h4>Credit Card Information:</h4>
  <label>Credit Card Number:</label>
  <input placeholder="1234 5678 9012 3456"><br>
</form>
</code>
</codeblock>
