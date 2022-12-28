To delete a key-value pair from the dictionary we can use the `del` keyword.

<codeblock language="python" type="lesson">
<code>
fruits_and_colors = {
  "grapes": "green",
  "apple": "red",
  "banana": "yellow",
  "orange": "orange"
}

del fruits_and_colors['banana']
print(fruits_and_colors)
</code>
</codeblock>

Another way to remove an item from a dictionary is by using the .`pop()` method. The difference between `.pop()` and `del` is that that `.pop()` returns the value of the deleted item.

<codeblock language="python" type="lesson">
<code>
fruits_and_colors = {
  "grapes": "green",
  "apple": "red",
  "banana": "yellow",
  "orange": "orange"
}

deleted_value = fruits_and_colors.pop('banana')
print(deleted_value)
</code>
</codeblock>