We can separately set margin properties
for each side of an element using
`margin-top`, `margin-bottom`,
`margin-left` and `margin-right`.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p id="first">
  A paragraph with 50px margin at the top and 100px margin on the left
</p>
<p id="second">
  Another paragraph with 80px margin on the right
</p>
</panel>
<panel language="css">
#first {
  background-color: yellow;
  margin-top: 50px;
  margin-left: 100px;
}
#second {
  background-color: orange;
  margin-right: 80px;
}
</panel>
</code>
</codeblock>