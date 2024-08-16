The manager of Shire Mart, Bilbo, has asked Samwise to get him the list of the 3 most recent orders. Given a list `orders` containing the orders sorted based on recency (older ones first), help Samwise fetch the 3 most recent orders. Use list slicing for the same.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Fetch the last 3 recent orders and store them in recent orders

orders = [
  ('ORDER-170', '14 April 2022'),
  ('ORDER-180', '17 April 2022'),
  ('ORDER-190', '28 April 2022'),
  ('ORDER-200', '29 April 2022'),
  ('ORDER-210', '1 May 2022'),
  ('ORDER-220', '9 May 2022')
]

# Uncomment the next line and make changes
# recent_orders = 

print("The last 3 order were made on: ")
for order in recent_orders:
  print(order[1])
</code>

<solution>
# Fetch the last 3 recent orders and store them in recent orders

orders = [
  ('ORDER-170', '14 April 2022'),
  ('ORDER-180', '17 April 2022'),
  ('ORDER-190', '28 April 2022'),
  ('ORDER-200', '29 April 2022'),
  ('ORDER-210', '1 May 2022'),
  ('ORDER-220', '9 May 2022')
]

recent_orders = orders[-3:]

print("The last 3 order were made on: ")
for order in recent_orders:
  print(order[1])
</solution>
</codeblock>