Write a function `containsDigit()`
that takes a string as input
and
returns **true** if the string
contains at least one digit,
otherwise **false**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write code below

console.log(containsDigit('Hello123World'));
console.log(containsDigit('abc'));
console.log(containsDigit(''));
</code>
<solution>
// Write code below
const containsDigit = (str) => {
  const regex = /\d/;
  return regex.test(str);
};

console.log(containsDigit('Hello123World'));
console.log(containsDigit('abc'));
console.log(containsDigit(''));
</solution>
</codeblock>
