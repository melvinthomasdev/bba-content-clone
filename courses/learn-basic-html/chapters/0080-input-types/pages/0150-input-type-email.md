The `<input type="email">` defines
a field for an e-mail address.

Let us have a look at an example:
<codeblock language="html" type="lesson">
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
