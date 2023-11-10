Change the starting angle of the pie
chart by moving it ahead by 90 degrees.

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
  background: conic-gradient(
    skyblue 0 30%,
    Coral 30% 70%,
    limegreen 70% 100%
  );
}
</panel>
</code>

<solution>
.pie-chart {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  background: conic-gradient(
    from 90deg,
    skyblue 0 30%,
    Coral 30% 70%,
    limegreen 70% 100%
  );
}
</solution>
</codeblock>
