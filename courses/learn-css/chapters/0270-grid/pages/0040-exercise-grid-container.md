Add `display: grid` to the
**product-grid** class so that it becomes
a grid container.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h1 class="heading">Shopping Cart</h1>
<div class="product-grid">
  <div class="product-item">
    <h2>Bread</h2>
    <p>$2</p>
  </div>
  <div class="product-item">
    <h2>Soda</h2>
    <p>$1.5</p>
  </div>
  <div id="eggs" class="product-item">
    <h2>Eggs</h2>
    <p>$3</p>
  </div>
  <div class="product-item">
    <h2>Detergent</h2>
    <p>$5</p>
  </div>
  <div class="product-item">
    <h2>Toothbrush</h2>
    <p>$1</p>
  </div>
  <div class="product-item">
    <h2>Garbage bags</h2>
    <p>$1</p>
  </div>
  <div>
    <button>Checkout</button>
  </div>
</div>
</panel>
<panel language="css">
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f5f5f5;
  color: #333;
}

.heading {
  text-align: center;
}

#eggs {
  background-color: red;
}
.product-grid {
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: auto;
  gap: 20px;
  width: 80%;
  margin: 20px auto;
}

.product-item {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 8px;
  text-align: center;
  background-color: green;
  color: white;
}

button {
  margin-left: 50px;
  background-color: blue;
  color: white;
  padding: 10px;
}
</panel>
</code>
<solution>
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f5f5f5;
  color: #333;
}

.heading {
  text-align: center;
}

#eggs {
  background-color: red;
}

.product-grid {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: auto;
  gap: 20px;
  width: 80%;
  margin: 20px auto;
}

.product-item {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 8px;
  text-align: center;
  background-color: green;
  color: white;
}

button {
  margin-left: 50px;
  background-color: blue;
  color: white;
  padding: 10px;
}
</solution>
</codeblock>
