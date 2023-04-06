A **grid container** is created by setting display property to `grid`, a grid
container consists of rows and columns. There are some common terms that are
good to know while working with grid, like **Grid Cell**, **Grid Lines** and
**Grid Tracks**.

**Grid Container:**

<image>grid.png</image>

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
</div>
</panel>
<panel language="css">
.container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 100px 100px;
  width: 50%;
  border: 2px solid red;
}
.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  color: #00000;
  border: 0.5px solid black;
}
</panel>
</code>
</codeblock>
