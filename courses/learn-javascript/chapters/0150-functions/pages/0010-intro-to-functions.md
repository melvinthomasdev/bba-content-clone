A function is a set of instructions
that can be executed multiple times.

This may sound similar to a loop but
functions are used for a totally
different purpose.

Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const apples = {
  price: 5,
  quantity: 3,
};

const bananas = {
  price: 4,
  quantity: 2,
};

const milk = {
  price: 8,
  quantity: 1,
};

const totalCost =
  apples.price * apples.quantity +
  bananas.price * bananas.quantity +
  milk.price * milk.quantity;

const result = `Total Cost: ${totalCost}`;
console.log(result);
</code>
</codeblock>

In the above code, we are calculating the
cost of each item by multiplying their
respective prices with their quantities.
This process is repeated for each
item individually.

<codeblock language="javascript" type="lesson">
<code>
const apples = {
  price: 5,
  quantity: 3
};

const bananas = {
  price: 4,
  quantity: 2
};

const milk = {
  price: 8,
  quantity: 1
};

function calculateItemCost(item) {
  return item.price * item.quantity;
}

const totalCost =
  calculateItemCost(apples) +
  calculateItemCost(bananas) +
  calculateItemCost(milk);

const result = `Total Cost: ${totalCost}`;
console.log(result);
</code>
</codeblock>

In the above code, we moved the calculation
logic to the `calculateItemCost` function.
Therefore, there is no need to repeat the
same code for each item.
This makes the code more organized
and maintainable.