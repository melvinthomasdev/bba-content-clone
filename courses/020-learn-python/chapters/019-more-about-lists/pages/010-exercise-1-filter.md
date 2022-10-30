Pippin, a delivery boy at the Shire Mart, is incharge of delivering the orders made on 10th May 2022. Help him, filter out orders from `orders`, that were made on `10 May 2022`. Print the filtered list to the screen for Pippin to see.


<Editor lang="python" type="exercise">
<code>
# Filter the orders by date. Fetch only orders made on 10 May 2022
# Print the filtered list

orders = [
  ('ORDER-170', '10 May 2022'),
  ('ORDER-180', '17 April 2022'),
  ('ORDER-190', '10 May 2022'),
  ('ORDER-200', '29 April 2022'),
  ('ORDER-210', '10 May 2022'),
  ('ORDER-220', '10 May 2022')
]

# Filter and print the filtered list
</code>

<solution>
# Filter the orders by date. Fetch only orders made on 10 May 2022
# Print the filtered list

orders = [
  ('ORDER-170', '10 May 2022'),
  ('ORDER-180', '17 April 2022'),
  ('ORDER-190', '10 May 2022'),
  ('ORDER-200', '29 April 2022'),
  ('ORDER-210', '10 May 2022'),
  ('ORDER-220', '10 May 2022')
]

filtered = list(filter(lambda order: order[1] == '10 May 2022', orders))
print(filtered)
</solution>
</Editor>