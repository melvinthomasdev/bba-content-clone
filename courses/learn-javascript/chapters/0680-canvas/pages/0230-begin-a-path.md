The first thing that we need to
do when we are creating a line or
a custom shape is to tell the canvas
that we are beginning a path.

```javascript
  canvasContext.beginPath();
```

In the example given below, comment
out the `beginPath()` method and see
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