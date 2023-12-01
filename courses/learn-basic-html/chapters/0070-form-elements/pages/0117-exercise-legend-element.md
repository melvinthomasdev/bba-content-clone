Group the `input` and `label`
for **review** in a `fieldset` element.

Also, add a legend element with
the text **Review Section**:
<codeblock language="html" type="exercise" testMode="fixedInput" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>First Name:</label>
  <br>
  <input placeholder="Sam" >
  <br>

  <label>Last Name:</label>
  <br>
  <input placeholder="Smith" >
  <br>

  <label>Gender:</label>
  <br>
  <input placeholder="Male" >
  <br>

  <label>Your Review:</label>
  <br>
  <input placeholder="Write a headline for your review here" >
  <br>

  <input type="submit">
</form>
</code>

<solution>
<form>
  <label>First Name:</label>
  <br>
  <input placeholder="Sam" >
  <br>

  <label>Last Name:</label>
  <br>
  <input placeholder="Smith" >
  <br>

  <label>Gender:</label>
  <br>
  <input placeholder="Male" >
  <br>

  <fieldset>
    <legend>Review Section</legend>
    <label>Your Review:</label>
    <br>
    <input placeholder="Write a headline for your review here" >
    <br>
  </fieldset>

  <input type="submit">
</form>
</solution>
</codeblock>
