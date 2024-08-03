We can create a black rectangle
on a canvas using `fillRect()`.

Take a look at this example:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
  <canvas id="new-canvas" width="400px" height="100px" style="border: 3px solid midnightblue;"></canvas>
</panel>
<panel language="javascript">
  const canvas = document.getElementById('new-canvas');
  const canvasContext = canvas.getContext('2d');

  canvasContext.fillRect(10, 10, 300, 50);
</panel>
</code>
</codeblock>

As you can see, we provide
four arguments to the `fillRect()` method.
These are the values for the
`x-coordinate`, `y-coordinate`, `width`
and `height` respectively for the
rectangle.

So, in the above example,
the rectangle's upper-left corner is
at **10** on the x-axis, the rectangle's
upper-left corner is at **10** on the y-axis,
the width of the rectangle is **300px** and
the length of the rectangle is **50px**.