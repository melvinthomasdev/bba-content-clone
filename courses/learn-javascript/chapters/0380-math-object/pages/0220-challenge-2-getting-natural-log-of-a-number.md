Write a function `calculateLogarithmicTransformations`
that takes an array of positive numbers as input.

Calculate the natural logarithm of
each number in the array
and
store these in an array.

Then, calculate the natural logarithm
of the values in the array created
in the above step.

Display an object with both arrays
to the console.

For example
```js
Input:
inputArray = [5, 50, 500]

Output:
{
  originalLogArray: [1.6094379124341003, 3.912023005428146, 6.214608098422191],
  doubleLogArray: [0.4746870283290895, 1.3665129205816647, 1.8266887505226024]
}
```

If the input array contains any non-positive numbers,
the function should display a message:
`Input array must contain only positive numbers.`

Use the provided arrays to test your code.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const inputArray1 = [1, -2, 3];
const inputArray2 = [2, 5, 20];

// Write code below this line
</code>
<solution>
const inputArray1 = [1, -2, 3];
const inputArray2 = [2, 5, 20];

// Write code below this line

const calculateLogarithmicTransformations = (numbers) => {
  if (!numbers.every(number => number > 0)) {
    return "Input array must contain only positive numbers";
  }

  const originalLogs = numbers.map(number => Math.log(number));
  const doubleLogs = originalLogs.map(log => Math.log(log));

  return {
    originalLogs,
    doubleLogs
  };
};

console.log(calculateLogarithmicTransformations(inputArray1));
console.log(calculateLogarithmicTransformations(inputArray2));
</solution>
</codeblock>
