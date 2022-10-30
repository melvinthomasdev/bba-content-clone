When the flex items don't wrap,
they try to shrink as much as
possible to fit into the available
space.

Using the `flex-shrink` property,
we can control how much each item shrinks.
The value can be any number.
If the value is **0**,
the item does not shrink.

Higher the value, more the item shrinks:

<Editor lang="css">
<code>
<panel lang="html">
<div class="container">
  <div class="shrink">
  </div>
  <div class="shrink-more">
  </div>
  <div class="shrink">
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
  width: 33%;
  background-color: orange;
}
.shrink {
  flex-shrink: 1;
}
.shrink-more {
  flex-shrink: 5;
}
</panel>
</code>
</Editor>

Resize the output panel to notice
that the center `div` shrinks a
lot more compared to the other
two. Try removing the `flex-shrink`
property to see the default behaviour.

Also, change one of the
`flex-shrink` values to **0**
and see what happens.
