​
Define `displayOrder` to display
the `name` and `price` of `foodItem`,
along with it's flavor.
The `foodItem` will be bound to
`displayOrder` using the `bind` method.
`displayOrder` should accept
one argument - the `flavor`.

Call the bound function `displayIceCreamOrder`
and
pass `"Chocolate"` as the argument.

Considering the `foodItem` in the code below
and
for the flavor `"Chocolate"`,
the bound function should be
**"Your order of Chocolate Ice Cream for Rs. 50 is placed."**
​
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const foodItem = {
  name: "Ice Cream",
  price: 50,
};

function displayOrder(flavor) {
}

const displayIceCreamOrder = displayOrder.bind(foodItem);
displayIceCreamOrder();
</code>

<solution>
const foodItem = {
  name: "Ice Cream",
  price: 50,
};

function displayOrder(flavor) {
  console.log(`Your order of ${flavor} ${this.name} for Rs. ${this.price} is placed.`);
}

const displayIceCreamOrder = displayOrder.bind(foodItem);
displayIceCreamOrder("Chocolate");
</solution>
</codeblock>
​
