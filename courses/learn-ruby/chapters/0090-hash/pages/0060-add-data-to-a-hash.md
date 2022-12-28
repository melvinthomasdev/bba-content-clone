We can add another key value
pair to an existing
hash using the `merge!` method.

Notice that this method
has a `!` at the end.

<codeblock language="ruby" type="lesson">
<code>
hash =  { "USA" => "Washington D.C.",
          "England" => "London",
          "France" => "Paris" }

hash.merge!({ "Italy" => "Rome"})

puts hash
</code>
</codeblock>

Using `merge!` changes
the original hash.