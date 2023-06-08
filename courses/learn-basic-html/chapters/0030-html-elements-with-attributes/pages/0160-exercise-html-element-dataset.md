Add following custom-data-attribute
to the HTML `div` element:
`order-number = 1`

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<div id="order-data">
  <h1 id="order-number">Order No: 1</h1>
  <p id="order-item">Cappuccino</p>
</div>
</code>
<solution>
<div id="order-data" data-order-number="1">
  <h1 id="order-number">Order No: 1</h1>
  <p id="order-item">Cappuccino</p>
</div>
</solution>
</codeblock>
