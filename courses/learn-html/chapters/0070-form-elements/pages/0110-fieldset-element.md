The `<fieldset>` element is used
to group related form elements.

<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>First Name:</label>
  <input placeholder="Sam" >

  <label>Last Name:</label>
  <input placeholder="Smith" >

  <fieldset disabled>
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
    <input placeholder="India" >
  </fieldset>
</form>
</code>
</codeblock>
