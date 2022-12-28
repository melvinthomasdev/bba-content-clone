`<input type="radio">` is used to create a list from which the user can select one option.

<codeblock language="html" type="lesson">
<code>
<form>
  <label>Can you vote?</label>
  <br />
  <input type="radio" id="vote1" value="no" name="vote">
  <label>No</label>
  <br />
  <input type="radio" id="vote2" value="yes" name="vote">
  <label>Yes</label>
  <br />
  <input type="radio" id="vote3" value="maybe" name="vote">
  <label>Maybe!</label>
</form>
</code>
</codeblock>

The `value` attribute is important for the website to analyze the choice made by the user. Also, it is required to have the `name` attribute be the same for all the `radio` input types for them to be treated as a group.
