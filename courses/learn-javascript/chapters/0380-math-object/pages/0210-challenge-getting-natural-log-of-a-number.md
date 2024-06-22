Create a function `calculateNaturalLog` such that,
 1. It accepts an array of numbers as its parameter.
 2. It checks if all elements in the array are positive.
 3. If any element is zero or negative, returns the string **Input array must contain only positive numbers.**.
 4. If all elements are positive, it returns an array of their natural logarithms.

For example,
```js
Input:
[1, 10, 100]

Output:
[0, 1, 2.302585092994046, 4.605170185988092]


Input:
[-1, 2, 3]

Output:
"Input array must contain only positive numbers"

```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const inputArray1 = [13, -21, 33];
const inputArray2 = [5, 50, 500];
const inputArray3 = [1000, 10000];

// Write code below this line



// Do NOT delete the below code
console.log(calculateNaturalLog(inputArray1));
console.log(calculateNaturalLog(inputArray2));
console.log(calculateNaturalLog(inputArray3));
</code>
<solution>
const inputArray1 = [1, -2, 3];
const inputArray2 = [5, 50, 500];
const inputArray3 = [1000, 10000];

// Write code below this line
const calculateNaturalLog = (numbers) => {
  const isAllPositive = numbers.every(number => number >= 0);
  return isAllPositive ? numbers.map(number => Math.log(number)) : "Input array must contain only positive numbers.";
};

console.log(calculateNaturalLog(inputArray1));
console.log(calculateNaturalLog(inputArray2));
console.log(calculateNaturalLog(inputArray3));
</solution>
</codeblock>
