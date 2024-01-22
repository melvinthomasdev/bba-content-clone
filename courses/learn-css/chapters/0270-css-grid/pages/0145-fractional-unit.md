**fr** is a **fractional unit** and `1fr` means 1 part of the available space.

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
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-auto-rows: 100px;
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

Let's change the **grid-template-columns** to `1fr 1fr 1fr`, we could see the
same space is now divided into 3 columns.

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
  grid-template-columns: 1fr 1fr 1fr;
  grid-auto-rows: 100px;
  grid-gap: 5px;
}
/*Additional CSS for styling*/
.container > div:nth-child(1n) {
  background-color: #92d2b4;
}
.container > div:nth-child(3n) {
  background-color: #7ecfa7;
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

Similarly if we change the **grid-template-columns** to `1fr 1fr`, the same
space gets divided into 2 columns.

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
  grid-template-columns: 1fr 1fr;
  grid-auto-rows: 100px;
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
