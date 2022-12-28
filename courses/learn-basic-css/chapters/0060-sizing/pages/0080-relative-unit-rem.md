When length is specified using `rem`,
it is calculated based on the *font size* of the
**root** element of the page,
which is the `html` element:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="first">
</div>
<div id="second">
</div>
</panel>
<panel language="css">
html {
  font-size: 10px;
}
#first {
  width: 10rem;
  height: 10rem;
  background-color: beige;
  font-size: 1em;
}
#second {
  width: 10rem;
  height: 10rem;
  background-color: orange;
  font-size: 24px;
}
</panel>
</code>
</codeblock>

In the example given above,
the width and height
of both the divs depend on the
`font-size` of the `html` element.
The sizes are not linked to
the font-sizes of the respective
elements.

The width of the div is calculated as:

```
10rem = 10*font-size-of-html = 10*10px = 100px
```