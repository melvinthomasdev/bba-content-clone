Give the `div` element a `clear`
property with the value `right`
to move the box below the link:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<a id="next" href="#">
    Next →
  </a>
<div>
  <h2>Lotus</h2>
  <p>
    Lotus is one of two extant species of aquatic plant in the family Nelumbonaceae. It is often colloquially called a water lily. Lotus plants are adapted to grow in the flood plains of slow-moving rivers and delta areas.
  </p>
</div>
</panel>
<panel language="css">
#next {
  float: right;
}
div {
  border: solid 1px lightgray;
  background-color: lavender;
  padding: 20px;
}
</panel>
</code>

<solution>
#next {
  float: right;
}
div {
  border: solid 1px lightgray;
  background-color: lavender;
  padding: 20px;
  clear: right;
}
</solution>
</codeblock>
