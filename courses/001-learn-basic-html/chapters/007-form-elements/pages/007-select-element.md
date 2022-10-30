For creating drop-down lists in
our forms, we use the `<select>` element.

<Editor lang="html">
<code>
<form>
  <select>
      <option value="apple">Apple</option>
      <option value="orange">Orange</option>
      <option value="mango">Mango</option>
      <option value="papaya">Papaya</option>
  </select>
</form>
</code>
</Editor>

If we do not provide a `name` to the
`select` element, no data will be sent
when the form is submitted. Let's provide
a proper name to our drop-down list:

<Editor lang="html">
<code>
<form>
  <select name="fruits">
      <option value="apple">Apple</option>
      <option value="orange">Orange</option>
      <option value="mango">Mango</option>
      <option value="papaya">Papaya</option>
  </select>
</form>
</code>
</Editor>

You can see that nothing changes in the result.
But adding a name is essential for sending data
across, so try not to forget it.
