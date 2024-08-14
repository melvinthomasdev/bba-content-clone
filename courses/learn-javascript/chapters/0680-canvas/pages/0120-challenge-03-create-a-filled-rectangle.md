Create filled rectangles on the canvas.

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
const mainCanvas = document.getElementById('new-canvas');
const mainContext = mainCanvas.getContext('2d');
mainContext.fillStyle = 'seagreen';
const rectangleList = [[10, 0, 50, 50], [75, 0, 75, 75], [160, 0, 75, 75], [250, 50, 50, 50], [350, 0, 50, 50]];
// Write your code below this line
</panel>
</code>

<solution>
const mainCanvas = document.getElementById('new-canvas');
const mainContext = mainCanvas.getContext('2d');
mainContext.fillStyle = 'seagreen';
const rectangleList = [[10, 0, 50, 50], [75, 0, 75, 75], [160, 0, 75, 75], [250, 50, 50, 50], [350, 0, 50, 50]];
// Write your code below this line

rectangleList.forEach(rectangleValue=>{
  mainContext.fillRect(rectangleValue[0], rectangleValue[1], rectangleValue[2], rectangleValue[3]);
});
</solution>
</codeblock>
