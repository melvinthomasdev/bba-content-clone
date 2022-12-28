Set a width of `300px`,
border style `solid`
with border width of `1px`,
padding of `10px`
and
color `#454566`
to the `select` input:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<form>
  <p>
    Choose your Cuisine:
  </p>
  <select name="cuisine">
    <option value="Italian">Italian</option>
    <option value="Indian">Indian</option>
    <option value="Mexican">Mexican</option>
    <option value="Chinese">Chinese</option>
  </select>
</form>
</panel>
<panel language="css">

</panel>
</code>

<solution>
select {
  width: 300px;
  border: 1px solid;
  padding: 10px;
  color: #454566;
}
</solution>
</codeblock>