We have tried to create a
shape using the code given below.
But it is missing the final touch.
Close the shape using `closePath()`.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="300px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
  const newCanvas = document.getElementById('new-canvas');
  const newContext = newCanvas.getContext('2d');

  newContext.beginPath();
  newContext.moveTo(30, 40);
  newContext.lineTo(200, 60);
  newContext.lineTo(250, 180);
  newContext.lineTo(80, 250);
  // Write your code below this line

  // Write your code above this line
  newContext.stroke();
</panel>
</code>

<solution>
  const newCanvas = document.getElementById('new-canvas');
  const newContext = newCanvas.getContext('2d');

  newContext.beginPath();
  newContext.moveTo(30, 40);
  newContext.lineTo(200, 60);
  newContext.lineTo(250, 180);
  newContext.lineTo(80, 250);

  // Write your code below this line
  newContext.closePath();
  // Write your code above this line

  newContext.stroke();
</solution>
</codeblock>