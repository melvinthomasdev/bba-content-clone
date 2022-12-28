An array holds a number of items.
In this example, the array
is holding things I like.

<codeblock language="ruby" type="lesson">
<code>
things_i_like = ["ice cream", "chocolate","movies"]
</code>
</codeblock>

Array has a special
thing called `each`.
Array also has a
`do end` block.

<codeblock language="ruby" type="lesson">
<code>
things_i_like = ["ice cream", "chocolate","movies"]

things_i_like.each do |thing|
  puts "I like " + thing
end
</code>
</codeblock>

In the `do end` block,
each item is captured in
between those two vertical
lines `||` & printed one by one.

Those two vertical lines
are also called `pipes`.