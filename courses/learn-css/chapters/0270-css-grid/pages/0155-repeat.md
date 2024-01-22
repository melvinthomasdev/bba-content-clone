The `repeat()` CSS function makes writing `grid-template-columns` and
`grid-template-rows` properties concise and easier, when creating a large amount
of columns or rows.

**Examples:**

`grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr;` could be written as
`grid-template-columns: repeat( 6, 1fr );`

`grid-template-columns: 1fr 2fr 1fr 2fr 1fr 2fr;` could be written as
`grid-template-columns: repeat(3, 1fr 2fr);`

**Repeat()** can be used with **minmax()** for example
`grid-template-columns: repeat(3, minmax(200px, 1fr))` will create 3 columns
with minimum of `200px` or maximum of `1fr` width.

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
  <div>6</div>
  <div>7</div>
  <div>8</div>
</div>
</panel>
<panel language="css">
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: repeat(3, minmax(200px,1fr));
  grid-template-rows: 100px 100px 100px;
  grid-gap: 5px;
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
