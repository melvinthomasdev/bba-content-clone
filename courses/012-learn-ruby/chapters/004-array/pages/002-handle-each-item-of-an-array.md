An array holds a number of items.
In this example, the array
is holding things I like.

<Editor lang="ruby">
<code>
things_i_like = ["ice cream", "chocolate","movies"]
</code>
</Editor>

Array has a special
thing called `each`.
Array also has a
`do end` block.

<Editor lang="ruby">
<code>
things_i_like = ["ice cream", "chocolate","movies"]

things_i_like.each do |thing|
  puts "I like " + thing
end
</code>
</Editor>

In the `do end` block,
each item is captured in
between those two vertical
lines `||` & printed one by one.

Those two vertical lines
are also called `pipes`.