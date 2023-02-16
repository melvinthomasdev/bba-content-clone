Set a text colour of `#155E75`
and
a background colour of `#ECFEFF`
for the text input and textarea fields:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<form>
  <div>
    <input type="text" placeholder="Full Name"><br>
    <textarea rows="5" placeholder="Comments"></textarea>
  </div>
</form>
</panel>
<panel language="css">
input[type="text"], textarea {
  width: 350px;
  padding: 10px;
  margin: 10px;
  border: 1px solid;
}
</panel>
</code>

<solution>
input[type="text"], textarea {
  width: 350px;
  padding: 10px;
  margin: 10px;
  border: 1px solid;
  color: #155E75;
  background-color: #ECFEFF;
}
</solution>
</codeblock>