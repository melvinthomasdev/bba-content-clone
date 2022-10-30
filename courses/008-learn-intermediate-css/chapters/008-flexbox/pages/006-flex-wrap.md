By default, flexbox tries to fit
all the child elements in a single
row or a single column depending
on the `flex-direction`.

So, if the width of the flex items
exceeds the width of the parent
element, we will see a horizontal scrollbar.

To avoid this, we can choose to
**wrap** the elements pushing
them to the next row / column
using the `flex-wrap` property:

<Editor lang="css">
<code>
<panel lang="html">
<div class="container">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
  flex-wrap: wrap;
}
.container > div {
  background-color: orange;
  padding: 30px 90px;
  margin: 5px;
}
</panel>
</code>
</Editor>

Try removing the `flex-wrap`
property to see the default
behaviour. The default value
is `nowrap`. You can also set
the value as `wrap-reverse`.

Try this out in the above editor
to see how it works.
