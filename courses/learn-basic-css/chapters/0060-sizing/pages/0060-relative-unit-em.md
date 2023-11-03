When length of an element is specified using `em`,
it is calculated based on the **font size**
of the element.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  Relative unit 'em'
</div>
</panel>
<panel language="css">
div {
  font-size: 20px;
  width: 10em;
  /* 10em = 10*font-size = 10*20px = 200px */
  background-color: orange;
}
</panel>
</code>
</codeblock>

If an element has no `font-size` specified,
the length is calculated based on the
**font size** of its nearest parent element.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="parent">
  <h1 id="child">
    Relative unit 'em'
  </h1>
</div>
</panel>
<panel language="css">
#parent {
  font-size: 15px;
}
#child {
  width: 10em;
  height: 10em;
  /* 10em = 10*font-size-of-parent = 10*15px = 150px */
  background-color: orange;
}
</panel>
</code>
</codeblock>

In the above example, the width and height
of the `h1` were calculated based on the
`font-size` of its parent element (`div`),
as `font-size` was not specified
for the child element (`h1`).
