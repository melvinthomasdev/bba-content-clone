**justify-self** property can be applied to an individual grid item and aligns
the grid item along the row or X-axis within a cell.

Let's look at an example for `justify-self` property with all possible values
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
  justify-self: start;
}
.end {
  justify-self: end;
}
.center {
  justify-self: center;
}
.stretch {
  justify-self: stretch;
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

In the above example we have applied `justify-self: start` on Item 1,
`justify-self: end` on Item 2, `justify-self: center` on Item 4 and
`justify-self: stretch` on Item 5.

<image>justify-self-1.png</image>
