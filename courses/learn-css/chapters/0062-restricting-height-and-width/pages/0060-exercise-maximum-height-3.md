Add a maximum height of `120px` to the `.overflow-prevent` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <p class="overflow-prevent">
    Discover the perfect blend of fashion and comfort at our shoes store. From trendy sneakers to elegant heels, we offer a wide selection to suit every style and occasion. Step up your footwear game and walk confidently with our premium collection.Whether you're looking for the latest trends or timeless classics, our expert staff is here to assist you in finding the perfect pair. Elevate your footwear game and put your best foot forward with us!"
  </p>
</div>
</panel>
<panel language="css">
.container {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f0f0f0;
}
.overflow-prevent {
  overflow: hidden;
}
</panel>
</code>

<solution>
.container {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f0f0f0;
}
.overflow-prevent {
  max-height: 120px;
  overflow: hidden;
}
</solution>
</codeblock>
