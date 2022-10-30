In this exercise,
add a new key
**height** to the hash.

The value for the key
**height** should be
**6 ft**.

<Editor lang="ruby" type="exercise">
<code>
hash = {
  "first_name" => "John",
  "last_name" => "Smith",
  "age" => 25
}
</code>

<solution>
hash = {
  "first_name" => "John",
  "last_name" => "Smith",
  "age" => 25
}

hash.merge!({ "height" => "6 ft"})

puts hash
</solution>
</Editor>