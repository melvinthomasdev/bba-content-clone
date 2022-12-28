The orange coloured `div` is
positioned **sticky** in the example given
below. Try to scroll inside the
example window:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="div1"></div>
<div id="sticky"></div>
</panel>
<panel language="css">
body {
  margin: 0;
  min-height: 200vh;
}
#div1 {
  width: 100px;
  height: 100px;
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

A `position:sticky` element has a `relative` position
until the user scrolls to it,
and then it behaves
in place like a `fixed` element.

As you can see in the example given above,
the **orange** `div` has a `position:sticky`
property. So, when you scroll, it keeps going up
like any other normal element. But as soon as
you reach it while scrolling, it stops
moving up. Now, it behaves like an element
fixed in its position.

The `top` property determines
the scroll position at which the
`sticky` element starts sticking.
In the above example, since
the `top` value is `10px`,
the `div` is positioned relatively
until the page is scrolled such
that the element is less than
`10px` away from the top.
Beyond that the element
stays fixed at
`10px` from the top.

Try changing the `top` value
to `0` or a negative value.
Also, try removing the `top` property
and
notice that the element does not stick.