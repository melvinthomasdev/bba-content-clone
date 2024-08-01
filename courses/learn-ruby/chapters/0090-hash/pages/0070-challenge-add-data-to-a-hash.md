In this exercise,
add a new key
**height** to the hash.

The value for the key
**height** should be
**6 ft**.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
hash = {
  first_name: "John",
  last_name: "Smith",
  age: 25
}
# Write your code here
</code>

<solution>
hash = {
  first_name: "John",
  last_name: "Smith",
  age: 25
}

hash.merge!({ height: "6 ft"})

puts hash
</solution>
</codeblock>
