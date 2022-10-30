We have the following information:

|Key    |Value          |
|--|--|
|name   |San Francisco  |
|country|USA            |
|zip    |94131          |

Write a program which will
print the information
in the following format:

```
San Fracisco, USA
94131
```

<Editor lang="ruby" type="exercise">
<code>
city_info = {
  "name" => "San Francisco",
  "country" => "USA",
  "zip" => "94131"
}
</code>

<solution>
city_info = {
    "name" => "San Francisco",
    "country" => "USA",
    "zip" => "94131"
}

puts city_info['name'] + ", " + city_info['country']
puts city_info['zip']
</solution>
</Editor>