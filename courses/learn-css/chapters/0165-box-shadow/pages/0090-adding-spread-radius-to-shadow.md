The **spread-radius** is used to adjust the size of
the shadow effect.

```css
box-shadow: offset-x offset-y blur-radius spread-radius color;
```

It accepts both positive and negative values.
A positive value expands the shadow,
while a negative value shrinks it.
It is an optional property, and if not specified,
its value will be **0** by default.


Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="container">
  <div class="box shadow-expand">With Spread Radius of 10px</div>
  <div class="box shadow-enlarge">With Spread Radius of 20px</div>
  <div class="box shadow-shrink">With Spread Radius of -10px</div>
  <div class="box shadow-collapse">With Spread Radius of -20px</div>
</div>
</panel>
<panel language="css">
#container {
  display: flex;
  justify-content: space-around;
  flex-direction: row;
  flex-wrap: wrap;
  background-color: peachpuff;
}

.box {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 220px;
  width: 220px;
  margin: 30px;
  font-size: 18px;
  background-color: coral;
}

.shadow-expand {
  box-shadow: 10px 10px 10px 10px pink;
}

.shadow-enlarge {
  box-shadow: 10px 10px 10px 20px orange;
}

.shadow-shrink {
  box-shadow: -20px 20px 10px -10px rgba(0, 0, 0, 0.5);
}

.shadow-collapse {
  box-shadow: -20px -20px 10px -20px rgba(50, 50, 90, 0.25);
}
</panel>
</code>
</codeblock>

In the above example, we added a distinct
spread radius to each box to control the size
of its shadow effect.
In the `.shadow-expand` box and `.shadow-enlarge` box,
we expand the shadow with values of 10px and 20px,
respectively.
In the `.shadow-shrink` and `.shadow-collapse` boxes, with negative values,
we shrink it by -10px and -20px, respectively.
