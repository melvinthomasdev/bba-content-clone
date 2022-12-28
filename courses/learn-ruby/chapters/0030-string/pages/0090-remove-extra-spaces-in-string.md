Ruby provides `strip` method
to remove extra spaces
from the start and from the end of a string.
Run the code and you will
see extra spaces at the front and the end.

<codeblock language="ruby" type="lesson">
<code>
puts "   John   "
</code>
</codeblock>

We can remove this extra space
by using `strip`:

<codeblock language="ruby" type="lesson">
<code>
name = "   John   ".strip
puts name
</code>
</codeblock>