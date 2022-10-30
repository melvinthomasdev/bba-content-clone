We can also generate numbers and loop through them using the `range()` function and For Loop.

We can specify the max number in the range function. The loop will start from 0 and end before it.

<Editor lang="python">
<code>
for number in range(10):
  print(number)
</code>
</Editor>

We can use this function to iterate through our lists using indices.

<Editor lang="python">
<code>
planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
for index in range(len(planets)):
  print(planets[index])
</code>
</Editor>