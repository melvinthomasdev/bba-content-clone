Samwise has already parsed the shopping data related to Mr.Frodo and stored it in a list `cart`. He would now like to iterate over all of the entries in the list and get the total price for each item ordered. i.e using quantity \* price. 

Help him write a program to iterate over the tuples in the cart and calculate the total price for each item. Print **The total price for `ITEM` is `X`** for every item.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Iterate through cart using a for loop and get the name, quantity and price through destructuring.
# Calculate the final price for each product using quantity * price
# Print "The total price for ITEM is X" for every item

cart = [
    ("Papaya", 3, 50),
    ("Apple", 5, 20),
    ("Mango", 2, 30),
    ("Banana", 20, 5)
]
</code>

<solution>
cart = [
    ("Papaya", 3, 50),
    ("Apple", 5, 20),
    ("Mango", 2, 30),
    ("Banana", 20, 5)
]

for name, quantity, price in cart:
  print(f"The total price for {name} is {quantity * price}")
</solution>
</codeblock>