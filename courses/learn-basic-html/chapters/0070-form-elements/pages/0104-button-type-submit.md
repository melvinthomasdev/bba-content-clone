When we add a `<button>` element
with the type attribute set as `submit`,
it will be responsible for submitting
the data entered in the form by the user.

Let us take a look at the example:
<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form id="form">
  <label>First Name:</label>
  <br>
  <input placeholder="Renu" />
  <br>

  <label>Last Name:</label>
  <br>
  <input placeholder="Sen" />
  <br>

  <button type="submit">Submit</button>
</form>
</code>
</codeblock>

If the **type** attribute is not added
to a `<button>` element,
its default type will be `submit`.
