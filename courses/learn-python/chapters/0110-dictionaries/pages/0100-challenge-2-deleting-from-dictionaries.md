You are designing a shopping cart In Python. The cart is represented as a dictionary where the keys are item names and the values are quantities of each item. Given below is a shopping cart of a customer.

Your task is to enable removal of items from the cart. Once an item is removed you have to print **`quantity` quantities of `item` have been removed from the cart.** Use the `.pop()` method to remove the item and use the value returned by `.pop()` to print the message.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Remove eggs from cart using `.pop()` and print the text using the return value
cart = {
  "eggs": 2,
  "wine bottle": 3,
  "soft drinks": 5
}

item_to_remove = "eggs"
</code>

<solution>
# Remove eggs from cart using `.pop()` and print the text using the return value
cart = {
  "eggs": 2,
  "wine bottle": 3,
  "soft drinks": 5
}

item_to_remove = "eggs"
qty = cart.pop(item_to_remove)
print(f"{qty} quantities of {item_to_remove} have been removed from the cart.")
</solution>
</codeblock>