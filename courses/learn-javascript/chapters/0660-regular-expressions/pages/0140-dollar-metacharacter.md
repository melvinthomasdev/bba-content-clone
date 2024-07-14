The dollar sign, `$`, matches the word at
the end of a line or string.

<codeblock language="javascript" type="lesson">
<code>
const regexDollar = /world$/;
console.log(regexDollar.test("hello world")); // Output: true
console.log(regexDollar.test("world hello")); // Output: false
</code>
</codeblock>

This code defines a regular expression
pattern `regexDollar` which matches strings
that end with the word `world`.
