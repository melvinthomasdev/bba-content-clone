Create a line in the given code by
completing the following steps:
- Begin a path by using `beginPath()`.
- Move the start to x-coordinate, 200, and y-coordinate, 20, using `moveTo()`.
- Create a line till x-coordinate, 60, and y-coordinate, 75, using `lineTo()`.
- Use the `stroke()` method to make the line visible on the canvas.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
  const newCanvas = document.getElementById('new-canvas');
  const newContext = newCanvas.getContext('2d');
  newContext.fillStyle = 'peachpuff';
  newContext.fillRect(0, 0, 300, 300);
  // Write your code below this line

</panel>
</code>

<solution>
  const newCanvas = document.getElementById('new-canvas');
  const newContext = newCanvas.getContext('2d');
  newContext.fillStyle = 'peachpuff';
  newContext.fillRect(0, 0, 300, 300);
  // Write your code below this line

  newContext.beginPath();
  newContext.moveTo(200, 20);
  newContext.lineTo(60, 75);
  newContext.stroke();
</solution>
</codeblock>