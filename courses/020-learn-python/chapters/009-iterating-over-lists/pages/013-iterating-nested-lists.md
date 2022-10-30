We can loop over nested lists using nested for loops. The outer loop will loop over the lists within the list and
the inner loop will loop over the values within each list.

<Editor lang="python">
<code>
teams = [
  ["Sharukh", "Aamir", "Salman"],
  ["Akshay", "Ajay", "Sunil"],
  ["Katrina", "Bobby", "Amitabh"]
]

i = 1

for team in teams: # outer loop
  print(f"Team {i} consists of: ", end="")

  for member in team: # inner loop
    print(member, end=", ")

  i += 1
  print() # new line
</code>
</Editor>