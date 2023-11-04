When we set the offset `top` property
of an element with position property
set as `relative`,
the element actually moves away from
the top edge of the screen or the
container element.

That is because the element is pushed
from the top towards bottom:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <div class="static">
    Static element
  </div>
  
  <div class="relative">
    Relative element
  </div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
  justify-content: space-around;
}
.relative {
  padding: 10px;
  background-color: orange;
  position: relative;
  top: 50px;
  border: 5px solid darkorange;
}
.static {
  padding: 10px;
  background-color: blue;
  border: 5px solid darkblue;
  color: white;
}
</panel>
</code>
</codeblock>

In the above code,
we can see that the position
of the element with class
`relative` appears **50px**
away from the top edge.

This is because we have added
the **position** property as
`relative` with **top** offset
of `50px` to the element with
class **relative**.