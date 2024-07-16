With `position: sticky`,
an HTML element starts off in its
regular position that has been
defined in the code,
just like other elements.

However, when you scroll down,
it will stick to a specific
spot on the screen.

Try to scroll inside the window,
in the example provided below:
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

As you can see in the above example,
we have added `position:sticky`
to the orange `div`.

When we scroll down, it keeps moving
up like any other normal element.

But after a while, it stops moving up
and
behaves like an element fixed in its
position until we scroll back up.
