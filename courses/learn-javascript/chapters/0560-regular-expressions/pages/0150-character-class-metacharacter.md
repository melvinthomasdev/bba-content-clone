The square brackets, `[]`, match a
single character from a set of characters
defined within the brackets.

<codeblock language="javascript" type="lesson">
<code>
const regex = /[aeiou]/; // Matches any vowel
console.log(regex.test("apple")); // Output: true
console.log(regex.test("banana")); // Output: true
</code>
</codeblock>

This code defines a regular expression pattern
regex which matches any vowel - a, e, i, o, or u
in a string.
