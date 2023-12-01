`value` attribute within each `<option>` specifies
the value linked to that particular choice.

<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>Choose a fruit:</label>
  <select>
    <option value="apple">Apple</option>
    <option value="orange">Orange</option>
    <option value="mango">Mango</option>
    <option value="papaya">Papaya</option>
  </select>
</form>
</code>
</codeblock>

In the example above, when the **Apple** option is selected,
the value **apple** and **fruit** are sent to the website
as part of the data on form submission.
