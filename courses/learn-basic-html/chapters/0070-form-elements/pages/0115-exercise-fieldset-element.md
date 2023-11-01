Group all the elements in
the form concerned with
**address** in a `fieldset`
element.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<form>
  <label>First Name:</label>
  <br>
  <input type="text" placeholder="Sam" >
  <br>

  <label>Last Name:</label>
  <br>
  <input type="text" placeholder="Smith" >
  <br>

  <label>Gender:</label>
  <br>
  <input type="text" placeholder="Male" >
  <br>

  <label>Apartment/Office:</label>
  <br>
  <input type="text" placeholder="Office #803, World Trade Center, Tower 2" >
  <br>

  <label>Street/Area:</label>
  <br>
  <input type="text" placeholder="Kharadi" >
  <br>

  <label>City:</label>
  <br>
  <input type="text" placeholder="Pune" >
  <br>

  <label>Country:</label>
  <br>
  <input type="text" placeholder="India" >
  <br>

  <input type="submit">
</form>
</code>

<solution>
<form>
  <label>First Name:</label>
  <br>
  <input type="text" placeholder="Sam" >
  <br>

  <label>Last Name:</label>
  <br>
  <input type="text" placeholder="Smith" >
  <br>

  <label>Gender:</label>
  <br>
  <input type="text" placeholder="Male" >
  <br>

  <fieldset>
    <label>Apartment/Office:</label>
    <br>
    <input type="text" placeholder="Office #803, World Trade Center, Tower 2" >
    <br>

    <label>Street/Area:</label>
    <br>
    <input type="text" placeholder="Kharadi" >
    <br>

    <label>City:</label>
    <br>
    <input type="text" placeholder="Pune" >
    <br>

    <label>Country:</label>
    <br>
    <input type="text" placeholder="India" >
    <br>
  </fieldset>

  <input type="submit">
</form>
</solution>
</codeblock>
