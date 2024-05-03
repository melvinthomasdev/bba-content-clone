**grid-column** is the shorthand for **grid-column-start** and
**grid-column-end**. The `grid-column` property sets the width of an individual
grid item.

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div class="item1">1</div>
  <div class="item2">2</div>
  <div class="item3">3</div>
  <div class="item4">4</div>
  <div>5</div>
  <div class="item6">6</div>
</div>
</panel>
<panel language="css">
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px 100px;
  grid-auto-rows: 100px;
  grid-gap: 5px;
  justify-content: center;
  align-content: start;
  height: 100vh;
}
.item1 {
  grid-column: auto auto;
}
.item2 {
  grid-column: 1 / 4;
}
.item3 {
  grid-column: span 2;
}
.item4 {
  grid-column: 1 / span 3;
}
.item6 {
  grid-column: 1 / -1;
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

Let's understand how `grid-column` property works by looking at the above
example.

**Item 1 :**

`grid-column: auto auto`: The grid item's column start and column end are
automatically set.(**Default**)

**Item 2 :**

`grid-column: 1 / 4`: The grid item starts before the first column and ends just
before the fourth one.

**Item 3 :**

`grid-column: span 2`: The grid item spans 2 columns.

**Item 4 :**

`grid-column: 1 / span 2`: The grid item starts before the first column and
spans for 2 columns.

**Item 6 :**

`grid-column: 1 / -1` The grid item starts before the first column and ends just
before the last column.
