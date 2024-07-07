For doing anything on the `canvas`, 
we need to get its **context**.

Take a look at this example:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
    // Select the canvas
    const canvas = document.getElementById('new-canvas');
    // Get the context for this canvas
    const canvasContext = canvas.getContext('2d');

    canvasContext.fillStyle = 'dodgerblue';
    canvasContext.fillRect(10, 10, 380, 80);
</panel>
</code>
</codeblock>

Here, we use the `getContext()` method to 
get a context to draw stuff on it. It can 
create 2-dimensional or 3-dimensional 
drawing spaces for us. For our purposes, 
we'll limit to creating 2-dimensional 
contexts. For this, remember to provide 
**2d** as an argument to the `getContext` method.
