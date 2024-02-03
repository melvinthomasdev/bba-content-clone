The `top` offset allows us
to control the element's
position from the top edge
of the viewing screen
or
the top edge of its container
element.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="div1"></div>
<div id="sticky"></div>
</panel>
<panel language="css">
body {
  margin: 0;
  height: 400vh;
  width: 400vh;
}
#div1 {
  width: 100vw;
  height: 100vh;
  background-color: teal;
}
#sticky {
  background-color: orange;
  width: 50px;
  height: 50px;
  position: sticky;
  top: 100px;
}
</panel>
</code>
</codeblock>

In this example,
when we keep scrolling down
and
reach the orange `div`,
the position `sticky`
and
`top` offset come into effect.

We can see that the `div` does
not scroll down like the other content.

It stays fixed at **100px** from the
top as specified in the top offset.

Change the value of the top offset
from **100px** to anything else
and
notice the difference.
