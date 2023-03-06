Given below is the
menu of a pizza restaurant:

|Veggie Pizza| $7 |
|Chicken Pizza| $10 |
|Cookies| $3 |

Mary is having a party
and
she has ordered the following
items:

|Veggie Pizza| 5|
|Chicken Pizza| 7|
|Cookies | 20|

Write a function that will
print the total cost like this:
`Total cost of your order is xxxxx.`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Build Pizza Price Calculator
</code>

<solution>
const givenMenu = {
	"veggie_pizza": 7,
	"chicken_pizza": 10,
	"cookies": 3
};
const givenOrder = {
	"veggie_pizza": 5,
	"chicken_pizza": 7,
	"cookies": 20
};

function priceCalculator(menu, order) {
	const total_veggie_pizza_cost = menu["veggie_pizza"] * order["veggie_pizza"];
	const total_chicken_pizza_cost = menu["chicken_pizza"] * order["chicken_pizza"];
	const total_cookies_cost = menu["cookies"] * order["cookies"];

	const total_order_cost = total_veggie_pizza_cost + total_chicken_pizza_cost + total_cookies_cost;

	return `Total cost of your order is ${total_order_cost}`;
};

priceCalculator(givenMenu, givenOrder);
</solution>
<testcases>
<caller>
console.log(priceCalculator(newMenu, newOrder));
</caller>
<testcase>
<i>
const newMenu = {
	"veggie_pizza": 20,
	"chicken_pizza": 24,
	"cookies": 10
};
const newOrder = {
	"veggie_pizza": 12,
	"chicken_pizza": 9,
	"cookies": 21
};
</i>
</testcase>
<testcase>
<i>
const newMenu = {
	"veggie_pizza": 50,
	"chicken_pizza": 80,
	"cookies": 4
};
const newOrder = {
	"veggie_pizza": 14,
	"chicken_pizza": 11,
	"cookies": 25
};
</i>
</testcase>
<testcase>
<i>
const newMenu = {
	"veggie_pizza": 180,
	"chicken_pizza": 240,
	"cookies": 40
};
const newOrder = {
	"veggie_pizza": 5,
	"chicken_pizza": 8,
	"cookies": 9
};
</i>
</testcase>
</testcases>
</codeblock>