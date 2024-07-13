Avoid using the following
HTML elements directly inside
a `<form>`:
- p, h1-h6: It's best to avoid these elements directly inside `<form>`. They can cause accessibility issues and make form submission unclear.
- a: It is generally discouraged to have `<a>` elements directly inside a form for submit buttons, it can be acceptable for links within the form content, like "Forgot password?" or additional information links.

Let us take a look at an
incorrect form structure example:
<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <h2>Personal Information</h2>
  <br>

  <p>First Name:</p>
  <br>
  <input id="first-name" placeholder="Eve">
  <br>

  <p>Last Name:</p>
  <br>
  <input id="last-name" placeholder="Smith">
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
<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<h2>Personal Information</h2>

<form>
  <label for="first-name">First Name:</label>
  <br>
  <input id="first-name" placeholder="Eve">
  <br>

  <label for="last-name">Last Name:</label>
  <br>
  <input id="last-name" placeholder="Smith">
  <br>
  <a href="#">Rules</a>

  <button type="submit">Submit</button>
</form>
</code>
</codeblock>
