Create two lines in the given code.

First line should start at `x-coordinate`, 0,
and `y-coordinate`, 0. It should end
at `x-coordinate`, 120, `y-coordinate`, 155.

Second line should start where first line
ends. The second line should end at
`x-coordinate`, 50, `y-coordinate`, 155.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="200px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const newCanvas = document.getElementById('new-canvas');
const newContext = newCanvas.getContext('2d');
newContext.fillStyle = 'peachpuff';
newContext.fillRect(0, 0, newCanvas.width, newCanvas.height);
// Write your code below this line

</panel>
</code>

<solution>
const newCanvas = document.getElementById('new-canvas');
const newContext = newCanvas.getContext('2d');
newContext.fillStyle = 'peachpuff';
newContext.fillRect(0, 0, newCanvas.width, newCanvas.height);
// Write your code below this line

newContext.beginPath();
newContext.moveTo(0, 0);
newContext.lineTo(120, 155);
newContext.lineTo(50, 155);
newContext.stroke();
</solution>
</codeblock>