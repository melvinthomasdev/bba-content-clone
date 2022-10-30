Add a `border-radius` of `0px` to the top-left corner and `30px` to the other three corners by specifying three values for the property:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div>
    I am a chat bubble
  </div>
</panel>
<panel lang="css">
div {
  width: 150px;
  padding: 30px;
  font-size: 20px;
  background-color: lightgray;
}
</panel>
</code>

<solution>
div {
  width: 150px;
  padding: 30px;
  font-size: 20px;
  background-color: lightgray;
  border-radius: 0px 30px 30px;
}
</solution>
</Editor>