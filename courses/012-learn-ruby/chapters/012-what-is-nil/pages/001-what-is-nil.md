`nil` is a special thing in Ruby.
It represents `empty` or `nothing`.

If we ask for a value from an
array and that value is not there,
then we get `nil`.

<Editor lang="ruby">
<code>
array = [1, 2, 3]
result = array[10]
puts result
</code>
</Editor>

There is no 10th element in the array.
So, the array returns `nil`.
It means the 10th element is `nothing`.

Similarly, let's try to get a
value from a hash for which the
key is not there.

<Editor lang="ruby">
<code>
hash = {"a" => "A", "b" => "B"}
result = hash["c"]
puts result
</code>
</Editor>

The hash does not have the key **c**.
So the hash returns a **nil**.