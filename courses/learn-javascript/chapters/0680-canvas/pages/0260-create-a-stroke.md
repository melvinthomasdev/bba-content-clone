In the example given below, even though we
have begun a path with `beginPath()`, told the
canvas where to start drawing from using `moveTo(0, 0)`,
and finally ensured that we are creating a line
using `lineTo(50, 50)`, there is still no line
visible on the canvas. The final step is to
tell the canvas whether to add a background colour
to the shape we created by using `fill()`
or to add a border
by using `stroke()`.

Since we intend to create a line,
we need to use `stroke()`. Take a look:

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
canvasContext.lineTo(250, 50);
canvasContext.stroke();
</panel>
</code>
</codeblock>