The `zip()` function in Python can be used to loop through two lists together in parallel.
For example if we have a list of countries in one list and their respective capitals in a second list, we can iterate through both of them in the following way.

<Editor lang="python">
<code>
countries = ["India", "China", "Japan", "England", "France"]
capitals = ["New Delhi", "Beijing", "Tokyo", "London", "Paris"]

for country, capital in zip(countries, capitals):
  print(f"The capital of {country} is {capital}")
</code>
</Editor>