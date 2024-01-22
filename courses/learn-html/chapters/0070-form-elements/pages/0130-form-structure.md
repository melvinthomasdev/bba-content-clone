The basic structure of a form is as follows:

```html
<form>
  <!--  label, input, textarea, fieldset go inside form element -->
</form>
```

The form structure with all the
elements we have covered are
as follows:

<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>Name: </label>
  <input>

  <fieldset>
    <legend>Address:</legend>
    <label>Apartment/Office:</label>
    <br>
    <input placeholder="Office #803, World Trade Center, Tower 2" >
    <br>

    <label>City:</label>
    <br>
    <input placeholder="Pune">
    <br>

    <label>State:</label>
    <input placeholder="Maharashtra">
    <br>

    <label>Country:</label>
    <input placeholder="India">
    <br>
  </fieldset>

  <label>Review:</label>
  <br>
  <textarea rows="3" cols="30" placeholder="Add detailed review here"></textarea>
  <br>

  <label>Favorite color:</label>
  <select>
    <option value="apple">Red</option>
    <option value="orange">Green</option>
    <option value="mango">Blue</option>
  </select>
  <br>

  <button type="reset">Reset</button>
  <button type="submit">Submit</button>
</form>
</code>
</codeblock>
