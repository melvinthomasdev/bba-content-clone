For the border shorthand property,
`border-style` value is required.
The **colour** and **width** are optional.

<Editor lang="css">
<code>
<panel lang="html">
<div id="first">
  Border colour not provided
</div>
<div id="second">
  Border width not provided
</div>
<div id="third">
  Border width and colour both not provided
</div>
<div id="fourth">
  Border style not provided
</div>
</panel>
<panel lang="css">
div {
  padding: 10px;
  margin: 10px;
}

#first {
  border: 5px solid;
}

#second {
  border: solid purple;
}

#third {
  border: solid;
}

#fourth {
  border: 5px purple;
}
</panel>
</code>
</Editor>