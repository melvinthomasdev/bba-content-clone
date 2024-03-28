We have the scores of math
test obtained by `Sam`, `Eve`,
`Renu`
and `Lao` in an array.

Implement a function, `calculateMinimum`,
which takes this array as an argument
and
finds the minimum value.

Create a detailed output that includes
the the minimum value,
and
the index of the minimum value in the array
and log it to the console.
Expected output:

`The minimum value is [minimumValue] at index [Index].`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const scores = [65, 40, 80, 72];

// Write code below this line

</code>
<solution>
const scores = [40, 65, 72, 80];

// Write code below this line
const calculateMinimum = (array) => {
  return Math.min(...array);
};

let result = calculateMinimum(scores);

let minIndex = scores.indexOf(result);
console.log(`The minimum value is ${result} at index ${minIndex}.`);
</solution>
</codeblock>
