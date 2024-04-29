The function **filterEvenNumbers** should accept an array
of numbers as input and return an array
containing only the **even numbers** from the original array.

For example:
```js
Input:
const numbers = [2, 5, 8, 3, 6, 9];

Output:
[2, 8, 6]
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function filterEvenNumbers(numbers) {
  // write your code here
}
</code>

<solution>
function filterEvenNumbers(numbers) {
  const evenNumbersArray = numbers.filter(number => number % 2 === 0);
  return evenNumbersArray;
}
</solution>

<testcases>
<caller>
console.log(filterEvenNumbers(numbers));
</caller>
<testcase>
<i>
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
</i>
</testcase>
<testcase>
<i>
const numbers = [2, 4, 6, 8, 10];
</i>
</testcase>
<testcase>
<i>
const numbers = [5, 4, 3, 2, 1];
</i>
</testcase>
<testcase>
<i>
const numbers = [2, 5, 8, 3, 6, 9];
</i>
</testcase>
</testcases>
</codeblock>
