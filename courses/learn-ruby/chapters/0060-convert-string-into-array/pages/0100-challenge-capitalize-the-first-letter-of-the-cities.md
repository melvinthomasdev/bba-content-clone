We have a string that
contains the names of the cities
in a string:

```
cities = "chicago, miami, seattle"
```

Capitalize the first letter of each
city name and then print them in a single
line separated by commas.



<codeblock language="ruby" type="exercise" caseSensitiveOutput="true" testMode="fixedInput">
<code>
cities = "chicago, miami, seattle"
# Write your code here
</code>

<solution>
cities = "chicago, miami, seattle"
cities_in_array = cities.split(",")
new_cities = []

cities_in_array.each do |city|
  new_cities.push(city.strip.capitalize)
end

new_cities_name = new_cities.join(", ")
puts new_cities_name
</solution>
</codeblock>
