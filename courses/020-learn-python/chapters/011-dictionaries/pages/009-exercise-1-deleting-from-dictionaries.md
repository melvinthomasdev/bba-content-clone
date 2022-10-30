Akash, a caterer, has received 4 pre-orders for different food items. He has stored these orders in a Python dictionary with the keys as the customer names and the values as the name of the food item ordered. After a while, Akash received a cancellation for the order of the customer Sushma.

Use the `del` keyword to delete the food order of Sushma on `pre_orders`, and print `pre_orders`.

<Editor lang="python" type="exercise">
<code>
# delete the entry of Sushma from pre_orders
pre_orders = {
  "Geetha": "Fried Rice",
  "Rekha": "Noodles",
  "Jaya": "Chicken curry",
  "Sushma": "Vegatable salad"
}
</code>

<solution>
# delete the entry of Sushma from pre_orders
pre_orders = {
  "Geetha": "Fried Rice",
  "Rekha": "Noodles",
  "Jaya": "Chicken curry",
  "Sushma": "Vegatable salad"
}

del pre_orders['Sushma']
print(pre_orders)
</solution>
</Editor>