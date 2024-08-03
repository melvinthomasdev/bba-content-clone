Remove two rectangular spaces
from the canvas.

The first one should have the following
details:
- X-coordinate: 5
- Y-coordinate: 25
- Width: 40
- Height: 40

The second one should have the following
details:
- X-coordinate: 50
- Y-coordinate: 50
- Width: 30
- Height: 30

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
  const freshCanvas = document.getElementById('new-canvas');
  const newContext = freshCanvas.getContext('2d');
  newContext.fillStyle = 'peru';
  newContext.fillRect(0, 0, 300, 300);
  // Write your code below this line
</panel>
</code>

<solution>
  const freshCanvas = document.getElementById('new-canvas');
  const newContext = freshCanvas.getContext('2d');
  newContext.fillStyle = 'peru';
  newContext.fillRect(0, 0, 300, 300);
  // Write your code below this line
  newContext.clearRect(5, 25, 40, 40);
  newContext.clearRect(50, 50, 30, 30);
</solution>
</codeblock>