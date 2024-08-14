In the example given below, we add a
second line in the same
canvas, after we added our first line.

The second line starts from where
the first line ended. This makes
it look like
we are creating a shape.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const canvas = document.getElementById('new-canvas');
const canvasContext = canvas.getContext('2d');

canvasContext.beginPath();

canvasContext.moveTo(20, 20);
canvasContext.lineTo(200, 50);
canvasContext.lineTo(325, 10);

canvasContext.stroke();
</panel>
</code>
</codeblock>

To achieve this, notice that we
added a new line using the `lineTo()`
method right after we added the `lineTo()`
method for the first line. Since we
did not move the starting point for
the new line, it started from the
end for the last line. This way,
we can add more and more lines and even create
a closed shape.

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
canvasContext.lineTo(100, 50);
canvasContext.lineTo(300, 90);
canvasContext.lineTo(150, 5);
canvasContext.lineTo(10, 5);

canvasContext.stroke();
</panel>
</code>
</codeblock>