We have an array of numbers
and
we want to get only the even
numbers from that array:

<codeblock language="ruby" type="lesson">
<code>
array = [1,2,3,4,5,6,7,8]

even_array = []
array.each do |item|
  even_array.push(item) if item.even?
end

puts even_array
</code>
</codeblock>

This code works but array
has `select` to handle this
in a better way.

`select` will only pick
items for which the result
of the given condition is `true`.

Let's see it in action.

<codeblock language="ruby" type="lesson">
<code>
array = [1,2,3,4,5,6,7,8]
even_array = array.select do |item|
  item.even?
end

puts even_array
</code>
</codeblock>

As we can see, the code
is much cleaner compared
to the previous one.