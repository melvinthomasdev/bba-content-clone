We are given an array of numbers.
Checks if all numbers in the array
are positive and log the output
to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const numberArray = [-1, 2, 3, 4, 5];

// Write code below

</code>
<solution>
const numberArray = [-1, 2, 3, 4, 5];

// Write code below
const areAllPositive = numberArray.every(num => num > 0)
console.log(areAllPositive);
</solution>
</codeblock>
