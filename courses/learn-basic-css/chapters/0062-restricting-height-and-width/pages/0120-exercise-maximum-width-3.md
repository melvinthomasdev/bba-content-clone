Set a maximum width of `800px` for the `.container` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <h1>Welcome to Our Shoes Center</h1>
  <p>Discover the perfect blend of fashion and comfort at our shoes store. From trendy sneakers to elegant heels, we offer a wide selection to suit every style and occasion. Step up your footwear game and walk confidently with our premium collection.</p>
</div>
</panel>
<panel language="css">
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
  display: flex;
  align-items: center;
  height: 100vh;
}
.container {
  margin: 0 auto;
  padding: 20px;
  background-color: white;
}
h1 {
  font-size: 2em;
  color: #4CAF50;
}
p {
  font-size: 1.2em;
  line-height: 1.6;
}
</panel>
</code>

<solution>
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
  display: flex;
  align-items: center;
  height: 100vh;
}
.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  background-color: white;
}
h1 {
  font-size: 2em;
  color: #4CAF50;
}
p {
  font-size: 1.2em;
  line-height: 1.6;
}
</solution>
</codeblock>
