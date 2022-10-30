Usually, we create an
array like this:

<Editor lang="ruby">
<code>
array = ["one", "two", "three", "four"]
puts array
</code>
</Editor>

We can also create an
array using `%w`.

<Editor lang="ruby">
<code>
array = %w(one two three four)
puts array
</code>
</Editor>

This version looks much cleaner.
However, if there is a
whitespace in the word,
then we need to put
a `\` to escape the whitespace.

<Editor lang="ruby">
<code>
array = %w(Colorado California New\ York)
puts array
</code>
</Editor>