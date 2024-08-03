Create empty rectangles on the canvas.

For the `x-coordinate`, `y-coordinate`, `width`
and `height` values, use the provided array. Each
array value corresponds to a different rectangle
and provides all the four values needed to create
the rectangle in that order.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
  const mainCanvas = document.getElementById('new-canvas');
  const mainContext = mainCanvas.getContext('2d');
  const rectangleList = [[0, 0, 15, 15], [25, 0, 15, 25], [60, 0, 5, 10], [50, 50, 50, 50], [50, 0, 50, 50], [60, 60, 100, 20], [90, 30, 50, 50],[100, 0, 15, 15],[120, 0, 15, 15],[140, 0, 15, 15],[160, 0, 15, 15],[180, 0, 15, 15],[200, 0, 15, 15],[220, 0, 15, 15],[240, 0, 15, 15],[260, 0, 15, 15],[280, 0, 15, 15]];
  // Write your code below this line
</panel>
</code>

<solution>
  const mainCanvas = document.getElementById('new-canvas');
  const mainContext = mainCanvas.getContext('2d');
  const rectangleList = [[0, 0, 15, 15], [25, 0, 15, 25], [60, 0, 5, 10], [50, 50, 50, 50], [50, 0, 50, 50], [60, 60, 100, 20], [90, 30, 50, 50],[100, 0, 15, 15],[120, 0, 15, 15],[140, 0, 15, 15],[160, 0, 15, 15],[180, 0, 15, 15],[200, 0, 15, 15],[220, 0, 15, 15],[240, 0, 15, 15],[260, 0, 15, 15],[280, 0, 15, 15]];
  // Write your code below this line

  rectangleList.forEach(rectangleValue => {
    mainContext.strokeRect(rectangleValue[0], rectangleValue[1], rectangleValue[2], rectangleValue[3]);
  });

</solution>
</codeblock>
