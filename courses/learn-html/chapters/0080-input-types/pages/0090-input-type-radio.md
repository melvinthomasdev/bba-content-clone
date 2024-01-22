`<input type="radio">` is used to create a list from which the user can select one option.

<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>Can you vote?</label>
  <br>
  <input type="radio" value="no" name="vote">
  <label>No</label>
  <br>
  <input type="radio" value="yes" name="vote">
  <label>Yes</label>
  <br>
  <input type="radio" value="maybe" name="vote">
  <label>Maybe!</label>
</form>
</code>
</codeblock>

The `value` attribute is important for the website to analyze the choice made by the user. Also, it is required to have the `name` attribute be the same for all the `radio` input types for them to be treated as a group.
