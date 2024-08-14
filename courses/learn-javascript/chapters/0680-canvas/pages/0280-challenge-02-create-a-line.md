Create a line in the given code.
It should start at `x-coordinate`, **25**,
and `y-coordinate`, **25**. It should end
at `x-coordinate`, **100**, `y-coordinate`, **50**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const freshCanvas = document.getElementById('new-canvas');
const freshContext = freshCanvas.getContext('2d');
freshContext.fillStyle = 'peachpuff';
freshContext.fillRect(0, 0, 300, 300);
// Write your code below this line

</panel>
</code>

<solution>
const freshCanvas = document.getElementById('new-canvas');
const freshContext = freshCanvas.getContext('2d');
freshContext.fillStyle = 'peachpuff';
freshContext.fillRect(0, 0, 300, 300);
// Write your code below this line

freshContext.beginPath();
freshContext.moveTo(25, 25);
freshContext.lineTo(100, 50);
freshContext.stroke();
</solution>
</codeblock>