The pipe, `|`, allows us to
match one of several patterns
defined within `/.../`.

<codeblock language="javascript" type="lesson">
<code>
const regexPipe = /cat|dog/;

console.log(regexPipe.test("cat")); // Output: true
console.log(regexPipe.test("dog")); // Output: true
console.log(regexPipe.test("bird")); // Output: false
</code>
</codeblock>

This code defines a regular expression pattern
`regexPipe` which matches either `cat` or
`dog` in a string.
