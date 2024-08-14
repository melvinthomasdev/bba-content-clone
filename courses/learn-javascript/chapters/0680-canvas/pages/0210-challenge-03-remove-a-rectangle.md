Remove rectangular spaces
from the canvas.

For the `x-coordinate`, `y-coordinate`, `width`
and `height` values, use the provided array. Each
array value corresponds to a different rectangle
and provides all the four values needed to create
the rectangle in that order.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const freshCanvas = document.getElementById('new-canvas');
const newContext = freshCanvas.getContext('2d');
newContext.fillStyle = 'tomato';
newContext.fillRect(0, 0, freshCanvas.width, freshCanvas.height);
const rectangleList = [[10, 10, 20, 25], [35, 20, 30, 40], [60, 10, 10, 20], [80, 30, 40, 50], [90, 0, 60, 70], [110, 40, 80, 30], [130, 10, 50, 20], [150, 50, 90, 40], [170, 20, 60, 50], [190, 30, 80, 30], [200, 0, 40, 60], [50, 70, 100, 20], [70, 30, 70, 80], [90, 40, 60, 90], [110, 20, 50, 70], [130, 30, 30, 40]];
// Write your code below this line
</panel>
</code>

<solution>
const freshCanvas = document.getElementById('new-canvas');
const newContext = freshCanvas.getContext('2d');
newContext.fillStyle = 'tomato';
newContext.fillRect(0, 0, freshCanvas.width, freshCanvas.height);
const rectangleList = [[10, 10, 20, 25], [35, 20, 30, 40], [60, 10, 10, 20], [80, 30, 40, 50], [90, 0, 60, 70], [110, 40, 80, 30], [130, 10, 50, 20], [150, 50, 90, 40], [170, 20, 60, 50], [190, 30, 80, 30], [200, 0, 40, 60], [50, 70, 100, 20], [70, 30, 70, 80], [90, 40, 60, 90], [110, 20, 50, 70], [130, 30, 30, 40]];
// Write your code below this line

rectangleList.forEach(rectangleValue=>{
  newContext.clearRect(rectangleValue[0], rectangleValue[1], rectangleValue[2], rectangleValue[3]);
});

</solution>
</codeblock>
