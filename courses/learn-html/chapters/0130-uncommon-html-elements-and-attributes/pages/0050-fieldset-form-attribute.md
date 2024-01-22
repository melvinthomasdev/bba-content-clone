A `<fieldset>` element can
be placed outside of the
`<form>` element.

It will still be a part of
the same form.
We can achieve this by adding
the `form` attribute.

Value of this `form` attribute
will be the **id** of the `form`
element.

Let us take a look at an example:
<codeblock language="html" type="lesson">
<code>
<form id="form-1">
  <label>First Name:</label>
  <br>
  <input type="text" placeholder="Sam">
  <br>

  <label>Last Name:</label>
  <br>
  <input type="text" placeholder="Smith">
</form>
<a href="#">Terms and Conditions</a>

<fieldset form="form-1">
  <legend>Education Background</legend>
  <br>
  <label>Highest Qualification:</label>
  <br>
  <input type="text">
  <br>

  <label>University:</label>
  <br>
  <input type="text" placeholder="Harvard" >
  <br>

  <input type="submit">
</fieldset>
</code>
</codeblock>

