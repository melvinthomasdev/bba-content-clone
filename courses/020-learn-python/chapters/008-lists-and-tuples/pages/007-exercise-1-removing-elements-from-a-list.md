Chef Roberto is making his famous pasta again but this time he receives a note which says that the customer is allergic to carrots.

Help Chef Roberto by removing `carrot` from the List variable `ingredients`.

<Editor lang="python" type="exercise">
<code>
# Append the string `tomato` to the `ingredients`
ingredients = ["spaghetti", "onions", "spinach", "carrot"]
</code>

<solution>
ingredients = ["spaghetti", "onions", "spinach", "carrot"]
ingredients.remove("carrot")
print(ingredients)
</solution>
</Editor>