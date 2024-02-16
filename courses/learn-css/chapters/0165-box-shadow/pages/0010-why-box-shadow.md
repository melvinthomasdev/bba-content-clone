Before we learn about `box-shadow`, let's
see why we need it.

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden="true">
<div class="container">
  <div class="element"></div>
  <div class="element with-shadow"></div>
</div>
</panel>
<panel language="css" hidden="true">
.container {
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  margin: 20px auto;
  width: 90vw;
  border-radius: 5px;
  background-color: peachpuff;
}

.element {
  width: 200px;
  height: 300px;
  margin: 20px;
  background-color: #3498db;
  border-radius: 8px;
}

.with-shadow {
  box-shadow: 10px 15px 8px rgba(0, 0, 0, 0.4);
}
</panel>
</code>
</codeblock>

In the above example, the first card without
any box shadow looks flat and lacks visual depth.
While, the second card appears raised and
more interesting due to the added box shadow.
