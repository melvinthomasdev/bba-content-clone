We have 3 form elements with
their labels in the given form.
Attach the labels to their respective
form elements so that when we
click on the labels, the particular
form element should get highlighted.

<codeblock language="html" type="exercise" testMode="fixedInput" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>City Name:</label>
  <input type="text" id="city">
  <br>

  <label>Country Name:</label>
  <select id="country">
    <option>Kenya</option>
    <option>Egypt</option>
    <option>Zimbabwe</option>
  </select>
  <br>

  <label>Full Address:</label>
  <textarea id="address">
  </textarea>
  <br>

  <button>Submit</button>
</form>
</code>
<solution>
<form>
  <label for="city">City Name:</label>
  <input type="text" id="city">
  <br>

  <label for="country">Country Name:</label>
  <select id="country">
    <option>Kenya</option>
    <option>Egypt</option>
    <option>Zimbabwe</option>
  </select>
  <br>

  <label for="address">Full Address:</label>
  <textarea id="address">
  </textarea>
  <br>

  <button>Submit</button>
</form>
</solution>
</codeblock>
