Sometimes, we want to overlap one element
over another. We can achieve this with
`position:relative`, but which
element appears in front
or at the back can be difficult to manage.
This is why, we have the `z-index` property.

The element with a lower `z-index`
value goes behind the one with a
higher `z-index`:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div id="one">
</div>
<div id="two">
</div>
<div id="three">
</div>
</panel>
<panel language="css">
div {
  width: 80px;
  height: 80px;
  position: relative;
}
#one {
  background-color: indigo;
  z-index: 4;
}
#two {
  background-color: orange;
  bottom: 50px;
  left: 30px;
  z-index: -1;
}
#three {
  background-color: teal;
  bottom: 100px;
  left: 60px;
  z-index: 4;
}
</panel>
</code>
</codeblock>

Try changing the `z-index` values to
any number, positive or negative, to
see how the order of the elements
changes.

If `z-index` is not specified
for overlapping elements, then the
element that appears later in
the HTML markup goes in the front.

`z-index` does not work on
elements with `static` position.