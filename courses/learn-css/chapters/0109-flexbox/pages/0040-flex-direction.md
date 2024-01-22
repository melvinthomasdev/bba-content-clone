By default, the elements within
a flex container are stacked
next to each other in a
single **row**. The stacking happens
left to right. We can change this
with the `flex-direction` property
on the container element.

You can use these values - `row`,
`row-reverse`, `column`
and
`column-reverse` for the
`flex-direction` property:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h3>Flex Direction: Row</h3>
<div class="container row">
  <div class="inner-div">1</div>
  <div class="inner-div">2</div>
  <div class="inner-div">3</div>
</div>
<h3>Flex Direction: Row Reverse</h3>
<div class="container row-rev">
  <div class="inner-div">1</div>
  <div class="inner-div">2</div>
  <div class="inner-div">3</div>
</div>
<h3>Flex Direction: Column</h3>
<div class="container col">
  <div class="inner-div">1</div>
  <div class="inner-div">2</div>
  <div class="inner-div">3</div>
</div>
<h3>Flex Direction: Column Reverse</h3>
<div class="container col-rev">
  <div class="inner-div">1</div>
  <div class="inner-div">2</div>
  <div class="inner-div">3</div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
  padding: 10px;
  background-color: beige;
}
.container > div {
  background-color: orange;
  padding: 10px;
  margin: 5px;
}
.row {
  flex-direction: row;
}
.row-rev {
  flex-direction: row-reverse;
}
.col {
  flex-direction: column;
  min-height:200px;
}
.col-rev {
  flex-direction: column-reverse;
  min-height:200px;
}
</panel>
</code>
</codeblock>