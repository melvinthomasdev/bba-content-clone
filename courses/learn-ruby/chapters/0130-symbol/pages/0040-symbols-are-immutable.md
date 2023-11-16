Symbols are immutable.
It means that once a symbol has been created it can't be changed.
We can't append anything to a symbol.

The below code will throw an error as we are trying to modify the 
symbol `:hello`.

<codeblock language="ruby" type="lesson">
<code>
puts :hello << "world"
</code>
</codeblock>

