Bilbo, the manager of the Shire Mart, wants customer feedback for all the orders delivered by Pippin. He has requested Samwise to give him the order id's of all the orders delivered by Pippin.

Help Samwise write a program that will filter out all the orders from `orders`, delivered by Pippin, and get only the order id of these orders. Use list comprehensions for the same.


<Editor lang="python" type="exercise">
<code>
# Fetch the order id's of orders delivered by Pippin

orders = [
  ('#4415-170', '14 April 2022', 'Pippin'),
  ('#4416-180', '17 April 2022', 'Merry'),
  ('#4417-190', '20 April 2022', 'Pippin'),
  ('#4418-200', '29 April 2022', 'Hamfast'),
  ('#4419-210', '04 May 2022', 'Pippin'),
  ('#4420-220', '10 May 2022', 'Pippin')
]

# Uncomment next line and Make changes
# pippins_orders =

print(f"Orders delivered by Pippin are {', '.join(pippins_orders)}.")
</code>

<solution>
# Fetch the order id's of orders delivered by Pippin

orders = [
  ('#4415-170', '14 April 2022', 'Pippin'),
  ('#4416-180', '17 April 2022', 'Merry'),
  ('#4417-190', '20 April 2022', 'Pippin'),
  ('#4418-200', '29 April 2022', 'Hamfast'),
  ('#4419-210', '04 May 2022', 'Pippin'),
  ('#4420-220', '10 May 2022', 'Pippin')
]

pippins_orders = [order_id for order_id, date, agent in orders if agent == "Pippin"]

print(f"Orders delivered by Pippin are {', '.join(pippins_orders)}.")
</solution>
</Editor>