Akash, a caterer, has received an order for 6 people. 4 out of 6 have provided their food preference i.e Veg or Non-veg. While serving the food, Akash refers to his dictionary to check each person's preference. In case the persons name is not present in the dictionary, Akash hands them a Veg dish by default.

Help Akash out by using the `.get()` method on `food_preferences` dictionary to fetch the preference of each customer present in the `customers` list variable. Use the second parameter of `.get()` to return `veg` in case the name of the customer is not present in the `food_preferences` dictionary.

Iterate through each of the customers in `customers` list and print the following:

Text: **`customer` has been served `food preference`**

<Editor lang="python" type="exercise">
<code>
# Use a for loop and fetch each customers order from preferences using .get()
# set the default preference to veg for customers whose name is missing
food_preferences = {
  "Raj": "veg",
  "Tom": "non-veg",
  "Susan": "non-veg",
  "James": "veg"
}

customers = ["Raj", "Tom", "Marcus", "Shekhar", "Susan", "James"]
</code>

<solution>
# Use a for loop and fetch each customers order from preferences using .get()
# set the default preference to veg for customers whose name is missing
food_preferences = {
  "Raj": "veg",
  "Tom": "non-veg",
  "Susan": "non-veg",
  "James": "veg"
}

customers = ["Raj", "Tom", "Marcus", "Shekhar", "Susan", "James"]

for customer in customers:
  print(f"{customer} has been served {food_preferences.get(customer, 'veg')}")
</solution>
</Editor>