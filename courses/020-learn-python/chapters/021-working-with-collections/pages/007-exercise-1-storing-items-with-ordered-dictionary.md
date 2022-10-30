You are designing a shopping cart for ABC Stores. The boss has asked you to design a cart which contains the items with the respective quantity. He has also asked you to maintain the order in which the items were added.

Given below is a sample list `items` of items that a user is adding to his cart. Add these items into a dictionary. If the item already exists increase its quantity. Use an `OrderedDict` for the solution. Print the dictionary once done.


<Editor lang="python" type="exercise">
<code>
# Create an ordered dictionary of {item: quantity} given items
items = ["cheese", "yoghurt", "tomatoes", "yoghurt", "onions", "milk", "milk", "cheese"]
</code>

<solution>
# Create an ordered dictionary of {item: quantity} given items
from collections import OrderedDict

items = ["cheese", "yoghurt", "tomatoes", "yoghurt", "onions", "milk", "milk", "cheese"]

cart = OrderedDict()
for item in items:
  cart[item] = cart.get(item, 0) + 1

print(cart)
</solution>
</Editor>