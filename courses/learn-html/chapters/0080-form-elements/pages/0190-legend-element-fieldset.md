
The `<legend>` element is usually
used inside a `<fieldset>` element.

It provides a title for the group
of form elements inside the fieldset.

Let us take a look at an example:
<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
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
