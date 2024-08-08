We don't just have to stick
to a black rectangle every time we
use `fillRect()`. The colour inside
a rectangle depends on the colour
of the context. So, if we change
the `fillStyle` property of the context of
the canvas, the colour inside the
rectangle will change too.

Take a look at this example:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
    const canvas = document.getElementById('new-canvas');
    const canvasContext = canvas.getContext('2d');
    canvasContext.fillStyle = 'crimson';
    canvasContext.fillRect(10, 10, 380, 80);
</panel>
</code>
</codeblock>

As you can see, this time
we don't get a black rectangle. Instead,
we have a **crimson** rectangle. The colour
comes from the `fillStyle`
property of our context. Change the
colour inside `fillStyle` to a colour of
your choice.