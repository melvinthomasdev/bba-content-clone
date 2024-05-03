Regular expressions also commonly
known as `regex` or `regexp`,
are sequences of characters that
define a search pattern.

They are used to match patterns
within strings and are invaluable
tools for text processing
and
manipulation.

Let's consider a simple example
where we want to check if a string
contains the word `hello`.

<codeblock language="javascript" type="lesson">
<code>
const text = "Hello, world!";
const regex = /hello/i;
console.log(regex.test(text));
// Output: true
</code>
</codeblock>
