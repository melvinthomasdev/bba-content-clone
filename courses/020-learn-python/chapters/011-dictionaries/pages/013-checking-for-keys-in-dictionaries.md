Attempting to access a key, which is not present in a dictionary can throw an error as follows:

<Editor lang="python">
<code>
countries_and_capitals = {
  "USA": "Washington D.C",
  "India": "New Delhi",
  "China": "Beijing",
  "England": "London"
}

print(countries_and_capitals["Singapore"])
</code>
</Editor>

To avoid such cases we can either use the `.get()` method or first check if the key exists in the dictionary using the `in` keyword.

<Editor lang="python">
<code>
countries_and_capitals = {
  "USA": "Washington D.C",
  "India": "New Delhi",
  "China": "Beijing",
  "England": "London"
}

if "Singapore" in countries_and_capitals:
  print(f"The capital of Singapore is {countries_and_capitals['Singapore']}")
else:
  print("Singapore does not exist in Dictionary")
</code>
</Editor>