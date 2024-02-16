The **blur-radius** value determines the
degree of blurriness in the shadow.
It is an optional property.
If the blur-radius value is not
specified, it defaults to **0**.

```css
box-shadow: offset-x offset-y blur-radius color;
```

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="container">
  <div class="no-blur-shadow box">Without Blur</div>
  <div class="with-blur-shadow box">With a Blur Radius of 10px</div>
  <div class="high-blur-shadow box">With a Blur Radius of 15px</div>
  <div class="low-blur-shadow box">With a Blur Radius of 10px</div>
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
  margin: 20px;
  font-size: 18px;
  background-color: coral;
}

.no-blur-shadow {
  box-shadow: 10px 10px pink;
}

.with-blur-shadow {
  box-shadow: 10px 10px 10px orange;
}

.high-blur-shadow {
  box-shadow: -10px 10px 15px rgba(0, 0, 0, 0.5);
}

.low-blur-shadow {
  box-shadow: -10px -10px 10px rgba(50, 50, 90, 0.25);
}
</panel>
</code>
</codeblock>

In the above example, we added blur radius
with varying values to the elements.
The `.no-blur-shadow` box demonstrates a shadow
without blur, while the `.with-blur-shadow` box
applies a blur radius of 10px.
The `.high-blur-shadow` and `.low-blur-shadow` boxes have
blur radius of 15px and 10px, respectively.
