Grid track is the space between two adjacent grid lines, i.e. grid's columns or
rows. The grid track between the first and second rows of grid lines is seen
here.

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div class="item1">1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
</div>
</panel>
<panel language="css">
.container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 100px 100px;
}
.item1 {
  grid-column: 1 / -1;
}
.container > div:nth-child(1) {
  background-color: #5bc292;
}
.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  color: #00000;
  border: 1px solid red;
}
</panel>
</code>
</codeblock>
