Using `select`, find all
city names that start with "L".

<Editor lang="ruby" type="exercise">
<code>
cities = ["Paris", "London", "Los Angeles", "Chicago"]
</code>

<solution>
cities = ["Paris","London","Los Angeles", "Chicago"]

cities_starting_with_l = cities.select do |item|
  item.start_with?("L")
end

puts cities_starting_with_l
</solution>
</Editor>