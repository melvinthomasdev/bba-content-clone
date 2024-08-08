`clearRect()` will make the space
transparent. So, if the background does
not have a colour of its own, you wouldn't
see the effects of `clearRect`.

Here's an example:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
  const canvas = document.getElementById('new-canvas');
  const canvasContext = canvas.getContext('2d');

  canvasContext.clearRect(25,25,70,60);
</panel>
</code>
</codeblock>

This is why, for now, ensure that you
have a rectangular space from which
you remove smaller rectangular spaces.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
  const canvas = document.getElementById('new-canvas');
  const canvasContext = canvas.getContext('2d');
  canvasContext.fillRect(10, 10, 300, 125);

  canvasContext.clearRect(25,25,70,60);
</panel>
</code>
</codeblock>

Later, we'll see more uses for
`clearRect()`.