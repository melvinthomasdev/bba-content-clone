
The `<legend>` element is usually
used inside a `<fieldset>` element.

It provides a title for the group
of form elements inside the fieldset.

Let us take a look at an example:
<codeblock language="html" type="lesson">
<code>
<form>
  <label>Name:</label>
  <br>
  <input placeholder="Sam Smith">
  <br>

  <label>Email:</label>
  <br>
  <input placeholder="smith@example.com">
  <br>

  <fieldset>
    <legend>Shipping Address</legend>
    <label>Apartment/Block:</label>
    <br>
    <input placeholder="Office #803, 8th Floor, World Trade Center, Tower 2, Kharadi">
    <br>

    <label>City:</label>
    <br>
    <input placeholder="Pune" >
    <br>

    <label>State:</label>
    <br>
    <input placeholder="Maharashtra" >
    <br>

    <label>Country:</label>
    <br>
    <input placeholder="India">
    <br>

    <label>Zip Code:</label>
    <br>
    <input placeholder="411014" >
    <br>
  </fieldset>

  <input type="submit">
</form>
</code>
</codeblock>
