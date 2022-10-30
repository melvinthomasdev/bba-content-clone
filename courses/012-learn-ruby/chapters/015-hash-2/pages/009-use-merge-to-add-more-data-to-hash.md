We can use `merge` to merge the contents of two hashesh.
It returns a new hash. The original two hashes remain the same.

<Editor lang="ruby">
<code>
hash =  { "USA" => "Washington D.C.",
          "England" => "London",
          "France" => "Paris" }

hash2 = hash.merge({ "Italy" => "Rome"})

puts hash

puts hash2
</code>
</Editor>

We can also use `merge!` to merge two hashes.
The difference is that in this case the original hash itself is altered.
<Editor lang="ruby">
<code>
hash =  { "USA" => "Washington D.C.",
          "England" => "London",
          "France" => "Paris" }

hash.merge!({ "Italy" => "Rome"})

puts hash
</code>
</Editor>