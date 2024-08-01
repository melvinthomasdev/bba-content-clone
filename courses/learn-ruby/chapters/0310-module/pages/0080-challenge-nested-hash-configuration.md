Create a nested hash configuration
`menu` that represents the menu
of a restaurant.

The menu should include three categories
as nested hash:
- "Appetizer"
- "Main Course"
- "Dessert"

Contents of these categories are as follows:

| Appetizers   |    |
| ------------ | -- |
| Spring roll  | 50 |
| French Fries | 40 |
| Garlic Bread | 60 |

| Main Course     |     |
| --------------- | --- |
| Vegetable Pizza | 100 |
| Nachos          | 70  |
| Biryani         | 80  |

| Dessert       |    |
| ------------- | -- |
| Ice-cream     | 20 |
| Fruit Custard | 40 |

Print the menu configuration to
display all the categories and
their items on screen.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
# Write your code here
</code>
<solution>
menu = {
  appetizer: {
    spring_roll: 50,
    french_fries: 10,
    garlic_bread: 100
  },
  main_course: {
    vegetable_pizza: 100,
    nachos: 70,
    biryani: 80
  },
  dessert: {
    ice_cream: 20,
    fruit_custard: 40
  }
}

puts menu
</solution>
</codeblock>
