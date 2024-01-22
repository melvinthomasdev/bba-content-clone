**grid-row** is the shorthand for **grid-row-start** and **grid-row-end**. The
`grid-row` property sets the height of an individual grid item.

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div class="item1">1</div>
  <div class="item2">2</div>
  <div class="item3">3</div>
  <div class="item4">4</div>
  <div>5</div>
  <div>6</div>
  <div>7</div>
  <div>8</div>
  <div>9</div>
</div>
</panel>
<panel language="css" hidden=true>
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
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px 100px;
  grid-gap: 5px;
  justify-content: center;
  align-content: start;
  height: 100vh;
}
.item1 {
  grid-row: auto auto;
}
.item2 {
  grid-row: 1 / 4;
}
.item3 {
  grid-row: span 2;
}
.item4 {
  grid-row: 1 / span 2;
}
</panel>
</code>
</codeblock>

Let's understand how `grid-row` property works by looking at the above example.

**Item 1 :**

`grid-row: auto auto`: The grid item's row start and row end are automatically
set.(**Default**)

**Item 2 :**

`grid-row: 1 / 4`: The grid item starts before the first row and ends just
before the fourth one.

**Item 3 :**

`grid-row: span 2`: The grid item spans 2 rows.

**Item 4 :**

`grid-row: 1 / span 2`: The grid item starts before the first row and spans for
2 rows.
