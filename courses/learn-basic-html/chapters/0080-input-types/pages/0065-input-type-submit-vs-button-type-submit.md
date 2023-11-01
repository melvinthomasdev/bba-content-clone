In HTML forms, there are two
common ways to create submission
buttons `<input type="submit">`
and
`<button type="submit">`.

Both type of buttons will
have the default behaviour
of submitting the form data
when they are clicked.

However, there are small
differences we need to be aware of.

Let us have a look at an example:
<codeblock language="html" type="lesson">
<code>
<!-- Input element of Type Submit -->
<form>
  <label>Company Name:</label>
  <br>
  <input type="text" placeholder="BigBinary">
  <br>

  <input type="submit">
</form>
<br>

<!-- Button element of Type Submit with text -->
<form>
  <label>Designation:</label>
  <br>
  <input type="text" placeholder="Software Engineer">
  <br>

  <button type="submit">Add Information</button>
</form>
<br>

<!-- Button element of Type Submit with HTML element -->
<form>
  <label>Name:</label>
  <br>
  <input type="text" placeholder="Sam Smith">
  <br>

  <button type="submit">
    <img src="https://ucarecdn.com/5a920084-5779-494d-9ee2-533bbb6d6c97/-/resize/60x60/">
  </button>
</form>
</code>
</codeblock>
As can be seen from the example,
we cannot add any content
in the input element because it
does not have a closing tag.

But, in the **button** element
with `type="submit"`,
we are free to add text,
images or even other HTML elements.
