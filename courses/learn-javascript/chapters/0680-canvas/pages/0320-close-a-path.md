The `closePath()` method creates a
line from the current point to the
start of the path. Take a look:

<codeblock language="javascript" type="lesson">
<code>

<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
const canvas = document.getElementById('new-canvas');
const canvasContext = canvas.getContext('2d');

canvasContext.beginPath();

canvasContext.moveTo(10, 10);
canvasContext.lineTo(180, 10);
canvasContext.lineTo(380, 90);

canvasContext.closePath();
canvasContext.stroke();
</panel>
</code>
</codeblock>

Here, we start the path and move
the originating point to **(10, 10)**
using `moveTo()`. Then, we add a line
till **(180, 10)** using `lineTo()`. We
add a second line using `lineTo()` till
**(380, 90)**. After this, when we close the
path using `closePath()`, it draws a
line from the current point, which is
**(380, 90)**, to the starting point for
the path which was **(10, 10)**.
