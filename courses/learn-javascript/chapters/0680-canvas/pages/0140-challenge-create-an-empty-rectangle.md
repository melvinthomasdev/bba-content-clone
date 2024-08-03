Create an empty rectangle with the following
details:
- X-coordinate: 0
- Y-coordinate: 0
- Width: 120
- Height: 30

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
    const freshCanvas = document.getElementById('new-canvas');
    const newContext = freshCanvas.getContext('2d');
    // Write your code below this line
</panel>
</code>

<solution>
    const freshCanvas = document.getElementById('new-canvas');
    const newContext = freshCanvas.getContext('2d');
    // Write your code below this line
    newContext.strokeRect(0, 0, 120, 30);
</solution>
</codeblock>