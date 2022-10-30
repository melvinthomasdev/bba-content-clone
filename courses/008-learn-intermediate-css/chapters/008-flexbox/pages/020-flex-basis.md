With `flex-grow` and `flex-shrink`,
we saw that we can control
by how much each flex
item grows or shrinks.

With the `flex-basis` property,
we can set the initial size of
the item. It's possible to set
this with the `width` property too,
but `flex-basis` is a better way
to do the same, for flex items.
The default value is `auto`.
Values can be specified in
relative or absolute units:

<Editor lang="css">
<code>
<panel lang="html">
<div class="container">
  <div id="one">
  </div>
  <div id="two">
  </div>
  <div id="three">
  </div>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
}
.container > div {
  padding: 30px;
  margin: 10px;
  background-color: orange;
}
#one {
  flex-basis: 50px;
}
#two {
  flex-basis: 50%;
}
#three {
  flex-basis: 50%;
}
</panel>
</code>
</Editor>

Resize the output panel
and
notice that the first div's
width stays fixed at **50px**,
while the other two divs
occupy **50%** of the
remaining space.
