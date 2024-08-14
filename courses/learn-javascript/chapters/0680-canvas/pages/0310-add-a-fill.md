In a shape, we can add
a `fill()` instead of a `stroke()`.
This would add a black background colour
to the shape. Take a look:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const canvas = document.getElementById('new-canvas');
const canvasContext = canvas.getContext('2d');

canvasContext.beginPath();

canvasContext.moveTo(0, 0);
canvasContext.lineTo(400, 15);
canvasContext.lineTo(300, 90);
canvasContext.lineTo(250, 55);
canvasContext.lineTo(100, 95);

canvasContext.fill();
</panel>
</code>
</codeblock>

It doesn't even matter
if we have a closed shape. The
`fill()` method will try to
close the shape for you and
then fill it. Take a look at
a shape, once created with
`stroke()` and then with `fill()`.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const canvas = document.getElementById('new-canvas');
const canvasContext = canvas.getContext('2d');

canvasContext.beginPath();
canvasContext.moveTo(250, 10);
canvasContext.lineTo(330, 15);
canvasContext.lineTo(320, 90);
canvasContext.fill();

canvasContext.beginPath();
canvasContext.moveTo(50, 10);
canvasContext.lineTo(130, 15);
canvasContext.lineTo(120, 90);
canvasContext.stroke();
</panel>
</code>
</codeblock>

The shapes are the same.
You can see that even though
the shape isn't closed, `fill()`
works out for us.