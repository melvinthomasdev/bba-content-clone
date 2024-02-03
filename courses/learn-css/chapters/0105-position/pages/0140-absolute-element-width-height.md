If an absolute element has no `height` specified,
we can make the element fill up the available
vertical space by specifying both `top` and `bottom` values.
Similarly, we can make the absolute element
fill up the available horizontal space by
specifying both `left` and `right` values when
`width` is not specified:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="parent">
  <div id="absolute">
  </div>
</div>
</panel>
<panel language="css">
#parent {
  position: relative;
  background-color: teal;
  width: 200px;
  height: 200px;
}
#absolute {
  /* No width & height */
  position: absolute;
  background-color: orange;
  top: 20px;
  right: 0;
  bottom: 20px;
  left: 0;
}
</panel>
</code>
</codeblock>

Try changing the four offset values and see the absolute element auto adjust its width and height.

If both `top` and `bottom` values are specified for an element and the element is also provided a `height` value, the element takes up the specified height, and ignores the `bottom` property value. Similarly, when both `left` and `right` values are provided along with a `width` value, the element takes up the specified width and ignores the `right` property value:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="parent">
  <div id="absolute">
  </div>
</div>
</panel>
<panel language="css">
#parent {
  position: relative;
  background-color: teal;
  width: 200px;
  height: 200px;
}
#absolute {
  /* Width & height specified */
  position: absolute;
  background-color: orange;
  width: 100px;
  height: 100px;
  top: 20px;
  right: 0; /* right ignored */
  bottom: 20px; /* bottom ignored */
  left: 0;
}
</panel>
</code>
</codeblock>