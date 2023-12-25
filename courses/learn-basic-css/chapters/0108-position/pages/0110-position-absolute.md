When you set an element's `position` to
**absolute**, you can use the `top`, `right`,
`bottom` and `left` properties to change
the its position inside its parent element:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="static">
  Static
</div>
<div id="relative">
  Relative
</div>
<div id="absolute">
  Absolute
</div>
</panel>
<panel language="css">
body {
  background-color: steelblue;
}
div {
  border: 2px solid white;
  padding: 20px;
  width: 200px;
  color: white;
  font-size: 1.2rem;
}
#relative {
  position: relative;
  top: 20px;
  right: 20px;
}
#absolute {
  position: absolute;
  top: 20px;
  right: 20px;
}
</panel>
</code>
</codeblock>

In the above example, the parent element is the `body` itself. So notice how the element is placed `20px` away from the top right corner of `body`. Try changing the values of `top` and `right` to see what happens. Also add `left` and `bottom` properties too to see what happens.

At the same time, notice the placement of the **relative** element when the same two values of `top` and `right` are applied to it. A relative element's location is changed with respect to its original location, while an absolute element's location is changed with respect to its parent element.

Let's look at another example:

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
  width: 200px;
  height: 100px;
  background-color: teal;
  position: relative;
}
#absolute {
  background-color: orange;
  width: 50px;
  height: 50px;
  position: absolute;
  right: 10px;
  bottom: 0px;
}
</panel>
</code>
</codeblock>

In the above example, the **child** `div`
is positioned `absolute`. Its location
is changed using the `right` and
`bottom` properties. The interesting part
is that the changes in the **child** `div` element's
position are now in relation to the **parent**
`div` element and not `body`.
