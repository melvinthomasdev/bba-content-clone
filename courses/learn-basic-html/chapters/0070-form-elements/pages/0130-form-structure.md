The basic structure of a form is as follows:

```html
<form>
  <!--  label, input, textarea, fieldset go inside form element -->
</form>
```

The form structure with all the
elements we have covered are
as follows:

<codeblock language="html" type="lesson">
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