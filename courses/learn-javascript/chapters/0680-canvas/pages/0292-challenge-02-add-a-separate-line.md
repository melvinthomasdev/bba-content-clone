Create four separate lines in the given code.

Line 1
- Starting point: `x-coordinate`, 20, `y-coordinate`, 30
- End point: `x-coordinate`, 280, `y-coordinate`, 250

Line 2
- Starting point: `x-coordinate`, 50, `y-coordinate`, 250
- End point: `x-coordinate`, 250, `y-coordinate`, 50

Line 3
- Starting point: `x-coordinate`, 100, `y-coordinate`, 0
- End point: `x-coordinate`, 100, `y-coordinate`, 300

Line 4
- Starting point: `x-coordinate`, 0, `y-coordinate`, 150
- End point: `x-coordinate`, 300, `y-coordinate`, 150

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

  newContext.moveTo(20, 30);
  newContext.lineTo(280, 250);

  newContext.moveTo(50, 250);
  newContext.lineTo(250, 50);

  newContext.moveTo(100, 0);
  newContext.lineTo(100, 300);

  newContext.moveTo(0, 150);
  newContext.lineTo(300, 150);

  newContext.stroke();
</solution>
</codeblock>