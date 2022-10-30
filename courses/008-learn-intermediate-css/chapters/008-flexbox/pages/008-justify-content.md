By default, we saw that
the flex items are placed at
the beginning of the container
depending on the flex direction,
with least spacing between the
items.

In case of `row-reverse`, the items
begin from right. With `column`,
from the top and with `column-reverse`,
from the bottom.

The `justify-content` property
is used to change this behaviour.
We can use the values `flex-start`,
`flex-end`, `center`,
`space-between`, `space-around`
and
`space-evenly`:

<Editor lang="css">
<code>
<panel lang="html">
<h3>Flex Start - Default</h3>
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
<h3>Space Between</h3>
<div class="container between">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<h3>Space Around</h3>
<div class="container around">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<h3>Space Evenly</h3>
<div class="container evenly">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
  padding: 10px;
  background-color: beige;
}
.container > div {
  background-color: orange;
  padding: 20px;
  margin: 5px;
}
.flex-start {
  justify-content: flex-start;
}
.flex-end {
  justify-content: flex-end;
}
.center {
  justify-content: center;
}
.between {
  justify-content: space-between;
}
.around {
  justify-content: space-around;
}
.evenly {
  justify-content: space-evenly;
}
</panel>
</code>
</Editor>

This is what each of the values does:

`flex-start`<br>
Items are placed at the beginning of the container, which is the default value.

`flex-end`<br>
Items are placed at the end of the container.

`center`<br>
Items are placed in the center.

`space-between`<br>
There is as much space between the items as can be evenly distributed.

`space-around`<br>
The spaces between the items are double the space on both ends of the container.

`space-evenly`<br>
There is equal space between the items and at both the ends.

Try setting the `flex-direction`
as `row-reverse` to the
container and see what happens.

Here's what this property
does when the flex direction
is set to `column`:

<Editor lang="css">
<code>
<panel lang="html">
<h3>Flex Start - Default</h3>
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
<h3>Space Between</h3>
<div class="container between">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<h3>Space Around</h3>
<div class="container around">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<h3>Space Evenly</h3>
<div class="container evenly">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
  flex-direction: column;
  min-height: 300px;
  padding: 10px;
  background-color: beige;
}
.container > div {
  background-color: orange;
  padding: 20px;
  margin: 5px;
}
.flex-start {
  justify-content: flex-start;
}
.flex-end {
  justify-content: flex-end;
}
.center {
  justify-content: center;
}
.between {
  justify-content: space-between;
}
.around {
  justify-content: space-around;
}
.evenly {
  justify-content: space-evenly;
}
</panel>
</code>
</Editor>

Note that `justify-content`
takes effect only when the
items do not occupy all the
available space on the
container. That's why we
have set a `min-height`
for the container. Otherwise,
for `column` direction,
the container height is the
same as that of the items,
and
you won't see this property
making any difference.

Also, try changing the direction
to `column-reverse`
and
see what happens.