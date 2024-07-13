A shopkeeper is offering discounts.
If the total cost is in decimal,
he will consider the base price.

We have the total cost of our
purchases below.

Your task is to find the discounted price
and
log it to the console.

Additionally, round up the total cost to
the nearest whole price.

Log both variations to the console.

```js
Input: totalCost = 82.45
Output:
`Discounted price: 82`
`Rounded up total price: 83`
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const totalCost = 92.32;

// Write code below this line
</code>

<solution>
const totalCost = 92.32;

// Write code below this line

// Calculate the discounted price
const discountedPrice = Math.trunc(totalCost);

// Round up to the nearest whole price
const ceiledPrice = Math.ceil(totalCost);

// Display the results
console.log(`Discounted price: ${discountedPrice}`);
console.log(`Rounded up total price: ${ceiledPrice}`);
</solution>
</codeblock>
