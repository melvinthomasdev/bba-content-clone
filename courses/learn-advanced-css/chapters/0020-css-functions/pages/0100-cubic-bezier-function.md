Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="box">Hover Me</div>
</panel>
<panel language="css">
.box {
  width: 150px;
  height: 50px;
  background-color: #e74c3c;
  color: white;
  text-align: center;
  line-height: 50px;
  cursor: pointer;
  transition-property: width;
  transition-duration: 2s;
}

.box:hover {
  width: 300px;
}
</panel>
</code>
</codeblock>

By default, CSS transitions use an
ease timing function, which starts
slowly, speeds up in the middle,
and slows down again at the end.

But you might want more control and
flexibility over the animation timing,
which is where cubic Bezier comes in.

The `cubic-bezier` function defines a
cubic Bezier curve. This curve influences
the rate of change of a CSS property over time.

```
cubic-bezier(P1x, P1y, P2x, P2y)
```

The function takes in four parameters
which represent the x and y coordinates
on a graph.

- Lower `P1x` and `P1y` values result in a slower and smoother start.
- Higher `P1x` and `P1y` values create a faster and more abrupt start.
- Lower `P2x` and `P2y` values make the animation end more slowly and smoothly.
- Higher `P2x` and `P2y` values make the animation end more quickly and abruptly.
