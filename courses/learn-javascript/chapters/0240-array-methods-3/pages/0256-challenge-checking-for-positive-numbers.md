Write a function `hasPositiveNumbers()`
that takes an array of numbers as input
and
returns **true** if the array contains
at least one positive number, otherwise
returns **false**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const array1 = [-1, -2, 3, -4, 5];
const array2 = [-1, -2, -3, -4];

// Write code below this line

console.log(hasPositiveNumbers(array1));
console.log(hasPositiveNumbers(array2));
</code>
<solution>
const array1 = [-1, -2, 3, -4, 5];
const array2 = [-1, -2, -3, -4];

// Write code below this line
const hasPositiveNumbers = (numbers) => {
  return numbers.some(num => num > 0);
}

console.log(hasPositiveNumbers(array1));
console.log(hasPositiveNumbers(array2));
</solution>
</codeblock>
