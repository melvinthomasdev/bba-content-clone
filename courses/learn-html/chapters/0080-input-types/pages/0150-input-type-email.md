The `<input type="email">` defines
a field for an e-mail address.

Let us have a look at an example:
<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>Enter your email:</label>
  <input type="email" value="smith@example.com"><br>
  <button>Submit</button><br>
</form>
</code>
</codeblock>

This input type has an
in-built validation.
This prevents users to
add values which are not
in correct email format.

For e.g:
Correct email format: `abc@example.com`
Incorrect email format: `hello.com`
