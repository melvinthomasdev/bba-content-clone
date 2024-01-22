When length is specified using `vh`,
it is calculated based on the window height,
also known as viewport height.

`1vh` is `1%` of the window height.
So, `100vh` is equivalent to the window height.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  Occupies 100% height of the window.
</div>
</panel>
<panel language="css">
div {
  height: 100vh;
  background-color: beige;
}
</panel>
</code>
</codeblock>

Viewport is the visible part of a screen.
In the example given above, the viewport is
the rectangular window given below the
code editor and the `div` covers it completely
with a height of `100vh`.