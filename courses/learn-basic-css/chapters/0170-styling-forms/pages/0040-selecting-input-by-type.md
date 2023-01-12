If we use the `input` selector for styling, the changes will apply to all types of inputs including text input fields, radio buttons, checkboxes, button input types, etc. Look at the example given below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<form>
  <input type="text" placeholder="Your Name" /><br>
  <input type="radio" id="male" name="gender" value="male">
  <label for="male">Male</label>
  <input type="radio" id="female" name="gender" value="female">
  <label for="female">Female</label>
  <input type="radio" id="other" name="gender" value="other">
  <label for="other">Other</label><br>
  <input type="button" value="Submit">
</form>
</panel>
<panel language="css">
input {
  width: 200px;
  height: 25px;
}
</panel>
</code>
</codeblock>

To style each type of input differently,
we can select these elements
using the attribute selector:

`input[type="value"]`

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<form>
  <input type="text" placeholder="Your Name" /><br>
  <input type="radio" id="male" name="gender" value="male">
  <label for="male">Male</label>
  <input type="radio" id="female" name="gender" value="female">
  <label for="female">Female</label>
  <input type="radio" id="other" name="gender" value="other">
  <label for="other">Other</label><br>
  <input type="button" value="Submit">
</form>
</panel>
<panel language="css">
input[type="text"] {
  width: 300px;
  height: 25px;
  margin-bottom: 20px;
}
input[type="radio"] {
  width: 50px;
  height: 10px;
}
input[type="button"] {
  margin-top: 20px;
  width: 200px;
  height: 25px;
}
</panel>
</code>
</codeblock>