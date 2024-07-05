Use the HTML `canvas` element 
to add a container on the 
webpage where we can draw 
stuff.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<canvas id="new-canvas"></canvas>
</panel>
<panel language="css">
#new-canvas {
   width: 500px;
   height: 150px;
   border: 5px solid #2d2d2d;
}
</panel>
<panel language="javascript">
const canvas = document.getElementById('new-canvas');
const canvasContext = canvas.getContext('2d');
canvasContext.fillStyle = 'hotpink';
canvasContext.fillRect(60, 25, 100, 100);
</panel>
</code>
</codeblock>

For now, don't worry about the 
JavaScript code. It will become 
clearer as we move forward.