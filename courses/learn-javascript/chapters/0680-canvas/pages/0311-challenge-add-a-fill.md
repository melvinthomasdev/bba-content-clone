In the code given below, we have
created a closed shape using 4
lines. Give it a black background colour.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="300px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const newCanvas = document.getElementById('new-canvas');
const newContext = newCanvas.getContext('2d');

newContext.beginPath();
newContext.moveTo(30, 40);
newContext.lineTo(200, 60);
newContext.lineTo(250, 180);
newContext.lineTo(80, 250);
newContext.lineTo(30, 40);
newContext.stroke();

// Write your code below this line

</panel>
</code>

<solution>
const newCanvas = document.getElementById('new-canvas');
const newContext = newCanvas.getContext('2d');

newContext.beginPath();
newContext.moveTo(30, 40);
newContext.lineTo(200, 60);
newContext.lineTo(250, 180);
newContext.lineTo(80, 250);
newContext.lineTo(30, 40);
newContext.stroke();

// Write your code below this line

newContext.fill();
</solution>
</codeblock>