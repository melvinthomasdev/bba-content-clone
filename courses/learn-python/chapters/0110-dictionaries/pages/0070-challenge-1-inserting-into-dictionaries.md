As a caterer, you already have the food preferences for 4 out of 6 people below. Marcus and Shekhar have now also provided their preferences as `veg` and `non-veg`.

Insert these values into the `food_preferences` dictionary and print it.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
food_preferences = {
  "Raj": "veg",
  "Tom": "non-veg",
  "Susan": "non-veg",
  "James": "veg"
}

# Add Marcus preference as veg

# Add Shekhar preference as non-veg

# Print the dictionary
</code>

<solution>
food_preferences = {
  "Raj": "veg",
  "Tom": "non-veg",
  "Susan": "non-veg",
  "James": "veg"
}

# Add Marcus preference as veg
food_preferences["Marcus"] = "veg"

# Add Shekhar preference as non-veg
food_preferences["Shekhar"] = "non-veg"

# Print the dictionary
print(food_preferences)
</solution>
</codeblock>
