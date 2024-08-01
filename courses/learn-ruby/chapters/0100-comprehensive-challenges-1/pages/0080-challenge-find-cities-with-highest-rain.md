Given below is the data of
some US cities and how many
days it rained there in the
year 2018:

|Name of city| Number of days it rained|
|--|--|
|Houston | 104|
|Atlanta | 113|
|Austin | 88|
|Baltimore | 116|
|Boston | 126|
|Dallas | 81|

Write a program to find the
names of all the cities
where it rained more
than 100 days. Store these
city names in an array and
display the array result on the
screen.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
data = {
  Houston: 104,
  Atlanta: 113,
  Austin: 88,
  Baltimore: 116,
  Boston: 126,
  Dallas: 81
}
# Write your code here
</code>

<solution>
data = {
  Houston: 104,
  Atlanta: 113,
  Austin: 88,
  Baltimore: 116,
  Boston: 126,
  Dallas: 81
}

rainy_cities = []
data.each do |city_name, value|
  if value > 100
    rainy_cities.push(city_name)
  end
end

puts rainy_cities
</solution>
</codeblock>
