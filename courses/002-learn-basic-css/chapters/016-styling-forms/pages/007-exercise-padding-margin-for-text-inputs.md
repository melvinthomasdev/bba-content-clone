Add a padding of `2%`
and
a `margin` of `1em`
to both the input field as well as the
textarea.

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<form>
  <div>
    <input type="text" placeholder="Full Name" />
    <textarea rows="5" placeholder="Comments"></textarea>
  </div>
</form>
</panel>
<panel lang="css">
input[type="text"], textarea {
  width: 90%;
}
</panel>
</code>

<solution>
input[type="text"], textarea {
  width: 90%;
  padding: 2%;
  margin: 1em;
}
</solution>
</Editor>