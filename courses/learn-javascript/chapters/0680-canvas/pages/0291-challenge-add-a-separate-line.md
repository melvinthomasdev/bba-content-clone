Create two lines in the given code.

First line should start at `x-coordinate`, 10,
and `y-coordinate`, 15. It should end
at `x-coordinate`, 9, `y-coordinate`, 67.

Second line should start at `x-coordinate`, 15,
and `y-coordinate`, 20. It should end
at `x-coordinate`, 135, `y-coordinate`, 67.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const freshCanvas = document.getElementById('new-canvas');
const newContext = freshCanvas.getContext('2d');
newContext.fillStyle = 'peachpuff';
newContext.fillRect(0, 0, freshCanvas.width, freshCanvas.height);
// Write your code below this line

</panel>
</code>

<solution>
const freshCanvas = document.getElementById('new-canvas');
const newContext = freshCanvas.getContext('2d');
newContext.fillStyle = 'peachpuff';
newContext.fillRect(0, 0, freshCanvas.width, freshCanvas.height);
// Write your code below this line

newContext.beginPath();
newContext.moveTo(10, 15);
newContext.lineTo(9, 67);
newContext.moveTo(15, 20);
newContext.lineTo(135, 67);
newContext.stroke();
</solution>
</codeblock>