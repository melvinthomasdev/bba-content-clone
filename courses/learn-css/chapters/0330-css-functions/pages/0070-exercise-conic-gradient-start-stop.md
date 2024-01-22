Apply a conic gradient to the background of the `div`.
There should be three sections in the gradient.
30% of the circular background should be **red**
in colour, **yellow** should be 40% and **green**
should be 30%.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="pie-chart"></div>
</panel>
<panel language="css">
.pie-chart {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  /*Write your code here*/
}
</panel>
</code>

<solution>
.pie-chart {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  /*Write your code here*/
  background: conic-gradient(
    red 0 30%,
    yellow 30% 70%,
    green 70% 100%
  );
}
</solution>
</codeblock>
