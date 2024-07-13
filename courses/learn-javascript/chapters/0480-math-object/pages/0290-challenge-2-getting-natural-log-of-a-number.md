Create a function `calculateLogarithmicTransformations` such that,
  1. It accepts an array of positive numbers as its parameter.
  2. It first calculate the natural logarithm of each number in the input array and store these values in a new array.
  3. It then calculates the natural logarithm of each value in this new array created in the previous step and store these values in another array.
  4. Display an object containing both arrays to the console. The object should have the following structure,
	  - originalLogArray: An array of natural logarithms of the original input array.
	  - doubleLogArray: An array of natural logarithms of the values in firstLogArray.
  5. If the input array contains zero or negative numbers, the function should display the message **Input array must contain only positive numbers**.  

For example,
```js
Input:
inputArray = [5, 50, 500]

Output:
{
  originalLogArray: [1.6094379124341003, 3.912023005428146, 6.214608098422191],
  doubleLogArray: [0.4746870283290895, 1.3665129205816647, 1.8266887505226024]
}
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const inputArray1 = [1, -2, 3];
const inputArray2 = [2, 5, 20];

// Write code below this line


console.log(calculateLogarithmicTransformations(inputArray1));
console.log(calculateLogarithmicTransformations(inputArray2));
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
