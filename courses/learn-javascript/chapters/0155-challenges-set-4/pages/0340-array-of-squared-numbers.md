The function **squaredNumbers** should accept an array of numbers
as input and returns a new array with each number **squared**.
If the array is empty, it returns 0.

For example:
```js
Input: numbers = [2, 3, 6, 8]

Output: [4, 9, 36, 64]
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function squaredNumbers(numbers) {
  // write your code here
}
</code>

<solution>
function squaredNumbers(numbers) {
  return numbers.length ? numbers.map((num) => num ** 2) : 0;
}
</solution>

<testcases>
<caller>
console.log(squaredNumbers(numbers));
</caller>
<testcase>
<i>
const numbers = [1, 2, 3, 4, 5];
</i>
</testcase>
<testcase>
<i>
const numbers = [];
</i>
</testcase>
<testcase>
<i>
const numbers = [5, 4, 3, 2, 1];
</i>
</testcase>
<testcase>
<i>
const numbers = [10, 20, 30, 40, 50];
</i>
</testcase>
</testcases>
</codeblock>
