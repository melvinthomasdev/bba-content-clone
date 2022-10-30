Using `reject`, find all city names
that DO NOT start with "L".

<Editor lang="ruby" type="exercise">
<code>
cities = ["Paris", "London", "Los Angeles", "Chicago"]
</code>

<solution>
cities = ["Paris","London","Los Angeles", "Chicago"]

cities_not_starting_with_l = cities.reject do |item|
  item.start_with?("L")
end

puts cities_not_starting_with_l
</solution>
</Editor>