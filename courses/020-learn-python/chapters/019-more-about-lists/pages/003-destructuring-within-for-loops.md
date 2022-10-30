Destructuring is commonly used while iterating over lists or dictionaries. We have already used destructuring while iterating over dictionaries.

<Editor lang="python">
<code>
countries_and_capitals = {
  "USA": "Washington D.C",
  "India": "New Delhi",
  "China": "Beijing",
  "England": "London"
}

for country, capital in countries_and_capitals.items():
  print(f"The capital of {country} is {capital}")
</code>
</Editor>

In the example above when we iterate over `countries_and_capitals.items()`, we receive a tuple of the key and value. Using destructuring, we bind these values to the variables `country` and `capital`. It is similar to doing `country, capital = ("USA", "Washington D.C")`.

We can also destructure lists in the same way.

<Editor lang="python">
<code>
names = ["Ricky", "Justin", "Bob"]

for index, name in enumerate(names):
  print(f"The value at index {index} is {name}")
</code>
</Editor>

The `enumerate()` function here takes in a list and adds a count to every value of the list while iterating. It, therefore, returns `(count, value)` for every value in the list.

