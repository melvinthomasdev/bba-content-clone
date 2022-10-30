We can use a while loop on non-empty lists. For example, we can say while a list is not empty, pop a value from the list and perform some operation on the value.

<Editor lang="python">
<code>
items_in_bag = ["Chips", "Perfume", "T-Shirt", "Toiletries"]
while items_in_bag:
  item = items_in_bag.pop()
  print(f"Removing {item} from bag")

print("The bag is now empty")
</code>
</Editor>

The while loop automatically stops when condition is no longer true or in this case when the list `items_in_bag` is empty.