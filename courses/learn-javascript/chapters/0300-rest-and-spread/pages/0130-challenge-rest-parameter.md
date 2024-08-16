In the challenge given below,
modify the function `calculateSum`
to accept any number of arguments,
and
return the sum of all the arguments
instead of just the first two arguments.

Use the `reduce` method to find
the sum of the array of arguments.

```js
Input: 50 , 100, 120

Output: 270
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const calculateSum = (number1, number2) => number1 + number2

const sum = calculateSum(84, 69, 43, 97);
console.log(sum);
</code>

<solution>
const calculateSum = (...numbers) =>
  numbers.reduce((partialSum, number) => partialSum + number, 0);

const sum = calculateSum(84, 69, 43, 97);
console.log(sum);
</solution>
</codeblock>
