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
  <input type="text">
  <br><br>
  <fieldset>
    <legend>Address:</legend>
    <label>Apartment/Office:</label>
    <br>
    <input type="text" placeholder="Office #803, World Trade Center, Tower 2" >
    <label>City:</label>
    <br>
    <input type="text" placeholder="Pune">
    <br>
    <label>State:</label>
    <input type="text" placeholder="Maharashtra">
    <br>
    <label>Country:</label>
    <input type="text" placeholder="India">
    <br>
  </fieldset>
  <br>
  <label>Review:</label>
  <br>
  <textarea rows="3" cols="30" placeholder="Add detailed review here"></textarea>
  <br><br>
  <label>Favorite color:</label>
  <select>
    <option value="apple">Red</option>
    <option value="orange">Green</option>
    <option value="mango">Blue</option>
  </select>
  <br><br>
  <button type="reset">Reset</button>
  <input type="submit">
</form>
</code>
</codeblock>