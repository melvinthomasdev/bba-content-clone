Group all the elements inside
the form element using `fieldset`
element.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<h1>Choose a Color:</h1>
<form>
  <input type="radio" name="color" value="red">
  <label for="red">Red</label>
  <br>
  <input type="radio" name="color" value="blue">
  <label for="blue">Blue</label>
  <br>
  <input type="radio" name="color"  value="green">
  <label for="green">Green</label>
</form>
</code>

<solution>
<form>
  <fieldset>
    <legend>Choose a Color:</legend>
    <input type="radio" name="color" value="red">
    <label for="red">Red</label>
    <br>
    <input type="radio" name="color" value="blue">
    <label for="blue">Blue</label>
    <br>
    <input type="radio" name="color"  value="green">
    <label for="green">Green</label>
  </fieldset>
</form>
</solution>
</codeblock>
