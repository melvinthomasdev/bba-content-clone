By default, all the HTML elements appear
on the web page one after another in the same
order as specified in the HTML
markup. We can change this
with the help of the CSS `position` property.

Look at the example given below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="relative">
  Relative
</div>
<div id="absolute">
  Absolute
</div>
<div id="fixed">
  Fixed
</div>
<div id="sticky">
  Sticky
</div>
</panel>
<panel language="css">
body {
  height: 150vh;
}
div {
  background-color: orange;
  width: 100px;
  height: 50px;
  text-align: center;
  line-height: 50px;
  border: 3px solid darkorange;
}
#relative {
  position: relative;
  left: 50px;
  top: 50px;
}
#absolute {
  position: absolute;
  right: 0px;
  top: 0px;
}
#fixed {
  position: fixed;
  right: 0px;
  top: 50px;
}
#sticky {
  position: sticky;
  margin-top: 50px;
  top: 50px;
}
</panel>
</code>
</codeblock>


In the example given above,
scroll inside the result
to see what happens.

Also, remove the position
value for any `div`
to see how its location
in the result changes.