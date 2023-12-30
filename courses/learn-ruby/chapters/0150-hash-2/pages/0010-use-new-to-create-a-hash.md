So far, we have seen a hash
being created like this:

<codeblock language="ruby" type="lesson">
<code>
hash = { name: "John Smith" }
puts hash
</code>
</codeblock>

There is another way to create a hash
using `new`:

<codeblock language="ruby" type="lesson">
<code>
hash2 = Hash.new
puts hash2
</code>
</codeblock>

`Hash.new` creates an empty hash.
To this empty hash, we need to
add key and value, as shown below:

<codeblock language="ruby" type="lesson">
<code>
hash3 = Hash.new
hash3 = hash3.merge({ name: "John Smith" })
puts hash3
</code>
</codeblock>
