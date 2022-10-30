We can loop through the key-value pairs in our dictionary using `.items()`.

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