In this exercise,
using `each do`,
print who is staying
in which room number.

This is how the output should look:

```
John Smith is staying in 201
Mary Gold is staying in 202
Kevin Kelly is staying in 203
```

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
hotel = {
  "201" => "John Smith",
  "202" => "Mary Gold",
  "203" => "Kevin Kelly"
}
</code>

<solution>
hotel = {
  "201" => "John Smith",
  "202" => "Mary Gold",
  "203" => "Kevin Kelly"
}

hotel.each do | room, name |
  puts name + " is staying in " + room
end
</solution>
</codeblock>