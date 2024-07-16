The `width` property is used to
set the width of an element.
Width can be defined in percentage `%`
or pixels `px`.

Percentage width is calculated based on
the width of its immediate parent element.
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="parent">
  <div id="first">
    This div is set to 300px width
  </div>
  <div id="second">
    This div is set to 50% width
  </div>
</div>
</panel>
<panel language="css">
#parent {
  border: 3px solid darkcyan;
}
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
</codeblock>