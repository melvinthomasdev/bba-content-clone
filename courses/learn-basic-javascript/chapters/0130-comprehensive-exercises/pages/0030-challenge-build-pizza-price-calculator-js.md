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

Write a program that will
print the total cost like this:

```
Total cost of your order is xxxxx.
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Build Pizza Price Calculator
</code>

<solution>
menu = { "veggie_pizza": 7, "chicken_pizza": 10, "cookies": 3 }
order = { "veggie_pizza": 5, "chicken_pizza": 7, "cookies": 20 }

const veggie_pizza_cost = menu["veggie_pizza"] * order["veggie_pizza"]
const chicken_pizza_cost = menu["chicken_pizza"] * order["chicken_pizza"]
const cookies_cost = menu["cookies"] * order["cookies"]

const total_cost = veggie_pizza_cost + chicken_pizza_cost + cookies_cost

console.log(`Total cost of your order is ${total_cost}`)
</solution>
</codeblock>