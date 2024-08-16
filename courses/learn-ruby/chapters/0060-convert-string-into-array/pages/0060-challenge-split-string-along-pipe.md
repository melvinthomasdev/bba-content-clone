In this challenge, split
the names of cities into an array.
The array should contain
only the names of the
cities and not the pipe divider.

Note: Notice that the pipe divider is surrounded by spaces. You will need to account for this when splitting the string. The names of cities in the output shouldn't contain any leading or trailing spaces.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
# Split the string into an array of cities

cities = "Chicago | Miami | Seattle"

array =

puts array

</code>

<solution>
cities = "Chicago | Miami | Seattle"

array = cities.split(" | ")

puts array

</solution>
</codeblock>
