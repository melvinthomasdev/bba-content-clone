**align-content** property aligns the grid items along the column or Y-axis.

Let's look at some examples for `align-content` property with all possible
values `start`, `end`, `center`, `space-around`, `space-between` and
`space-evenly`.

**align-content: start** aligns the grid with the start edge of the grid
container.

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
<panel language="css" hidden=true>
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px;
  grid-gap: 5px;
  justify-content: center;
  align-content: start;
  height: 110vh;
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
  color: #00000;
}
</panel>
</code>
</codeblock>

**align-content: end** aligns the grid with the end edge of the grid container.

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
<panel language="css" hidden=true>
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px;
  grid-gap: 5px;
  align-content: end;
  justify-content: center;
  height: 110vh;
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
  color: #00000;
}
</panel>
</code>
</codeblock>

**align-content: center** aligns the grid to the center of the grid container.

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
<panel language="css" hidden=true>
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px;
  grid-gap: 5px;
  align-content: center;
  justify-content: center;
  height: 110vh;
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
  color: #00000;
}
</panel>
</code>
</codeblock>

**align-content: space-around** places equal amount of space between each grid
item and half-sized spaces on the ends.

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
<panel language="css" hidden=true>
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px;
  grid-gap: 5px;
  align-content: space-around;
  justify-content: center;
  height: 110vh;
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
  color: #00000;
}
</panel>
</code>
</codeblock>

**align-content: space-between** places equal amount of space between each grid
item, with no space at the ends.

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
<panel language="css" hidden=true>
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px;
  grid-gap: 5px;
  align-content: space-between;
  justify-content: center;
  height: 110vh;
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
  color: #00000;
}
</panel>
</code>
</codeblock>

**align-content: space-evenly** places equal amount of space between the grid
items, including the ends.

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
<panel language="css" hidden=true>
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px;
  grid-gap: 5px;
  align-content: space-evenly;
  justify-content: center;
  height: 110vh;
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
  color: #00000;
}
</panel>
</code>
</codeblock>
