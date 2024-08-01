Given below is the
menu of a pizza restaurant:

- Veggie Pizza: $7
- Chicken Pizza: $10
- Cookies: $3

Mary is having a party
and
she has ordered the following
items:

- 5 Veggie Pizzas
- 7 Chicken Pizzas
- 20 Cookies

Write a program that will
print the total cost like this:

```
Total cost of your order is xxxxx.
```

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
# Write your code here
</code>

<solution>
menu = { veggie_pizza: 7, chicken_pizza: 10, cookies: 3 }
order = { veggie_pizza: 5, chicken_pizza: 7, cookies: 20 }

veggie_pizza_cost = menu[:veggie_pizza] * order[:veggie_pizza]
chicken_pizza_cost = menu[:chicken_pizza] * order[:chicken_pizza]
cookies_cost = menu[:cookies] * order[:cookies]

total_cost = veggie_pizza_cost + chicken_pizza_cost + cookies_cost

puts "Total cost of your order is " + total_cost.to_s + "."
</solution>
</codeblock>
