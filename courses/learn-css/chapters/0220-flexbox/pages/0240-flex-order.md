By default, flex items are
displayed in the same order
they appear in the HTML code.

We can change the order using
the `order` property for the
flex item, without even
changing the HTML.

The value can be any number.
The default is **0**.
Higher the number,
later the element appears in the layout:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <div id="one">1<br>(Order: 2)</div>
  <div id="two">2<br>(Order: 1)</div>
  <div>3<br>(Order: 0)</div>
  <div>4<br>(Order: 0)</div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
  flex-wrap: wrap;
}
.container > div {
  background-color: orange;
  padding: 30px;
  margin: 5px;
  text-align: center;
}
#one {
  order: 2;
}
#two {
  order: 1;
}
</panel>
</code>
</codeblock>

Since the default order is **0**,
the blocks numbered 3 and 4
appear first. The `#one` block
has the highest order **2**,
hence it appears at the last.

Negative numbers can also
be used as the `order` value:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <div>1<br>(Order: 0)</div>
  <div>2<br>(Order: 0)</div>
  <div id="three">3<br>(Order: -1)</div>
  <div>4<br>(Order: 0)</div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
  flex-wrap: wrap;
}
.container > div {
  background-color: orange;
  padding: 30px;
  margin: 5px;
  text-align: center;
}
#three {
  order: -1;
}
</panel>
</code>
</codeblock>

The lower the value, the
earlier the element appears.
