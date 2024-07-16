In the code below apply the
`grid-template-columns` property
to the element with the class **pricing-table**,
setting its value to `1fr 1fr 1fr`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="pricing-table">
  <div class="plan basic">
    <h2>Basic Plan</h2>
    <p>For getting started</p>
    <p class="price">$19.99/month</p>
    <button>Choose this plan</button>
  </div>
  <div class="plan standard">
    <h2>Standard Plan</h2>
    <p>For growing businesses</p>
    <p class="price">$39.99/month</p>
    <button>Choose this plan</button>
  </div>
  <div class="plan premium">
    <h2>Premium Plan</h2>
    <p>Advanced features included</p>
    <p class="price">$59.99/month</p>
    <button>Choose this plan</button>
  </div>
</div>
</panel>
<panel language="css">
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f4f4f4;
}

.pricing-table {
  display: grid;
  gap: 20px;
  max-width: 1200px;
  margin: 20px auto;
  padding: 20px;
}

.plan {
  border-radius: 8px;
  padding: 20px;
  text-align: center;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  transition: transform 0.3s ease-in-out;
}

.plan h2,
.plan p,
.plan .price {
  color: #fff;
}

.plan .price {
  font-size: 24px;
  margin: 15px 0;
}

.plan button {
  background-color: #3498db;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

.plan:hover {
  transform: scale(1.05);
}

.basic {
  background-color: #3478dc;
}

.standard {
  background-color: #e74c3c;
}

.premium {
  background-color: #2ecc71;
}

.plan button:hover {
  background-color: #2c3e50;
}

</panel>
</code>
<solution>
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f4f4f4;
}

.pricing-table {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 20px;
  max-width: 1200px;
  margin: 20px auto;
  padding: 20px;
}

.plan {
  border-radius: 8px;
  padding: 20px;
  text-align: center;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  justify-content: space-between; /* Align items vertically within the plan */
  transition: transform 0.3s ease-in-out;
}

.plan h2,
.plan p,
.plan .price {
  color: #fff;
}

.plan .price {
  font-size: 24px;
  margin: 15px 0;
}

.plan button {
  background-color: #3498db;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

.plan:hover {
  transform: scale(1.05);
}

.basic {
  background-color: #3478dc;
}

.standard {
  background-color: #e74c3c;
}

.premium {
  background-color: #2ecc71;
}

.plan button:hover {
  background-color: #2c3e50;
}

</solution>
</codeblock>
