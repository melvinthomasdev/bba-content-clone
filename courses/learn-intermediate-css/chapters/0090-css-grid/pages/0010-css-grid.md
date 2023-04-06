CSS **Grid** allows us to control the layout of a page by dividing it into rows
and columns. This makes designing complex and large responsive layouts, simple
and easy.

Let's look at an example:

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
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: 100px auto 100px;
  grid-template-rows: 50px 100px;
  grid-gap: 3px;
}
/*Additional CSS for styling*/
.container > div:nth-child(1n) {
  background-color: #5bc292;
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

In the above example we applied `display: grid` property to the `container`, and
used `grid-template-columns` and `grid-template-rows` to define the number and
size of the items in the rows and columns.

Lets see how changing the value of `grid-template-columns` and
`grid-template-rows`, we can change the whole layout of the page by controlling
rows and columns.

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
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: 100px auto;
  grid-template-rows: 50px 100px 200px;
  grid-gap: 3px;
}
/*Additional CSS for styling*/
.container > div:nth-child(1n) {
  background-color: #5bc292;
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
