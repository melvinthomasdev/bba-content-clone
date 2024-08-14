Create a filled rectangle with the following
details:

- X-coordinate: 50
- Y-coordinate: 50
- Width: 75
- Height: 75

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const newCanvas = document.getElementById('new-canvas');
const newCanvasContext = newCanvas.getContext('2d');
// Write your code below this line
</panel>
</code>

<solution>
const newCanvas = document.getElementById('new-canvas');
const newCanvasContext = newCanvas.getContext('2d');
// Write your code below this line
newCanvasContext.fillRect(50, 50, 75, 75);
</solution>
</codeblock>