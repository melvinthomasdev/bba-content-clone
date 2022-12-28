Just like Array and Range,
Hash also supports `each do`.

<codeblock language="ruby" type="lesson">
<code>
hash =  { "USA" => "Washington D.C.",
          "England" => "London",
          "France" => "Paris" }

hash.each do | key, value |
  puts "Capital of " + key + " is " + value
end
</code>
</codeblock>