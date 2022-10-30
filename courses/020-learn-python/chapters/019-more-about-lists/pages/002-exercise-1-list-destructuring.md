Samwise is a Software Engineer at Shire Mart. He is parsing shopping data from CSV records. Given below, is a record of an item purchased. It contains the name of the item, the quantity purchased, and the price of the item.

Help Samwise extract the data from the string using the `.split()` method. Split the string into 3 values and assign them to the variables `item`, `quantity` and `price` using destructuring. Print the string **`X` quantities of `Y` were purchased at ₹`Z`**.


<Editor lang="python" type="exercise">
<code>
# Split the csv_data using .split(", ") and use destructuring
# to store the result in item, quantity and price

csv_data = "Papaya, 3, 50"

# Make changes here


print(f"{quantity} quantities of {item} were purchased at ₹{price}")
</code>

<solution>
# Split the csv_data using .split(", ") and use destructuring
# to store the result in item, quantity and price

csv_data = "Papaya, 3, 50"

item, quantity, price = csv_data.split(", ")

print(f"{quantity} quantities of {item} were purchased at ₹{price}")
</solution>
</Editor>