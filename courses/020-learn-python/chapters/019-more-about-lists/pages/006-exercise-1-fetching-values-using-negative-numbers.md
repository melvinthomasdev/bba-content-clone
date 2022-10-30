Samwise has lost the order ID of the order he was processing. However, his friend Gandalf, remembers that it was the most recent order.

Given the orders list, which contains the orders `(order_id, order_date)` sorted by recency ( older ones first ), help Samwise fetch the most recent **`order_id`** using negative indices and print it to the screen.


<Editor lang="python" type="exercise">
<code>
# Fetch the last order item in the orders list using negative indices and print the order id.

orders = [
  ('ORDER-170', '14 April 2022'),
  ('ORDER-180', '17 April 2022'),
  ('ORDER-190', '28 April 2022'),
  ('ORDER-200', '29 April 2022'),
  ('ORDER-210', '1 May 2022'),
  ('ORDER-220', '9 May 2022')
]
</code>

<solution>
orders = [
  ('ORDER-170', '14 April 2022'),
  ('ORDER-180', '17 April 2022'),
  ('ORDER-190', '28 April 2022'),
  ('ORDER-200', '29 April 2022'),
  ('ORDER-210', '1 May 2022'),
  ('ORDER-220', '9 May 2022')
]

print(orders[-1][0])
</solution>
</Editor>