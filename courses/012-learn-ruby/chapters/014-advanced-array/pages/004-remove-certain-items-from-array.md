We have an array of numbers
and we want to remove all
the odd numbers from that array.

<Editor lang="ruby">
<code>
array = [1,2,3,4,5,6,7,8]

even_array = []
array.each do |item|
  even_array.push(item) if item.even?
end

puts even_array
</code>
</Editor>

This code works, but Array
provides `reject` as a simpler way
to reject certain items.

`reject` will only reject items
for which the result of
condition is `true`.

Let's see it in action.

<Editor lang="ruby">
<code>
array = [1,2,3,4,5,6,7,8]
even_array = array.reject do |item|
  item.odd?
end

puts even_array
</code>
</Editor>