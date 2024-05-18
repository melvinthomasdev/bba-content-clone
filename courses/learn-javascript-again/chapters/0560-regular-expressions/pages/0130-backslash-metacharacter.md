The backslash, `\`, serves as an escape character,
allowing us to use special characters
as normal character.

<codeblock language="javascript" type="lesson">
<code>
const regexBackslash = /\./; // Matches a literal dot
console.log(regexBackslash.test("hello.world")); // Output: true
</code>
</codeblock>

This code defines a regular expression
pattern `regexBackslash` which matches
a literal dot, `.`, in a string.
