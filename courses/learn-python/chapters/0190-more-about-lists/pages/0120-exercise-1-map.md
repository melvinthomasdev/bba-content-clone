Pippin is out to deliver the orders made on 10th May 2022. As these orders are in process, Samwise has to update the same the in `orders` list.

Help Samwise write a program using `map()` to add a status field to every order in orders. If the date is `10 May 2022`, the status would be `In Process`. For other orders, the status would be `Completed`. 


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Use map to add a status field to each order. If the order was made on 10 May 2022, add the status as "In Process". For orders on other dates, add the status as "Completed".

orders = [
  ('ORDER-170', '10 May 2022'),
  ('ORDER-180', '17 April 2022'),
  ('ORDER-190', '10 May 2022'),
  ('ORDER-200', '29 April 2022'),
  ('ORDER-210', '10 May 2022'),
  ('ORDER-220', '10 May 2022')
]

def update_status(order):
#   return (order_id, order_date, order status) based on condition
  pass
 
# use map to add order status and print the new list
</code>

<solution>
# Use map to add a status field to each order. If the order was made on 10 May 2022, add the status as "In Process". For orders on other dates, add the status as "Completed".

orders = [
  ('ORDER-170', '10 May 2022'),
  ('ORDER-180', '17 April 2022'),
  ('ORDER-190', '10 May 2022'),
  ('ORDER-200', '29 April 2022'),
  ('ORDER-210', '10 May 2022'),
  ('ORDER-220', '10 May 2022')
]

def update_status(order):
#   return (order_id, order_date, order status) based on condition
  if order[1] == '10 May 2022':
    return order + ('In Process',)
  else:
    return order + ('Completed',)
 
# use map to add order status and print the new list
updated_orders = list(map(update_status, orders))
print(updated_orders)
</solution>
</codeblock>