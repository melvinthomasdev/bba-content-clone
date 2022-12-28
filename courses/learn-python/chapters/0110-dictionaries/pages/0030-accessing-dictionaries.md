The values from the dictionary can be accessed by their keys using the `[]` brackets. For example, we can fetch the color of an apple from the `fruits_and_colors` dictionary in the following manner:

<codeblock language="python" type="lesson">
<code>
fruits_and_colors = {
  "grapes": "green",
  "apple": "red",
  "banana": "yellow",
  "orange": "orange"
}

print(fruits_and_colors['apple'])
</code>
</codeblock>

We can also use the `.get()` method to access a value.
The difference between `.get()` and `[]` is that if the key is not present in the dictionary, `[]` will throw an error, whereas `.get()` will just return `None`.

<codeblock language="python" type="lesson">
<code>
fruits_and_colors = {
  "grapes": "green",
  "apple": "red",
  "banana": "yellow",
  "orange": "orange"
}

print(fruits_and_colors.get('apple'))
print(fruits_and_colors.get('strawberry'))
</code>
</codeblock>

We can also pass an optional second parameter to `.get()` in cases where we want a different default value to be returned when a key is absent in the dictionary.

<codeblock language="python" type="lesson">
<code>
fruits_and_colors = {
  "grapes": "green",
  "apple": "red",
  "banana": "yellow",
  "orange": "orange"
}

print(fruits_and_colors.get('strawberry', 'deepred'))
</code>
</codeblock>

Change the default value from `deepred` to `orange` and check the output.