The `width` property is used to
set the width of an element.
Width can be defined in percentage `%`
or pixels `px`.

Percentage width is calculated based on
the width of its immediate parent element.
<Editor lang="css">
<code>
<panel lang="html">
<div id="first">
  This div is set to 300px width
</div>
<div id="second">
  This div is set to 50% width
</div>
</panel>
<panel lang="css">
#first {
  width: 300px;
  height: 100px;
  background-color: yellow;
}
#second {
  width: 50%;
  height: 100px;
  background-color: orange;
}
</panel>
</code>
</Editor>