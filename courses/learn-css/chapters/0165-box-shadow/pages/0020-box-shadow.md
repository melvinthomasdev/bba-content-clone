The `box-shadow` property in CSS is used to
create a shadow effect around an element.
To create a box-shadow, we need to provide
at least two values **offset-x** and **offset-y**.

```css
box-shadow: offset-x offset-y;
```

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="container">
  <div class="box"></div>
</div>
</panel>
<panel language="css">
#container {
  display: flex;
  justify-content: space-around;
  flex-direction: row;
  background-color: peachpuff;
  height: 95vh;
}

.box {
  height: 300px;
  width: 300px;
  margin: 20px;
  background-color: coral;

  box-shadow: 20px 20px;
}
</panel>
</code>
</codeblock>

In the above example, we have applied a
`box-shadow` with an offset of **20px**
for both the x-axis and y-axis.
