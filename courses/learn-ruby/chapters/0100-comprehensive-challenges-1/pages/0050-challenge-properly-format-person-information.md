Given below is information about a
certain person:

|Key       |Value           |
|--|--|
|name      |john vanderbilt |
|city name |salt lake city  |
|country   |usa             |
|zip code  |84103           |

Write a program which will
print the information
as shown below:

```
John Vanderbilt
Salt Lake City, USA 84103
```


<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
person = {
  name: "john vanderbilt",
  city_name: "salt lake city",
  country: "usa",
  zip_code: "84103"
}
# Write your code here
</code>

<solution>
person = {
  name: "john vanderbilt",
  city_name: "salt lake city",
  country: "usa",
  zip_code: "84103"
}

person_name = person[:name]
city_name = person[:city_name]
country_name = person[:country]
zip_code = person[:zip_code]

name_parts = person_name.split
first_line = []
name_parts.each do |name_part|
  first_line.push(name_part.capitalize)
end

city_name_parts = city_name.split
second_line = []
city_name_parts.each do |city_name_part|
  second_line.push(city_name_part.capitalize)
end
second_line[2] = second_line[2] + ','

country = country_name.upcase
second_line.push(country)

second_line.push(zip_code)

puts first_line.join(' ')
puts second_line.join(' ')
</solution>
</codeblock>
