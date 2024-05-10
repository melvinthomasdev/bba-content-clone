Parentheses, `()`, groups elements together,
allowing us to check multiple characters.

<codeblock language="javascript" type="lesson">
<code>
const regexGrouping = /(.)/;
console.log(regexGrouping.test("abab")); // Output: true
console.log(regexGrouping.test("ab")); // Output: true
</code>
</codeblock>

This code defines a regular expression
pattern `regexGrouping` which matches any
single character in a string.

`console.log(regexGrouping.test("abab"))`
returns **true** because the string `abab`
contains multiple single characters,
each of which matches the pattern.

Similarly, `console.log(regexGrouping.test("ab"))`
returns **true** because the string `ab` contains two single characters, each of which matches the pattern.
