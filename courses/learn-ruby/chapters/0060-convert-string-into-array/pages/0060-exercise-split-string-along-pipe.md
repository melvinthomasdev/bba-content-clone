In this exercise, split
the names of cities into an array.
The array should contain
only the names of the
cities and not the pipe divider.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
# Split the string into an array of cities

cities = "Chicago | Miami | Seattle"

array = 

puts array
</code>

<solution>
cities = "Chicago | Miami | Seattle"

array = cities.split("|")

puts array
</solution>
</codeblock>