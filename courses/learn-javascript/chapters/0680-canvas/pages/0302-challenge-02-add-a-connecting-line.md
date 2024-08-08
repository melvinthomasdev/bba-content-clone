Create three connecting lines
in the given code.

Line 1
- Starting point: `x-coordinate`, 30, `y-coordinate`, 60
- End point: `x-coordinate`, 180, `y-coordinate`, 90

Line 2
- End point: `x-coordinate`, 120, `y-coordinate`, 200

Line 3
- End point: `x-coordinate`, 220, `y-coordinate`, 200

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="300px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
  const newCanvas = document.getElementById('new-canvas');
  const newContext = newCanvas.getContext('2d');
  newContext.fillStyle = 'peachpuff';
  newContext.fillRect(0, 0, newCanvas.width, newCanvas.height);
  // Write your code below this line

</panel>
</code>

<solution>
  const newCanvas = document.getElementById('new-canvas');
  const newContext = newCanvas.getContext('2d');
  newContext.fillStyle = 'peachpuff';
  newContext.fillRect(0, 0, newCanvas.width, newCanvas.height);
  // Write your code below this line

  newContext.beginPath();

  newContext.moveTo(30, 60);
  newContext.lineTo(180, 90);
  newContext.lineTo(120, 200);
  newContext.lineTo(220, 200);

  newContext.stroke();
</solution>
</codeblock>