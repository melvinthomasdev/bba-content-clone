Assign the following minimum heights to the respective classes:

1. Set a minimum height of `80px` for the `.header`.
2. Set a minimum height of `200px` to the `.content`.
3. Set a minimum height of `50px` to the `.footer` element.


<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="header">
    <h1>Welcome to Our Shoes Center</h1>
  </div>
  <div class="content">
    <p>Discover the perfect blend of fashion and comfort at our shoes store. From trendy sneakers to elegant heels, we offer a wide selection to suit every style and occasion. Step up your footwear game and walk confidently with our premium collection.</p>
  </div>
  <div class="footer">
    <p>Contact us: info@example.com</p>
  </div>
</div>
</panel>
<panel language="css">
.container {
  width: 80%;
  max-width: 800px;
  margin: 0 auto;
  background-color: #f0f0f0;
  padding: 20px;
}
h1,p {
  margin: 0;
}
.header {
  background-color: #4CAF50;
  color: #fff;
  text-align: center;
  padding: 10px;
}
.content {
  padding: 10px;
}
.footer {
  background-color: #333;
  color: #fff;
  text-align: center;
  padding: 10px;
}
</panel>
</code>

<solution>
.container {
  width: 80%;
  max-width: 800px;
  margin: 0 auto;
  background-color: #f0f0f0;
  padding: 20px;
}
h1,p {
  margin: 0;
}
.header {
  min-height: 80px;
  background-color: #4CAF50;
  color: #fff;
  text-align: center;
  padding: 10px;
}
.content {
  min-height: 200px;
  padding: 10px;
}
.footer {
  min-height: 50px;
  background-color: #333;
  color: #fff;
  text-align: center;
  padding: 10px;
}
</solution>
</codeblock>
