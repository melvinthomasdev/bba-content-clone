The caret, `^`, matches the word at
the start of a line or string.

<codeblock language="javascript" type="lesson">
<code>
const regexCaret = /^world/;
console.log(regexCaret.test("hello world")); // Output: false
console.log(regexCaret.test("world hello")); // Output: true
</code>
</codeblock>

This code defines a regular expression
pattern `regexCaret` which matches strings
that start with the word `world`.
