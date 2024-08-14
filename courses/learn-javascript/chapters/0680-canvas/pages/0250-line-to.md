Once we have told the canvas where
to start drawing from, we can then
start drawing our design. For creating a
line, we need to use the `lineTo` method.

```javascript
  canvasContext.lineTo();
```

The `lineTo` method takes two parameters.
The `x-coordinate`, and the `y-coordinate` of
the point till where we want to draw the
line beginning from our initial point
specified by the `moveTo()` method.

In the example given below, play around
by changing the arguments in
the `lineTo()` method.

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