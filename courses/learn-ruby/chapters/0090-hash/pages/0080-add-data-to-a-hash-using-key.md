We can directly add information to a
hash using a key.
Here is an example:

<codeblock language="ruby" type="lesson">
<code>
hash =  { "USA" => "Washington D.C.",
          "England" => "London",
          "France" => "Paris" }

hash["Italy"] = "Rome"

puts hash
</code>
</codeblock>