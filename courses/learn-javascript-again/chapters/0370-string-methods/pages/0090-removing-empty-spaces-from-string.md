The `trim()` method
removes empty spaces
from the beginning
and
the end of a string,
also known as
**trailing spaces**.

<codeblock language="javascript" type="lesson">
<code>
const message = "    Hello World!    ";
console.log(message.trim());
</code>
</codeblock><codeblock language="javascript" type="lesson">
<code>
const message = "    Hello World!";
console.log(message.trim());
</code>
</codeblock><codeblock language="javascript" type="lesson">
<code>
const message = "Hello World!    ";
console.log(message.trim());
</code>
</codeblock><codeblock language="javascript" type="lesson">
<code>
const message = "Hello     World!    ";
console.log(message.trim());
</code>
</codeblock><codeblock language="javascript" type="lesson">
<code>
const message = "Hello       World!";
console.log(message.trim());
</code>
</codeblock><codeblock language="javascript" type="lesson">
<code>
const message = "Hello       World     !";
console.log(message.trim());
</code>
</codeblock>