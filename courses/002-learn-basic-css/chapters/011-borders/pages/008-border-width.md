The `border-width` property is used
to specify the thickness of the borders.

For specifying values, we can
use the standard absolute or relative units
or we can use values like `thin`, `medium` or `thick`.

When this property is not set,
a medium border appears by default.

<Editor lang="css">
<code>
<panel lang="html">
<div id="first">
  Thin border
</div>
<div id="second">
  Medium border
</div>
<div id="third">
  Bottom border with 2 pixels thickness
</div>
</panel>
<panel lang="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: solid;
  border-width: thin;
}
#second {
  border-style: solid;
  /* Width not specified */
}
#third {
  border-style: none none solid;
  border-width: 2px;
}
</panel>
</code>
</Editor>

An interesting point that
we need to remember is that
without the `border-style` property,
the `border-width` will not work.
Try removing `border-style` for
any div in the example given above.