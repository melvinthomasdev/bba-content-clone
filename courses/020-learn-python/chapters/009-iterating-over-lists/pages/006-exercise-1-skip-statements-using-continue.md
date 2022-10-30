Sophia is making a list of items she needs to purchase. She has categorized into item types. e.g: Food, Stationary, etc. She has decided not to purchase Sports items this time she goes shopping.

Help Sophia make a final list of shopping items, by skipping out any *Sport* item in the list. Add the rest of the items to `final_list` and print it to the screen.

Use loops, if condition and the continue keyword.


<Editor lang="python" type="exercise">
<code>
items = ["Brocolli - Food", "Pen - Stationary", "Pasta - Food", "Book - Stationery", "Soap - Cleaning", "Football - Sport", "Salad - Food"]
final_list = []

# Add all items to final_list except sport items

print(final_list)
</code>

<solution>
items = ["Brocolli - Food", "Pen - Stationary", "Pasta - Food", "Book - Stationery", "Soap - Cleaning", "Football - Sport", "Salad - Food"]
final_list = []


for item in items:
  if "Sport" in item:
    continue

  final_list.append(item)

print(final_list)
</solution>
</Editor>