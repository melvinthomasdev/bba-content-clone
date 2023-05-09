**align-self** property can be applied to an individual grid item and aligns the
grid item along the column or Y-axis within a cell.

Let's look at an example for `align-self` property with all possible values
`start`, `end`, `center` and `stretch`.

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div class="start">1</div>
  <div class="end">2</div>
  <div>3</div>
  <div class="center">4</div>
  <div class="stretch">5</div>
  <div>6</div>
</div>
</panel>
<panel language="css">
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px;
  grid-gap: 5px;
  justify-content: center;
  align-content: center;
  height: 100vh;
}
.start {
  align-self: start;
}
.end {
  align-self: end;
}
.center {
  align-self: center;
}
.stretch {
  align-self: stretch;
}
/*Additional CSS for styling*/
.container > div:nth-child(1n) {
  background-color: #92d2b4;
}
.container > div:nth-child(2n) {
  background-color: #f26561;
}
.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  color: #000000;
}
</panel>
</code>
</codeblock>

In the above example we have applied `align-self: start` on Item 1,
`align-self: end` on Item 2, `align-self: center` on Item 4 and
`align-self: stretch` on Item 5.

<image>align-self-1.png</image>
