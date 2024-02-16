We can add a colour value to the **box-shadow**
property.
Specifying a colour is optional. If we do not
provide a colour, the box-shadow will be
**black** by default.

```css
box-shadow: offset-x offset-y color;
```

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="container">
  <div class="box pink-shadow"></div>
  <div class="box orange-shadow"></div>
  <div class="box gray-shadow"></div>
  <div class="box blue-shadow"></div>
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
  height: 220px;
  width: 220px;
  margin: 20px;
  font-size: 18px;
  background-color: coral;
}

.pink-shadow {
  box-shadow: 10px 10px pink;
}

.orange-shadow {
  box-shadow: 10px 10px orange;
}

.gray-shadow {
  box-shadow: -10px 10px rgba(0, 0, 0, 0.5);
}

.blue-shadow {
  box-shadow: -10px -10px rgba(50, 50, 90, 0.25);
}
</panel>
</code>
</codeblock>
