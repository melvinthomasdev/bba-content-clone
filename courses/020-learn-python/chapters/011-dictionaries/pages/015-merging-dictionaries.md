We can merge two dictionaries in Python using `.update()`.

<Editor lang="python">
<code>
countries_and_capitals = {
  "USA": "Washington D.C",
  "India": "New Delhi",
}

more_countries_and_capitals = {
  "Germany": "Berlin",
  "Russia": "Moscow",
}

countries_and_capitals.update(more_countries_and_capitals)

print(countries_and_capitals)
</code>
</Editor>