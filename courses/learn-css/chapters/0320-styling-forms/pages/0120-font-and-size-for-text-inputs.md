By default, the text field has a *sans-serif* font and the textarea has a *serif* font. The font sizes are different too.

Most of the HTML elements inherit the font family and font size from `body`, but the text input fields don't. They use their default values. To customize, we need to specify these properties separately:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<form>
  <input type="text" placeholder="Your Name">
  <br>
  <textarea rows="4" placeholder="Your Bio"></textarea>
</form>
</panel>
<panel language="css">
input[type="text"], textarea {
  width: 300px;
  padding: 15px;
  margin: 5px 0;
  width: 20em;
  border: 1px solid lightgray;
  font-family: 'Helvetica', sans-serif;
  font-size: 1em;
}
</panel>
</code>
</codeblock>