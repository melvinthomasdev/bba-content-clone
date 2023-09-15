`value` attribute within each `<option>` specifies
the value linked to that particular choice.

<codeblock language="html" type="lesson">
<code>
<form>
  <select name="fruit">
      <option value="apple">Apple</option>
      <option value="orange">Orange</option>
      <option value="mango">Mango</option>
      <option value="papaya">Papaya</option>
  </select>
</form>
</code>
</codeblock>

In the example above, when the **Apple** option is selected,
the value **apple** is transmitted to the server as part of
the data with the `key` **fruit** upon form submission.
