Create 3 checkboxes with the `value` attributes
set to **English**, **Mandarin** and **Spanish**
respectively.

Add labels for the checkbox inputs and
add in them **English**, **Mandarin** and **Spanish**
respectively.

Add all this after the `br` element.

<codeblock language="html" type="exercise" testMode="fixedInput" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>Languages you know:</label>
  <br>
</form>
</code>

<solution>
<form>
  <label>Languages you know:</label>
  <br>
  <input type="checkbox" value="English">
  <label>English</label>
  <input type="checkbox" value="Mandarin">
  <label>Mandarin</label>
  <input type="checkbox" value="Spanish">
  <label>Spanish</label>
</form>
</solution>
</codeblock>
