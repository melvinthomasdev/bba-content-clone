You are designing a shopping cart. Once the items are added to the cart, and the user is on the checkout screen, you need to fetch the number of items in the cart.

You are using a list to store the items of the cart. Given a `cart` list containing items, print the size of the cart using `len()`. Print **You have X items in your cart** to the screen, where `X` is the number of items.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Find the size of `cart` and print it to the screen.
cart = ["Sugar", "Apple", "Wine", "Eggs", "Chips", "Chewing Gum"]
</code>

<solution>
cart = ["Sugar", "Apple", "Wine", "Eggs", "Chips", "Chewing Gum"]
print(f"You have {len(cart)} items in your cart")
</solution>
</codeblock>