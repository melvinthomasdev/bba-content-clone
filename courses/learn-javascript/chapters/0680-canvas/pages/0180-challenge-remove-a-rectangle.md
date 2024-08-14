Remove a rectangular space from the following canvas.
The `x-coordinate` for this space will be **200**,
the `y-coordinate` for this space will be **50**,
the `width` for this space will be **150** and
the `height` for this space will be **35**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const newCanvas = document.getElementById('new-canvas');
const newCanvasContext = newCanvas.getContext('2d');
newCanvasContext.fillStyle = "olivedrab";
newCanvasContext.fillRect(0, 0, newCanvas.width, newCanvas.height);
// Write your code below this line
</panel>
</code>

<solution>
const newCanvas = document.getElementById('new-canvas');
const newCanvasContext = newCanvas.getContext('2d');
newCanvasContext.fillStyle = "olivedrab";
newCanvasContext.fillRect(0, 0, newCanvas.width, newCanvas.height);
// Write your code below this line
newCanvasContext.clearRect(200, 50, 150, 35);
</solution>
</codeblock>