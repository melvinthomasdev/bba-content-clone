While `justify-content` allows
us to change the placement
and
spacing of the items in one direction,
we would also want to align
the items in the other direction.

For example, with `column`
direction, the items stretch to the
full width of the container.
**Stretching** is the default behaviour
and
this can be changed
using the `align-items` property:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h3>Flex Start</h3>
<div class="container flex-start">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<h3>Flex End</h3>
<div class="container flex-end">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<h3>Center</h3>
<div class="container center">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<h3>Baseline</h3>
<div class="container baseline">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<h3>Stretch</h3>
<div class="container stretch">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
  padding: 10px;
  background-color: beige;
  min-height: 150px;
}
.container > div {
  background-color: orange;
  padding: 20px;
  margin: 5px;
}
.container > div:nth-child(2) {
  font-size: 2em;
}
.flex-start {
  align-items: flex-start;
}
.flex-end {
  align-items: flex-end;
}
.center {
  align-items: center;
}
.baseline {
  align-items: baseline;
}
.stretch {
  align-items: stretch; /* Default */
}
</panel>
</code>
</codeblock>

This is what each of the values does:

`flex-start` 
Items are aligned at the beginning of the container.

`flex-end` 
Items are aligned at the end of the container.

`center` 
Items are aligned in the center.

`baseline` 
Items are aligned such that the bottom of all elements are in a line.

`stretch` 
Items are stretched full width in case of the `column` direction, and full height in case of the `row` direction.

Here's what this property does
when the flex direction
is set to `column`:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h3>Flex Start</h3>
<div class="container flex-start">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<h3>Flex End</h3>
<div class="container flex-end">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<h3>Center</h3>
<div class="container center">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<h3>Baseline</h3>
<div class="container baseline">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<h3>Stretch</h3>
<div class="container stretch">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
  flex-direction: column;
  padding: 10px;
  background-color: beige;
}
.container > div {
  background-color: orange;
  padding: 20px;
  margin: 5px;
}
.container > div:nth-child(2) {
  font-size: 2em;
}
.flex-start {
  align-items: flex-start;
}
.flex-end {
  align-items: flex-end;
}
.center {
  align-items: center;
}
.baseline {
  align-items: baseline;
}
.stretch {
  align-items: stretch; /* Default */
}
</panel>
</code>
</codeblock>

Try changing the direction to
`column-reverse` and see what happens.