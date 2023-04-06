The `grid-column` property sets the width of the column of a grid item and
`grid-row` sets the height of the row of a grid item.

```css
.item1 {
  grid-column: 1 / 3;
  grid-row: 1 / 3;
}
```

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div class="item1">1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
  <div>6</div>
</div>
</panel>
<panel language="css">
.container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-auto-rows: 100px;
}
.item1 {
  grid-column: 1 / 3;
  grid-row: 1 / 3;
  background-color: #f26561;
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
