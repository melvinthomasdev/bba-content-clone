The x-axis offset determines the **horizontal**
position of the shadow, and the y-axis offset
determines its **vertical** position.

We can use both positive and negative values.
Let's look at some examples:

<codeblock language="css" type="lesson">
<code>
<panel language="html"  hidden="true">
<div id="container">
  <div class="box right-downward-shadow">
    <p>x-offset: 10px<br>y-offset: 10px</p>
  </div>
  <div class="box right-upward-shadow">
    <p>x-offset: 10px<br>y-offset: -10px</p>
  </div>
  <div class="box left-downward-shadow">
    <p>x-offset: -10px<br>y-offset: 10px</p>
  </div>
  <div class="box left-upward-shadow">
    <p>x-offset: -10px<br>y-offset: -10px</p>
  </div>
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

.right-downward-shadow {
  box-shadow: 10px 10px;
}

.right-upward-shadow {
  box-shadow: 10px -10px;
}

.left-downward-shadow {
  box-shadow: -10px 10px;
}

.left-upward-shadow {
  box-shadow: -10px -10px;
}
</panel>

</panel>
</code>
</codeblock>

A positive value offset creates a shadow to the
right along the x-axis and downward along the y-axis.
A negative value offset creates a shadow to the
left along the x-axis and upward along the y-axis.
