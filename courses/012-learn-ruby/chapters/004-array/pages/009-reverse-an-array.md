Let's print items of an
array in the reverse order.
We need to use `reverse`
for this.

<Editor lang="ruby">
<code>
things_i_like = ["ice cream","chocolate","movies"]

reversed_array = things_i_like.reverse

reversed_array.each do |thing|
  puts "I like " + thing
end
</code>
</Editor>