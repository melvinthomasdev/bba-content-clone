When you want only one
flex item to be aligned
differently from the rest,
you can use the `align-self` property.

But, unlike the previous properties
that were applied to the container,
this property has to be applied
directly to that particular child element:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div class="last">4</div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
  height: 200px;
}
.container > div {
  padding: 20px;
  margin: 5px;
  background-color: orange;
}
.last {
  align-self: end;
}
</panel>
</code>
</codeblock>