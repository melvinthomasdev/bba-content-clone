Group all the elements inside
the form element using `fieldset`
element.

<codeblock language="html" type="exercise" testMode="fixedInput" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
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
