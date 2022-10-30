Just like Array and Range,
Hash also supports `each do`.

<Editor lang="ruby">
<code>
hash =  { "USA" => "Washington D.C.",
          "England" => "London",
          "France" => "Paris" }

hash.each do | key, value |
  puts "Capital of " + key + " is " + value
end
</code>
</Editor>