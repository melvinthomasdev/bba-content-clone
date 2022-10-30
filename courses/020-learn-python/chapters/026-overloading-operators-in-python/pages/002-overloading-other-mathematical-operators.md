Just like `__add__` there are other methods we can use to overwrite the operators in Python.

* \__sub__: This method can be used to overload the `-` operator.
* \__mul__ : This method can be used to overload the `*` operator.
* \__truediv__: This method can be used to overload the `/` operator.
* \__mod__: This method can be used to overload the `%` operator.
* \__lshift__: This method can be used to overload the `<<` operator.

<Editor lang="python">
<code>
class Basket:
  def __init__(self, items):
    self.items = items

  def __lshift__(self, basket): # <-- Overload << operator
    self.items += basket.items # <-- Add items from other basket to current basket
    basket.items = [] # <-- Empty other basket

  def __repr__(self):
    items_str = ', '.join(self.items)
    return f"Basket[items: [{items_str}]]"

non_empty_basket = Basket(["apples", "eggs", "milk"])
empty_basket = Basket([])

print(f"Non Empty Basket: {non_empty_basket}")
print(f"Empty Basket: {empty_basket}")

print("\nMoving items from non empty basket to empty basket\n")

empty_basket << non_empty_basket # <-- Move items

print(f"Non Empty Basket: {non_empty_basket}")
print(f"Empty Basket: {empty_basket}")
</code>
</Editor>

The example above shows the use of the left-shift operator `<<` to move items from one basket to another.

