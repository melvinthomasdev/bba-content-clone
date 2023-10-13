When we use `position: sticky`,
offsets become important for
controlling how sticky elements
behave and where they appear on the page.

**Types of Offsets**
There are four main types of
offsets you can use with
`position: sticky`:

- Top Offset: The `top` offset allows us
to control the element's position from the
top of the viewing screen.
A positive value pushes the element downward,
while a negative value pulls it upward.

- Bottom Offset: Similar to the `top` offset,
the `bottom` offset lets us control the
element's position from the bottom of the
viewing screen.
A positive value moves the element away from the bottom,
while a negative value brings it closer to the bottom.

- Left Offset: The `left` offset is used to define
the element's position from the left edge of the
viewing screen.
A positive value moves the element right,
while a negative right value moves it left.

- Right Offset: The `right` offset is used
to define the element's position from the
right edge of the viewing screen.
A positive value moves the element left,
while a negative right value moves it right.

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
  top: 10px;
  left: 50px;
}
</panel>
</code>
</codeblock>

In this example, we used `top`
and
`left` offsets to control the
vertical and horizontal position
of the sticky element.

We can experiment further by using `bottom`,
`right`, or a combination of these offsets
to precisely place your sticky elements.
