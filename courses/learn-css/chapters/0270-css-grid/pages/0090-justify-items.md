**justify-items** property gets applied to all the grid items inside the
container along the row or X-axis.

Let's look at some examples for `justify-items` property with all possible
values `start`, `end`, `center` and `stretch`.

**justify-items: start** aligns the grid items with the start edge of its own
cell.

<image>justify-item-start-1.png</image>

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
  align-content: center;
  justify-items: start;
  height: 100vh;
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

**justify-items: end** aligns the grid items with the end edge of its own cell.

<image>justify-item-end-1.png</image>

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
  align-content: center;
  justify-items: end;
  height: 100vh;
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

**justify-items: center** aligns the grid items to the center of its own cell.

<image>justify-item-center-1.png</image>

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
  align-content: center;
  justify-items: center;
  height: 100vh;
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

**justify-items: stretch** occupies the whole width of the
cell. `stretch` is justify-item's default value.

<image>justify-item-stretch-1.png</image>

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
  align-content: center;
  justify-items: stretch;
  height: 100vh;
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
