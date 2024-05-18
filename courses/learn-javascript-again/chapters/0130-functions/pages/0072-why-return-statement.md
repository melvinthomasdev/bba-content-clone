Let's look at an example:

<codeblock language="javascript" type="lesson">
<code>
const applesPrice = 10;
const applesQuantity = 3;

const bananasPrice = 5;
const bananasQuantity = 5;

const milkPrice = 20;
const milkQuantity = 1;


function calculateItemCost (price, quantity) {
  const total = price * quantity;
  return total;
}

const totalCost =
  calculateItemCost(applesPrice, applesQuantity) +
  calculateItemCost(bananasPrice, bananasQuantity) +
  calculateItemCost(milkPrice, milkQuantity);


console.log(`Total Cost of grocery is $${totalCost}`);
</code>
</codeblock>

In the above example,
by using **return**, we can reuse the result
of the function **calculateItemCost**
to calculate the cost of each item.
And, then use the final cost by adding them up
and storing it in **totalCost**.
Returning values allows us to use the
same logic in different situations,
making our code more **reusable**.
