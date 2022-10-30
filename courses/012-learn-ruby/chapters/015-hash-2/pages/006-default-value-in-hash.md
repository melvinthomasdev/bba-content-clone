A hash contains key and value.
If the key is not found, then hash returns **nil**.
Let's see it in action:

<Editor lang="ruby">
<code>
hash = { "name" => "John Smith",
         "city" => "Chicago"}

age = hash["age"]
puts age
</code>
</Editor>

As we can see, the hash does not
have a key called `age`
and
this is why, the hash returned `nil`.
That's what hash does by default.

However, we can tell hash
to return some other default value.

<Editor lang="ruby">
<code>
hash = { "name" => "John Smith",
         "city" => "Chicago"}

hash.default = 0

age = hash["age"]
puts age
</code>
</Editor>

This time we got **0**.
This is because, we
changed the default
value of the hash to zero.