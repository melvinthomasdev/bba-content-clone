Array has a method `join` which
converts the contents of an
array into a String.

Run the code below and you will
see the result as `ice creamchocolatemovies`.
This does not look right.
Scroll down to see the right solution.

<codeblock language="ruby" type="lesson">
<code>
things_i_like = ["ice cream", "chocolate", "movies"]

puts things_i_like.join
</code>
</codeblock>

In order to fix the issue
with `join`, we need to tell
`join` to add spaces between the words
as shown below:

<codeblock language="ruby" type="lesson">
<code>
things_i_like = ["ice cream", "chocolate","movies"]

puts things_i_like.join(" ")
</code>
</codeblock>