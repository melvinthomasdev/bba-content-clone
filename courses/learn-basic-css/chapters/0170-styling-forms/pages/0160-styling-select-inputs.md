The `select` input can be styled in the
standard manner much like any other HTML element
or a form element:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<form>
  <p>
    Are you happy with our service?
  </p>
  <select name="review">
    <option value="5">Very Happy</option>
    <option value="4">Satisfied</option>
    <option value="3">Neutral</option>
    <option value="2">Unhappy</option>
    <option value="1">Disappointed</option>
  </select>
</form>
</panel>
<panel language="css">
select {
  width: 300px;
  padding: 15px;
  margin: 5px 0;
  width: 20em;
  border: 1px solid lightgray;
  background-color: beige;
  font-family: 'Helvetica', sans-serif;
  font-size: 1em;
}
</panel>
</code>
</codeblock>