The `conic-gradient()` CSS function
is used to generate circular gradients.
It can be applied as a value to the
`background`, `background-image`, and
`background-color` properties.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="conic first"></div>
<div class="conic second"></div>
</panel>
<panel language="css">
body {
  display: flex;
  justify-content: space-around;
}
.conic {
  width: 200px;
  height: 200px;
  border-radius: 50%;
}
.first {
  background: conic-gradient(
    red,
    yellow,
    green,
    blue,
    purple
  );
}
.second {
  background: conic-gradient(
    red,
    yellow,
    green,
    blue,
    red
  );
}
</panel>
</code>
</codeblock>

As you can see, in the `first` circle,
we used the colours `red`, `yellow`,
`green`, `blue` and `purple` as parameters.
In the `second` example, we repeated
the initial colour at the end for a
smoother transition around the circle.

Let's look at another example:

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
specified at different
positions around the circle by
using percentages, ensuring that
there is no mixing or overlapping
of colours.

We can change the starting angles
of a conic gradient by specifying
the desired position in degrees.

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
    from 45deg,
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

In the above example, the
starting angle is set at 45 degrees.
We can adjust the starting angle to
achieve desired orientation.
