Buttons can be styled in various ways using the standard properties - `width`, `height`, `padding`, `background-color`, `color`, `border`, `border-radius`, `font-family`, `font-size` and more.

Look at some examples below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<input type="button" value="Next">
    <input type="reset" value="Reset"><br>
    <input type="submit" value="Submit">
</panel>
<panel language="css">
input[type="button"] {
  width: 100px;
  padding: 12px 16px;
  background-color: #4568bb;
  color: white;
  font-family: sans-serif;
  font-size: 0.9em;
  border: none;
  border-radius: 5px;
}
input[type="reset"] {
  width: 100px;
  padding: 12px 16px;
  margin-left: 10px;
  background-color: white;
  color: #4568bb;
  font-family: sans-serif;
  font-size: 0.9em;
  border: 1px solid #4568bb;
  border-radius: 5px;
}
input[type="submit"] {
  width: 100%;
  padding: 15px 0;
  margin-top: 10px;
  background-color: green;
  color: white;
  font-family: sans-serif;
  font-size: 1em;
  border: none;
}
</panel>
</code>
</codeblock>