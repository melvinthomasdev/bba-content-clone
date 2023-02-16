Make the first `textarea` vertically resizable
but prevent its horizontal resizing. Prevent
resizing the second `textarea` in both directions:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<form>
  <textarea id="first" rows="3" placeholder="Your thoughts"></textarea><br>
  <textarea id="second" rows="6" placeholder="Tell us about you in 60 words"></textarea>
</form>
</panel>
<panel language="css">
textarea {
  width: 300px;
  padding: 15px;
  border: 1px solid lightgray;
}
</panel>
</code>

<solution>
textarea {
  width: 300px;
  padding: 15px;
  border: 1px solid lightgray;
}
#first {
  resize: vertical;
}
#second {
  resize: none;
}
</solution>
</codeblock>