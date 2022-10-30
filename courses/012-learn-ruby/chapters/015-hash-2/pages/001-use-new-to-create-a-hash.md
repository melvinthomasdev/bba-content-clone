So far, we have seen a hash
being created like this:

<Editor lang="ruby">
<code>
hash = { "name" => "John Smith" }
puts hash
</code>
</Editor>

There is another way to create a hash
using `new`:

<Editor lang="ruby">
<code>
hash2 = Hash.new
puts hash2
</code>
</Editor>

`Hash.new` creates an empty hash.
To this empty hash, we need to
add key and value, as shown below:

<Editor lang="ruby">
<code>
hash3 = Hash.new
hash3 = hash3.merge({ "name" => "John Smith" })
puts hash3
</code>
</Editor>