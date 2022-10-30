Rosa is at Chef Roberto's restaurant. She is allergic to spinach and would like to know if Chef Roberto's pasta contains spinach.

Check if the list variable `pasta_ingredients` contains `spinach`.
Print `Enjoy your meal` if `spinach` is not present.
Print `Choose a different dish` if `spinach` is present.

<Editor lang="python" type="exercise">
<code>
# Check if `spinach` is present in the `pasta_ingredients` list.
pasta_ingredients = ["spaghetti", "onions", "spinach", "carrot"]
</code>

<solution>
# Check if `spinach` is present in the `pasta_ingredients` list.
pasta_ingredients = ["spaghetti", "onions", "spinach", "carrot"]
if "spinach" in pasta_ingredients:
  print("Choose a different dish")
else:
  print("Enjoy your meal")
</solution>
</Editor>