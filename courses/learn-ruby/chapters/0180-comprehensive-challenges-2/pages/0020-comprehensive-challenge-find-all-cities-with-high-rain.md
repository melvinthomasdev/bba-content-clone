Given below is the data of US cities
and
how many days it rained in the year 2018:

|Name of city| Number of days it rained|
|--|--|
|Houston | 104|
|Atlanta | 113|
|Austin | 88|
|Baltimore | 116|
|Boston | 126|
|Dallas | 81|

Use **select** to
find names of all the cities
where it rained for more
than 100 days.

Then, display the result
on the screen.

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

rainy_cities = data.select do |city_name, value|
  value > 100
end

puts rainy_cities
</solution>
</codeblock>
