For all the `div` elements, give the `float` property,
the value **left**. This should make the two blocks appear
next to each other. Also, give a right
margin of **20px** to the `div` elements:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div>
  <h2>Lotus</h2>
  <p>
    Lotus is one of two extant species of aquatic plant in the family Nelumbonaceae. It is often colloquially called a water lily. Lotus plants are adapted to grow in the flood plains of slow-moving rivers and delta areas.
  </p>
</div>
<div>
  <h2>Rose</h2>
  <p>
    A rose is a woody perennial flowering plant of the genus Rosa, in the family Rosaceae, or the flower it bears. There are over three hundred species and tens of thousands of cultivars.
  </p>
</div>
</panel>
<panel lang="css">
div {
  width: 200px;
  padding: 15px;
  background-color: #d1f3e6;
}
</panel>
</code>

<solution>
div {
  width: 200px;
  padding: 15px;
  background-color: #d1f3e6;
  float: left;
  margin-right: 20px;
}
</solution>
</Editor>