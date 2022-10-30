The default value for the `position`
property is **static**. It makes the
elements follow the normal flow.

When you set an element's `position` to **relative**,
you can move the element to a new location.

The `top`, `right`,
`bottom` and `left`
properties are used to
note the distance of the new
location from
the original default location.

<Editor lang="css">
<code>
<panel lang="html">
<div id="div1">
  Static
</div>
<div id="div2">
  Relative, but not moved
</div>
<div id="div3">
  Relative & moved
</div>
</panel>
<panel lang="css">
div {
  border: solid 1px lightgray;
  width: 210px;
  padding: 20px;
}
#div1 {
  position: static; /* Default */
}
#div2 {
  position: relative;
}
#div3 {
  position: relative;
  left: 100px;
  top: 100px;
}
</panel>
</code>
</Editor>

In the above example, **div3**'s original position
is directly below **div2**.
But by setting the `position` value to **relative**
and using `left` and `top` values,
we have pushed it from the left and top by **100px**
from its original position.

The `top` and `left` properties
wouldn't work if you remove the
`position` property. These properties
don't work with the `static` position
elements. You can check this by removing the
`position` property for **div3**. Also, try
setting `top`,`right`, `bottom` and `left` properties
to **div2** to see what happens.
