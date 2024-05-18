Given is an object
`menuItems` where the
keys of the object are
the items available in
the menu of a restaurant,
and values are the cost
per item.

The items in `menuItems`
will be the same
everytime while the cost
per item can be different.

For example:

|Items            | Cost |
| --------------- | ---- |
|Veggie Pizza     | $7   |
|Chicken Pizza    | $10  |
|Chocolate Cookie | $3   |
|Vanilla Shake    | $5   |

Also provided will be
another object `orderedItems`
where the keys are the
items ordered and the values
are the quantity in which
the items are ordered.

`orderedItems` will only
have the items from
`menuItems`.

Write a function `priceCalculator`
that accepts two parameters
`menu` and `order` and logs to
the console the total cost.

For example:
`Total cost of your order is $[total_cost].`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Build Pizza Price Calculator
</code>

<solution>
function priceCalculator(menu, order) {
	const total_veggie_pizza_cost = menu["veggie_pizza"] * order["veggie_pizza"];
	const total_chicken_pizza_cost = menu["chicken_pizza"] * order["chicken_pizza"];
	const total_cookies_cost = menu["chocolate_cookie"] * order["chocolate_cookie"];
	const total_shake_cost = menu["vanilla_shake"] * order["vanilla_shake"];

	const total_order_cost = total_veggie_pizza_cost + total_chicken_pizza_cost + total_cookies_cost + total_shake_cost;

	console.log(`Total cost of your order is ${total_order_cost}`);
};
</solution>
<testcases>
<caller>
priceCalculator(testMenu, testOrder);
</caller>
<testcase>
<i>
const testMenu = {
	"veggie_pizza": 20,
	"chicken_pizza": 24,
	"chocolate_cookie": 10,
  "vanilla_shake": 15
};
const testOrder = {
	"veggie_pizza": 12,
	"chicken_pizza": 9,
	"chocolate_cookie": 21,
  "vanilla_shake": 7
};
</i>
</testcase>
<testcase>
<i>
const testMenu = {
	"veggie_pizza": 50,
	"chicken_pizza": 80,
	"chocolate_cookie": 4,
  "vanilla_shake": 10
};
const testOrder = {
	"veggie_pizza": 14,
	"chicken_pizza": 11,
	"chocolate_cookie": 25,
  "vanilla_shake": 3
};
</i>
</testcase>
<testcase>
<i>
const testMenu = {
	"veggie_pizza": 180,
	"chicken_pizza": 240,
	"chocolate_cookie": 40,
  "vanilla_shake": 60
};
const testOrder = {
	"veggie_pizza": 5,
	"chicken_pizza": 8,
	"chocolate_cookie": 9,
  "vanilla_shake": 2
};
</i>
</testcase>
</testcases>
</codeblock>
