In this case we have the country name and the capital city in an array.
The whole array is part of a bigger array.

<codeblock language="ruby" type="lesson">
<code>
data = [
  ["France", "Paris"],
  ["India", "New Delhi"],
  ["England", "London"]
  ]
</code>
</codeblock>

The goal here is to build a hash with the country name as the key and the capital
city as the value.
We can iterate through the arrays and we can build the hash like this.

<codeblock language="ruby" type="lesson">
<code>
data = [
  ["France", "Paris"],
  ["India", "New Delhi"],
  ["England", "London"]
  ]

hash = {}
data.each do |array|
  country = array[0]
  city = array[1]
  hash[country] = city
end

puts hash
</code>
</codeblock>

We can also solve this problem using `inject`. First let's see the solution and then we'll discuss it.

<codeblock language="ruby" type="lesson">
<code>
data = [
  ["France", "Paris"],
  ["India", "New Delhi"],
  ["England", "London"]
  ]

hash = data.inject({}) do |result, element|
  country = element[0]
  city = element[1]
  result[country] = city
  result
end

puts hash
</code>
</codeblock>