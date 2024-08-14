Create two filled rectangles in the canvas.
The first one should have the following
details:
- X-coordinate: 10
- Y-coordinate: 50
- Width: 100
- Height: 100

The second one should have the following
details:
- X-coordinate: 5
- Y-coordinate: 5
- Width: 25
- Height: 25

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const freshCanvas = document.getElementById('new-canvas');
const newContext = freshCanvas.getContext('2d');
newContext.fillStyle = 'darkseagreen';
// Write your code below this line

</panel>
</code>

<solution>
const freshCanvas = document.getElementById('new-canvas');
const newContext = freshCanvas.getContext('2d');
newContext.fillStyle = 'darkseagreen';
// Write your code below this line

newContext.fillRect(10, 50, 100, 100);
newContext.fillRect(5, 5, 25, 25);
</solution>
</codeblock>