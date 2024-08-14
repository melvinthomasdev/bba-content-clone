Create a **2d** context for the
canvas and save it as **newContext**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const freshCanvas = document.getElementById('new-canvas');

// Write your code below this line



// Wite your code above this line

newContext.beginPath();
newContext.arc(90, 50, 45, 0, 2 * Math.PI);
newContext.fillStyle = 'cadetblue';
newContext.fill();
newContext.closePath();
</panel>
</code>

<solution>
const freshCanvas = document.getElementById('new-canvas');

// Write your code below this line

const newContext = freshCanvas.getContext('2d');

// Wite your code above this line

newContext.beginPath();
newContext.arc(200, 200, 50, 0, 2 * Math.PI);
newContext.fillStyle = 'cadetblue';
newContext.fill();
newContext.closePath();
</solution>
</codeblock>