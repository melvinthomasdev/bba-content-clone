Using `select`, find all
city names that start with "L".

<codeblock language="ruby" type="exercise" testMode="fixedInput">
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
</codeblock>