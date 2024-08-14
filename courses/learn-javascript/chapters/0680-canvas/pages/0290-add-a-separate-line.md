In the example given below, we add a
second line in the same
canvas, after we added our first line.

The second line starts
from a location which is different from
the start and end of the first line. This
creates two different lines on the
canvas.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const canvas = document.getElementById('new-canvas');
const canvasContext = canvas.getContext('2d');

canvasContext.beginPath();

canvasContext.moveTo(200, 10);
canvasContext.lineTo(50, 50);
canvasContext.moveTo(300, 10);
canvasContext.lineTo(310, 90);

canvasContext.stroke();
</panel>
</code>
</codeblock>

To achieve this, notice that we
added a `moveTo()` method after we
created the first line. This moved
the starting location of the next
line to a separate location. Then, we
added a new line using the `lineTo()`
method.