Use the range method and the for loop to iterate through the ingredients list and print the ingredient along with its index.

Print the statement *Position `index` contains `ingredient`.*

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# print all the ingredients along with their index using a loop and range()
ingredients = ["cabbage", "carrot", "cauliflower", "mayonnaise", "salt", "peas"]
</code>

<solution>
ingredients = ["cabbage", "carrot", "cauliflower", "mayonnaise", "salt", "peas"]

for index in range(len(ingredients)):
  print(f"Position {index} contains {ingredients[index]}")
</solution>
</codeblock>