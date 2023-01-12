We can set the text colour
and
background colour of text inputs
using the `color` and `background-color`
properties:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<form>
  <input type="text" placeholder="First Name" />
  <br>
  <input type="text" placeholder="Last Name" />
  <br>
  <textarea rows="3" placeholder="Tell us about you"></textarea>
</form>
</panel>
<panel language="css">
input[type="text"], textarea {
  width: 300px;
  padding: 15px;
  margin: 10px 0;
  border: 1px solid;
  color: indigo;
  background-color: lavender;
}
</panel>
</code>
</codeblock>

An interesting thing here is that
since we haven't specified any
border color, the text colour is
applied to the border too.