Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="pie-chart"></div>
</panel>
<panel language="css">
.pie-chart {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  background: conic-gradient(
    red 0% 25%,
    blue 25% 50%,
    green 50% 75%,
    yellow 75% 100%
  );
  margin: 50px auto;
}
</panel>
</code>
</codeblock>

In this example, the colours are
assigned specific positions around
the circle by the the start and end
percentages. For instance, the colour
`red` spans from 0% to 25%,
corresponding to the first 90 degrees
of the 360-degree circle.
Similarly, `blue` starts at 25% and
extends till 50%, covering the circle
from 90 to 180 degrees, and so on.

This ensures that there is no mixing
or overlapping of colours.
