`<input type="checkbox">` allows the user to select one or more options from a list of choices.

<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>Fruits you like:</label>
  <br>
  <input type="checkbox" value="apple">
  <label>Apple</label>
  <br>
  <input type="checkbox" value="banana">
  <label>Banana</label>
  <br>
  <input type="checkbox" value="orange">
  <label>Orange</label>
  <br>
</form>
</code>
</codeblock>

The `value` attribute helps the website
understand the user's choice
and
hence you should remember to include them. If
you don't include a `value` attribute for a
particular input, the website will assume
it to be **on**.
