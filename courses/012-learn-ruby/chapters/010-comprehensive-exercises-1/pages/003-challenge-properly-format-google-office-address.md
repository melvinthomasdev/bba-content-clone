Given below is the office address of Google:

|Key       |Value           |
|--|--|
|name      |Google Inc |
|address   |1600 Amphitheatre Pkwy  |
|city      |Mountain View             |
|state     |CA           |
|zip       |94043 |
|country   |USA |

Write a program which uses
4 `puts` statements to print the
office address
in the format as shown below:

```
Google Inc
1600 Amphitheatre Pkwy
Mountain View, CA 94043
USA
```

<Editor lang="ruby" type="challenge">
<code>
office = {
  "name" => "Google Inc",
  "address" => "1600 Amphitheatre Pkwy",
  "city" => "Mountain View",
  "state" => "CA",
  "zip" => "94043",
  "country" => "USA"
}
</code>

<solution>
office = {
  "name" => "Google Inc",
  "address" => "1600 Amphitheatre Pkwy",
  "city" => "Mountain View",
  "state" => "CA",
  "zip" => "94043",
  "country" => "USA"
}

name = office["name"]
address = office["address"]
city = office["city"]
state = office["state"]
zip = office["zip"]
country = office["country"]

puts name
puts address
puts city + ", " + state + " " + zip
puts country
</solution>
</Editor>