Add the following custom-data-attribute
to the HTML elements:

| HTML element | custom-data-attribute   | value |
| ------------ | ----------------------- | ----- |
| `h1`         | `order-number`          | 1     |
| `p`          | `item-code`             | 5     |

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<h1 id="order-number">Order No: 1</h1>
<p id="order-item">Cappuccino</p>
</code>
<solution>
<h1 id="order-number" data-order-number="1">Order No: 1</h1>
<p id="order-item" data-item-code="5">Cappuccino</p>
</solution>
</codeblock>
