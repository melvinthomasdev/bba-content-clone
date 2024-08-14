In the code given below, we have
created multiple closed shapes.
Give them all a black background colour.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="300px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const newCanvas = document.getElementById('new-canvas');
const newContext = newCanvas.getContext('2d');

newContext.beginPath();
newContext.moveTo(30, 30);
newContext.lineTo(120, 30);
newContext.lineTo(75, 100);
newContext.lineTo(30, 30);
newContext.stroke();

newContext.beginPath();
newContext.moveTo(180, 30);
newContext.lineTo(230, 30);
newContext.lineTo(260, 80);
newContext.lineTo(205, 130);
newContext.lineTo(155, 80);
newContext.lineTo(180, 30);
newContext.stroke();

newContext.beginPath();
newContext.moveTo(30, 200);
newContext.lineTo(90, 200);
newContext.lineTo(120, 240);
newContext.lineTo(90, 280);
newContext.lineTo(30, 280);
newContext.lineTo(0, 240);
newContext.lineTo(30, 200);
newContext.stroke();

newContext.beginPath();
newContext.moveTo(150, 200);
newContext.lineTo(250, 200);
newContext.lineTo(270, 250);
newContext.lineTo(180, 250);
newContext.lineTo(150, 200);
newContext.stroke();

</panel>
</code>

<solution>
const newCanvas = document.getElementById('new-canvas');
const newContext = newCanvas.getContext('2d');

newContext.beginPath();
newContext.moveTo(30, 30);
newContext.lineTo(120, 30);
newContext.lineTo(75, 100);
newContext.lineTo(30, 30);
newContext.stroke();
newContext.fill();

newContext.beginPath();
newContext.moveTo(180, 30);
newContext.lineTo(230, 30);
newContext.lineTo(260, 80);
newContext.lineTo(205, 130);
newContext.lineTo(155, 80);
newContext.lineTo(180, 30);
newContext.stroke();
newContext.fill();

newContext.beginPath();
newContext.moveTo(30, 200);
newContext.lineTo(90, 200);
newContext.lineTo(120, 240);
newContext.lineTo(90, 280);
newContext.lineTo(30, 280);
newContext.lineTo(0, 240);
newContext.lineTo(30, 200);
newContext.stroke();
newContext.fill();

newContext.beginPath();
newContext.moveTo(150, 200);
newContext.lineTo(250, 200);
newContext.lineTo(270, 250);
newContext.lineTo(180, 250);
newContext.lineTo(150, 200);
newContext.stroke();
newContext.fill();
</solution>
</codeblock>