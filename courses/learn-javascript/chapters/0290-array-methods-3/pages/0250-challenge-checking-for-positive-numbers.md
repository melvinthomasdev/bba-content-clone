Create a function `hasPositiveNumbers()` that takes an array of numbers as input and
returns **true** if the array contains at least one positive number, otherwise returns **false**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>

// Write your code here


// Do not delete the code below
const arraySet1 = [-1, -2, 3, -4, 5];
const arraySet2 = [-1, -2, -3, -4];

console.log(hasPositiveNumbers(arraySet1));
console.log(hasPositiveNumbers(arraySet2));
</code>
<solution>
const hasPositiveNumbers = numbers => numbers.some(num => num > 0);

// Do not delete the code below
const arraySet1 = [-1, -2, 3, -4, 5];
const arraySet2 = [-1, -2, -3, -4];

console.log(hasPositiveNumbers(arraySet1));
console.log(hasPositiveNumbers(arraySet2));
</solution>
</codeblock>
