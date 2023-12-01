`<input type="password">` is used for submitting a password. For security purposes, it hides the text entered by the user by displaying symbols like the dot in place of each character entered.

<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>Email:</label>
  <input type="text" placeholder="smith@example.com">
  <br>
  <label>Password:</label>
  <input type="password" >
</form>
</code>
</codeblock>