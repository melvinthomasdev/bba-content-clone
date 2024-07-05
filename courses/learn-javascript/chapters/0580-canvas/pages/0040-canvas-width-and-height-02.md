It is necessary that we provide 
a width and height to the `canvas` 
element. It is also advised that 
we add these attributes inline directly 
in the HTML and not in a separate CSS 
file.

Here, you can see a canvas element 
with width and height specified in the 
CSS pane.

<codeblock type="lesson" language="javascript">
<code>
<panel language="html">
  <canvas id="new-canvas"></canvas>
</panel>
<panel  language="css">
#new-canvas {
  width: 400px;
  height: 100px;
  border: 3px dashed #2d2d2d;
}
</panel>
<panel language="javascript">
const canvas = document.getElementById('new-canvas');
const canvasContext = canvas.getContext('2d');
canvasContext.fillStyle = 'tomato';
canvasContext.fillRect(50, 50, 200, 150);
</panel>
</code>
</codeblock>

Contrast this with this example, where 
we provide the width and height to our 
canvas element inline in HTML.

<codeblock type="lesson" language="javascript">
<code>
<panel language="html">
<canvas id="new-canvas" width="400px" height="100px" style="border: 3px dashed #2d2d2d;"></canvas>
</panel>
<panel  language="css">
</panel>
<panel  language="javascript">
const canvas = document.getElementById('new-canvas');
const canvasContext = canvas.getContext('2d');
canvasContext.fillStyle = 'tomato';
canvasContext.fillRect(50, 50, 200, 150);
</panel>
</code>
</codeblock>

You can see that the two results are 
different. Without getting in details 
right now, let's choose one path and stick 
with it.

Moving forward, we will always create 
a `canvas` element with inline `width` and 
`height` attributes. We'll later see 
the advantages of this approach.