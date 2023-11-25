Group all the elements inside
the form element using `fieldset`
element.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<h1>Choose a Seat:</h1>
<form>
  <select>
    <option value="summer">First Class</option>
    <option value="winter">Second Class</option>
    <option value="rainy">Third Class</option>
  </select>
</form>
</code>

<solution>
<h1>Choose a Seat:</h1>
<form>
  <fieldset>
    <select>
      <option value="summer">First Class</option>
      <option value="winter">Second Class</option>
      <option value="rainy">Third Class</option>
    </select>
  </fieldset>
</form>
</solution>
</codeblock>
