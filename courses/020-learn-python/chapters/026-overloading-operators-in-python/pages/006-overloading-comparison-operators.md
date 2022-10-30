We can also overload the comparison operators within Python. i.e greater than, less than, equal to, etc.


<Editor lang="python">
<code>
class Cart:
  def __init__(self, items):
    self.items = items
    self.total = sum(items.values())

  # Overload operators
  def __eq__(self, cart):
    return self.total == cart.total

  def __gt__(self, cart):
    return self.total > cart.total

  def __lt__(self, cart):
    return self.total < cart.total


cart_1 = Cart({"milk": 19, "carrots": 50, "eggs": 100})
cart_2 = Cart({"potatoes": 40, "turnips": 13, "banana": 98})

print(cart_1 == cart_2)
</code>
</Editor>

The example above overloads the comparison operators to compare the total price of the items between the two carts. Try changing the `==` in the last line to `<` or `>` to see other the results.

