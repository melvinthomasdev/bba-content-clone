A Hash stores information
in the form of a key value pair.

|Key     |Value           |
|--|--|
|USA     |Washington D.C. |
|England |London          |
|France  |Paris           |

In the hash given above,
the **key** is the country name
and the **value** is the
capital of the country.

<codeblock language="ruby" type="lesson">
<code>
hash =  { "USA" => "Washington D.C.",
          "England" => "London",
          "France" => "Paris" }

puts hash
</code>
</codeblock>

But the usage of hash-rockets `=>` for representing a hash, while still valid and occasionally seen in older Ruby code, has become less common. This is due to the introduction of a newer, more concise syntax in Ruby 1.9 that resembles JSON, making the code more readable and easier to write, especially for those familiar with JSON from other languages.

Consider the same hash using the newer syntax:

<codeblock language="ruby" type="lesson">
<code>
hash =  { USA: "Washington D.C.",
          England: "London",
          France: "Paris" }

puts hash
</code>
</codeblock>

It's essential to note that in this newer syntax, keys are automatically converted to symbols, not strings. For instance, in the example above, `USA:` is equivalent to `:USA =>`. This approach is suitable for most situations, as symbols are more memory-efficient and quicker to process compared to strings. You will learn more about symbols in the [upcoming chapter](https://courses.bigbinaryacademy.com/learn-ruby/symbol/what-is-symbol/).

However, if your requirements specifically include using strings or other objects as keys, you will need to revert to the hash-rocket syntax.
