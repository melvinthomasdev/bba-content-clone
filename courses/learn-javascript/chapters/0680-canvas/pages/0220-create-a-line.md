Creating a simple line
on the canvas is not straightforward.
For this, we need to run a few
functions. Take a look:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
  const canvas = document.getElementById('new-canvas');
  const canvasContext = canvas.getContext('2d');

  canvasContext.beginPath();
  canvasContext.moveTo(0,0);
  canvasContext.lineTo(250,50);
  canvasContext.stroke();
</panel>
</code>
</codeblock>