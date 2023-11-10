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
  <br>

  <p>First Name:</p>
  <br>
  <input id="first-name" type="text" placeholder="Eve"/>
  <br>

  <p>Last Name:</p>
  <br>
  <input id="last-name" type="text" placeholder="Smith"/>
  <br>

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
<h2>Personal Information</h2>

<form>
  <label for="first-name">First Name:</label>
  <br>
  <input id="first-name" type="text" placeholder="Eve"/>
  <br>

  <label for="last-name">Last Name:</label>
  <br>
  <input id="last-name" type="text" placeholder="Smith"/>
  <br>

  <button type="submit">Submit</button>
</form>
<a href="#">Rules</a>
</code>
</codeblock>
