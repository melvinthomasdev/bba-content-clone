Set the height and width of the submit button to a value equivalent to 40px and 100px, using `em`:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <button class="submit-button">
    Submit
  </button>
</div>
</panel>
<panel language="css">
.container {
  font-size: 20px;
}
.submit-button {
  color: snow;
  background-color: teal;
  font-size: 1em;
}
</panel>
</code>

<solution>
.container {
  font-size: 20px;
}
.submit-button {
  width: 5em;
  height: 2em;
  color: snow;
  background-color: teal;
  font-size: 1em;
}
</solution>
</codeblock>