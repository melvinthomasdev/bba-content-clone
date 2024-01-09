Setting an element's position to `absolute`
lets us move it within its parent using `top`,
`right`, `bottom`, and `left` offsets.

This element will be placed relative to
the closest ancestor with any other
position value.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="outer-container">
  <div id="container">
    <div id="child-element-1">
      Child 1
    </div>
    <div id="child-element-2">
      Child 2
    </div>
    <div id="child-element-3">
      Child 3
    </div>
  </div>
</div>
</panel>
<panel language="css">
body {
  background-color: steelblue;
}
div {
  border: 2px solid white;
  color: white;
  font-size: 1.2rem;
}
#outer-container {
  position: relative;
  width: 90vw;
  height: 90vh;
}
#container {
  width: 60vw;
  height: 60vh;
  margin: 30px;
}
#child-element-1 {
  position: absolute;
  top: 10px;
  right: 10px;
}
#child-element-2, #child-element-3 {
  width: 40vw;
  margin: 10px;
}
</panel>
</code>
</codeblock>

In the above code, we can observe
that the element with **id** set
as **absolute** gets placed at the
top right corner of the element
with **id** set as **relative**.
