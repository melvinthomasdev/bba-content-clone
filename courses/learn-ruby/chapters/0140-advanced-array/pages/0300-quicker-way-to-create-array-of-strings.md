Creating long arrays can become
cumbersome, where you have to type
multiple comma and quotation marks.

Ruby gives us simpler ways to create
arrays. For creating an array of
strings, use `%w`:

<codeblock language="ruby" type="lesson">
<code>
array_of_strings = %w[green red blue]

puts array_of_strings

</code>
</codeblock>

This looks much cleaner. However, if there is a whitespace in the word, then we need to put a `\` to escape the whitespace.

<codeblock language="ruby" type="lesson">
<code>
array = %w(Colorado California New\ York)

puts array

</code>
</codeblock>
