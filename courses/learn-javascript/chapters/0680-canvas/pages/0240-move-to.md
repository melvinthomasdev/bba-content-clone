Once we have started a path,
we then need to tell the canvas
where to start drawing from. We
use the `moveTo()` method for this:

```javascript
  canvasContext.moveTo();
```

The `moveTo()` method takes two parameters.
The `x-coordinate`, and the `y-coordinate` of
the point from where we want to start drawing
the shape.

In the example given below, comment
out the `moveTo()` method and see
what happens.

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