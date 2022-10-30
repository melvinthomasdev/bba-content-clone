Make the link with the id **next**, appear to
the far right by using
the `float` property:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div>
  <h2>Lotus</h2>
  <p>
    Lotus is one of two extant species of aquatic plant in the family Nelumbonaceae. It is often colloquially called a water lily. Lotus plants are adapted to grow in the flood plains of slow-moving rivers and delta areas.
  </p>

  <a id="prev" href="#">
    ← Prev
  </a>

  <a id="next" href="#">
    Next →
  </a>

</div>
</panel>
<panel lang="css">
div {
  background-color: beige;
  padding: 10px 25px 25px;
}
</panel>
</code>

<solution>
div {
  background-color: beige;
  padding: 10px 25px 25px;
}
#next {
  float: right;
}
</solution>
</Editor>