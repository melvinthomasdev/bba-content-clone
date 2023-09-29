When we add a `<button>` element
with the type attribute set as `submit`,
it will be responsible for submitting
the data entered in the form by the user.

Let us take a look at the example:
<codeblock language="html" type="lesson">
<code>
<form id="form">
  <label>First Name:</label>
  <br>
  <input type="text" name="first-name"placeholder="First Name" />
  <br>

  <label>Last Name:</label>
  <br>
  <input type="text" name="last-name"placeholder="Last Name" />
  <br>

  <button type="submit">Submit</button>
</form>
</code>
</codeblock>

If the **type** attribute is not added
to a `<button>` element,
its default type will be `submit`.
