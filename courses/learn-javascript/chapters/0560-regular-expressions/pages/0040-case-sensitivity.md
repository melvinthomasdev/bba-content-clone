Regular expressions are case sensitive by default, meaning that uppercase and lowercase letters are treated as different characters.

<codeblock language="javascript" type="lesson">
<code>
const text = "Hello, world!";
const regex = /hello/;
console.log(regex.test(text));
</code>
</codeblock>

However, we can modify this behavior to
perform a match irrespective of the case
if needed.

To perform a case-insensitive match,
we can use the `i` flag.

<codeblock language="javascript" type="lesson">
<code>
const text = "Hello, world!";
const regex = /hello/i;
console.log(regex.test(text));
</code>
</codeblock>
