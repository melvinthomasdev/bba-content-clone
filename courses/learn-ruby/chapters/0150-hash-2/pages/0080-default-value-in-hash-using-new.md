In the previous lesson, we saw
how we can use `hash.default = 0`
to ensure
that hash returns the value
**0**, if the key is missing.

The default value can also be
set using `Hash.new`.

<codeblock language="ruby" type="lesson">
<code>
h = Hash.new(0)
hash = h.merge({ "name" => "John Smith","city" => "Chicago"})

age = hash["age"]
puts age
</code>
</codeblock>

This time we got 0.
This is because we changed
the default value of hash
to zero by setting the value
when we performed `Hash.new`.