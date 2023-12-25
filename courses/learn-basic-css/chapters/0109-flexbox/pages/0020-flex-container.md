When you set the `display`
property of an element to
`flex`, that element
becomes a **flex container**
and
all its immediate child elements
become **flex items**.

Here is an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <div class="pink">
    1
  </div>
  <div class="green">
    2
  </div>
  <div class="orange">
    3
  </div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
}
.pink, .orange, .green {
  padding: 30px;
}
.pink {
  background-color: lightpink;
}
.green {
  background-color: lightgreen;
}
.orange {
  background-color: orange;
}
</panel>
</code>
</codeblock>

Try removing the `display`
property on `.container`
and
you'll see that the child
elements follow the normal
flow of the page.
