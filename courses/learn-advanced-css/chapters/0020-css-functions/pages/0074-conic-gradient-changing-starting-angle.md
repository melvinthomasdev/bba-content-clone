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
starting angle is set at **45 degrees**
using the `from` keyword.
We can adjust the starting angle to
achieve desired orientation.
