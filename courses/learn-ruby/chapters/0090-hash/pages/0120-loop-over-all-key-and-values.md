Just like Array and Range,
Hash also supports `each do`.

<codeblock language="ruby" type="lesson">
<code>
hash =  { USA: "Washington D.C.",
          England: "London",
          France: "Paris" }

hash.each do | key, value |
  puts "Capital of " + key.to_s + " is " + value
end
</code>
</codeblock>

The `to_s` method converts the symbol to a string so that it can be concatenated with the other strings.
