While on hover and focus,
change the background color of the
textarea to `beige`
and
remove the outline:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<textarea placeholder="Type your text here"></textarea>
</panel>
<panel lang="css">
textarea {
  width: 400px;
  background-color: white;
  border: 1px solid #cccccc;
}
</panel>
</code>

<solution>
textarea {
  width: 400px;
  background-color: white;
  border: 1px solid #cccccc;
}
textarea:hover, textarea:focus {
  background-color: beige;
  outline: none;
}
</solution>
</Editor>