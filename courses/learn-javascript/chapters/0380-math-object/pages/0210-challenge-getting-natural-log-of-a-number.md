Write a function `calculateNaturalLog`
that takes an array of positive numbers
as input
and
displays an array of their natural
logarithms to the console.

Use the provided arrays to test
your function.
If the provided array contains **0**
or a negative number, display the following:
`Input array must contain only positive numbers`

For example
```js
Input:
[1, 10, 100]

Output:
[0, 1, 2.302585092994046, 4.605170185988092]
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const inputArray1 = [1, -2, 3];
const inputArray2 = [5, 50, 500];
const inputArray3 = [1000, 10000];

// Write code below this line
</code>
<solution>
const inputArray1 = [1, -2, 3];
const inputArray2 = [5, 50, 500];
const inputArray3 = [1000, 10000];

// Write code below this line
const calculateNaturalLog = (numbers) => {
  const isAllPositive = numbers.every(number => number >= 0);
  return isAllPositive ? numbers.map(number => Math.log(number)) : "Input array must contain only positive numbers";
};

console.log(calculateNaturalLog(inputArray1));
console.log(calculateNaturalLog(inputArray2));
console.log(calculateNaturalLog(inputArray3));
</solution>
</codeblock>
