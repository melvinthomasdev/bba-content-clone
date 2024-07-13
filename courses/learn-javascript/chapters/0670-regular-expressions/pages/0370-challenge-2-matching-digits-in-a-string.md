Create a function called `extractDigits`
that takes a string as input and returns
an array of all the digit characters found
in the string.

If no digits are found, the function should
return an empty array.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write code below

console.log(extractDigits("Hello123World"));
console.log(extractDigits("NoDigitsHere"));
console.log(extractDigits("2021 is the year!"));
</code>
<solution>
// Write code below
const extractDigits = (inputString) => {
  const regex = /\d+/;
  const matches = inputString.match(regex);
  return matches ? matches : [];
};

console.log(extractDigits("Hello123World"));
console.log(extractDigits("NoDigitsHere"));
console.log(extractDigits("2021 is the year!"));
</solution>
</codeblock>
