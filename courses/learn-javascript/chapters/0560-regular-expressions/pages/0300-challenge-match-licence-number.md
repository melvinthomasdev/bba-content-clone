Write a regular expression to match
license plate numbers consisting of
three uppercase letters followed by
three digits.

Test the regular expression against
sample license plate numbers to ensure
it matches correctly.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write code below this line

console.log(regex.test('ABC123'));
console.log(regex.test('123ABC'));
console.log(regex.test('XYZ789'));
console.log(regex.test('DEF4567'));
</code>
<solution>
// Write code below this line
const regex = /^[A-Z][A-Z][A-Z][0-9][0-9][0-9]$/;

console.log(regex.test('ABC123'));
console.log(regex.test('123ABC'));
console.log(regex.test('XYZ789'));
console.log(regex.test('DEF4567'));
</solution>
</codeblock>
