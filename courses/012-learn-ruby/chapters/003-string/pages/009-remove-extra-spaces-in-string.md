Ruby provides `strip` method
to remove extra spaces
from the start and from the end of a string.
Run the code and you will
see extra spaces at the front and the end.

<Editor lang="ruby">
<code>
puts "   John   "
</code>
</Editor>

We can remove this extra space
by using `strip`:

<Editor lang="ruby">
<code>
name = "   John   ".strip
puts name
</code>
</Editor>