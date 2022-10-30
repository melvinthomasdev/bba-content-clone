The `border-style` property is used
to identify the type of border:

<Editor lang="css">
<code>
<panel lang="html">
<div id="first">
  Solid border
</div>
<div id="second">
  Dashed border
</div>
<div id="third">
  Double border
</div>
</panel>
<panel lang="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: solid;
}
#second {
  border-style: dashed;
}
#third {
  border-style: double;
}
</panel>
</code>
</Editor>

Values for `border-style` include `solid`, `dashed`, `double`, `dotted`, `groove`, `ridge`, `inset`, `outset` and `none`. Try them out in the code editor given above.