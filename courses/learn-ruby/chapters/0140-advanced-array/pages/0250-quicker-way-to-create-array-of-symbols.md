Creating long arrays can become
cumbersome, where you have to type
multiple commas, the quotation marks in case of
strings, the colons in case of symbols.

Ruby gives us simpler ways to create
arrays. For creating an array of
symbols, use `%i`:

<codeblock language="ruby" type="lesson">
<code>
array_of_symbols = %i[green red blue]
</code>
</codeblock>