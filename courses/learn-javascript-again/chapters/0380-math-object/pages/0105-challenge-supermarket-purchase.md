We have the cost of 3 items purchased
from the supermarket.

We have the following tasks:

- Find the total cost of the 3 items and log it to the console.
- Find the average cost of the 3 items and log it to the console.
- Find the rounded average cost and log it to the console.
- Find the rounded down total cost and log it to the console.

```js
Outcome:
`Total cost of the items is: 236.64.`
`The average cost of the items is: 78.88.`
`Rounded average cost to the nearest whole number: 79.`
`Rounded-down total cost to the nearest whole number: 236.`
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const itemOnePrice = 81.21;
const itemTwoPrice = 72.31;
const itemThreePrice = 83.12;

// Write code below this line

</code>

<solution>
const itemOnePrice = 81.21;
const itemTwoPrice = 72.31;
const itemThreePrice = 83.12;

// Write code below this line

// Calculate the total cost
const totalCost = itemOnePrice + itemTwoPrice + itemThreePrice;

// Calculate the average cost
const averageCost = (totalCost) / 3;

// Round the average cost to the nearest whole number using Math.round
let roundedAverage = Math.round(averageCost);

// Round down the total cost to the nearest whole number using Math.floor
let roundedDownTotalCost = Math.floor(totalCost);

console.log("Total cost of the items is: " + totalCost);
console.log("The average cost of the items is: " + averageCost);
console.log("Rounded average cost to the nearest whole number: " + roundedAverage);
console.log("Rounded-down total cost to the nearest whole number: " + roundedDownTotalCost);

</solution>
</codeblock>
