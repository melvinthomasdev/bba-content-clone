Avoid using the following
HTML elements directly inside
a `<form>`:
- p
- h1 to h6
- a

Let us take a look at an
incorrect form structure example:
<codeblock language="html" type="lesson">
<code>
<form>
  <h2>Personal Information</h2>
  <p>First Name:</p>
  <input id="first-name" type="text" />
  <button type="submit">Submit</button>
</form>
</code>
</codeblock>

In the code above, we've placed `<h1>`
and
`<p>` tags inside a `<form>` element,
which isn't the correct structure for a form.

Let us have a look at the same example
with correct form structure:
<codeblock language="html" type="lesson">
<code>
<form>
  <caption>Personal Information</caption>
  <br>
  <label for="first-name">First Name:</label>
  <input id="first-name" type="text" />
  <button type="submit">Submit</button>
</form>
<a href="#">Rules</a>
</code>
</codeblock>
