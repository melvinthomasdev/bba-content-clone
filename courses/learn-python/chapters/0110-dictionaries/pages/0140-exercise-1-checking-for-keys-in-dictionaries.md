You are designing a shopping cart that holds items in a dictionary with the keys as the item name and the value as the quantity.

Given that a user wants to add a new item to the cart, you need to check if the item already exists in the `cart` dictionary. If it does, you should increase the quantity by one, else add the item to the `cart` dictionary with quantity set as 1.

Print the cart items at the end.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Add new item to cart. Increase quantity if already exists
cart = {
  "soap": 1,
  "candle": 2
}

new_item = "soap"
</code>

<solution>
# Add new item to cart. Increase quantity if already exists
cart = {
  "soap": 1,
  "candle": 2
}

new_item = "soap"

if new_item in cart:
  cart[new_item] += 1
else:
  cart[new_item] = 1

print(cart)
</solution>
</codeblock>