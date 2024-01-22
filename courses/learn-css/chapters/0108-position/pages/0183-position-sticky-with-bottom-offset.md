The `bottom` offset allows us
to control the element's position
from the bottom edge of the viewing
screen
or
the bottom edge of its container
element.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="non-sticky-div"></div>
<div id="sticky-div"></div>
</panel>
<panel language="css">
body {
  margin: 0;
  height: 400vh;
  width: 400vh;
}
#non-sticky-div {
  margin-top: 50px;
  width: 100vw;
  height: 200vh;
  background-color: teal;
}
#sticky-div {
  background-color: orange;
  width: 50px;
  height: 50px;
  position: sticky;
  bottom: 50px;
}
</panel>
</code>
</codeblock>

In this example, as we scroll
to the top,
the `div` elements with the
`non-sticky-div`
and
`sticky-div` id move towards
the bottom.

However, when the `div` with
the `sticky-div` id is at a
distance of **100px** from the
bottom edge, it stops moving down,
unlike the `div` with the
`non-sticky-div` id.

This happens because the `position: sticky`
and
the `bottom` offset come into effect.

Try changing the `bottom` offset
value and observe the effect.
