When length of an element is specified using `em`,
it is calculated based on the **font size**
of the element. If this element has no `font-size` specified,
the length is calculated based on the
**font size** of its nearest parent element.

As a default, `1em = 16px`.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  Relative unit 'em'
</div>
</panel>
<panel language="css">
div {
  width: 10em;
  height: 10em;
  /* 10em = 10*font-size = 10*20px = 200px */
  background-color: orange;
  font-size: 20px;
}
</panel>
</code>
</codeblock>

In the above example, the width and height
of the `div` were calculated based on the `div`'s `font-size`.

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

In the above example, the width and height of the `h1` were calculated based on the `font-size`
of its parent element (`div`), as `font-size` was not specified
for the child element (`h1`).

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="parent">
  <h1 id="child"> Relative unit 'em' </h1>
</div>
</panel>
<panel language="css">
#parent {
  font-size: 20px;
}
#child {
  width: 5em;
  height: 5em;
  /* 
  font-size = 1 em = 1*20px = 20px
  width & height = 5em = 5*font-size = 5*20px = 100px
  */
  font-size: 1em;
  background-color: peachpuff;
}
</panel>
</code>
</codeblock>

In the above example, the width and height of `h1` was calculated based on `h1`'s font size.
Though one thing different here is that, the font-size itself is given in `em`. 
So the font-size value of `h1` now depends on the font-size of its parent element.