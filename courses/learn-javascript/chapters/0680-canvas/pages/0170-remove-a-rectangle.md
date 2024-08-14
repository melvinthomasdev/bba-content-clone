We can remove a rectangular space
from the canvas using `clearRect()`.
This space will then become transparent.

Take a look at this example:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const canvas = document.getElementById('new-canvas');
const canvasContext = canvas.getContext('2d');
canvasContext.fillStyle = 'firebrick';
canvasContext.fillRect(0, 0, canvas.width, canvas.height);

canvasContext.clearRect(20,20,50,50);
</panel>
</code>
</codeblock>
