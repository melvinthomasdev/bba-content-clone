The dot character, `.`, matches any single character
except newline characters.

<codeblock language="javascript" type="lesson">
<code>
const regexDot = /h.t/;
console.log(regexDot.test("hat")); // Output: true
console.log(regexDot.test("hot")); // Output: true
console.log(regexDot.test("hit")); // Output: true
</code>
</codeblock>

This code defines a regular expression
pattern `regexDot` which matches strings
where there is a letter `h`,
followed by any single character, represented by the dot,
and
then followed by the letter `t`.

The `test()` method of a regular expression
checks whether the specified string
matches the regular expression pattern.
