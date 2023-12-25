The calculations for the width or height
in the box model tend to become complex.
This is why, CSS has an alternative
box model, where the padding
and
border sizes are included within the specified width.
The margin is excluded. This makes the
calculation of the width simpler.

The property `box-sizing` is used
to determine how these calculations
will be done. By default, the value
is `content-box` because of which
the original box model is used.
When we set this
to `border-box`, the alternate
model is followed:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="standard">
  Standard box model
</div>
<div id="alternate">
  Alternate box model
</div>
</panel>
<panel language="css">
div {
  background-color: lightgreen;
  width: 250px;
  height: 80px;
  padding: 20px;
  border: solid 10px darkgreen;
  margin: 20px;
}
#standard {
  box-sizing: content-box; /* Default */
}
#alternate {
  box-sizing: border-box;
}
</panel>
</code>
</codeblock>

In the above example,
the visible width of the second
div is the same as the specified
width of `250px` because the `box-sizing`
is now `border-box`.