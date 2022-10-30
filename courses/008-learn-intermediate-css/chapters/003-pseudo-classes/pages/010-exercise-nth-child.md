Set `background-color` to
**orange** for every 4th
child element that is a `span`:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div>
  <span>Eve Smith</span>
  <span>Sam Smith</span>
  <span>Renu Sen</span>
  <span>Lao Xun</span>
  <span>John Doe</span>
  <span>Linh Tran</span>
  <span>Jane Doe</span>
  <span>Chinua Achebe</span>
  <span>Carlos Alberti</span>
</div>
</panel>
<panel lang="css">
span {
  display: inline-block;
  margin-right: 4px;
  padding: 5px 8px;
  border-radius: 3px;
  background-color: lightgray;
}
</panel>
</code>

<solution>
span {
  display: inline-block;
  margin-right: 4px;
  padding: 5px 8px;
  border-radius: 3px;
  background-color: lightgray;
}
span:nth-child(4n) {
  background-color: orange;
}
</solution>
</Editor>