Usually, we create an
array like this:

<codeblock language="ruby" type="lesson">
<code>
array = ["one", "two", "three", "four"]
puts array
</code>
</codeblock>

We can also create an
array using `%w`.

<codeblock language="ruby" type="lesson">
<code>
array = %w(one two three four)
puts array
</code>
</codeblock>

This version looks much cleaner.
However, if there is a
whitespace in the word,
then we need to put
a `\` to escape the whitespace.

<codeblock language="ruby" type="lesson">
<code>
array = %w(Colorado California New\ York)
puts array
</code>
</codeblock>