The function **extractPositiveNumbers** should
accept an array of numbers as input and
returns a new array containing only the positive numbers.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function extractPositiveNumbers(numbers) {
  // write your code here
}
</code>

<solution>
function extractPositiveNumbers(numbers) {
  const positiveNumbers = [];

  numbers.forEach(number => {
    if (number > 0) {
    positiveNumbers.push(number);
    }
  });

  return positiveNumbers;
}
</solution>

<testcases>
<caller>
console.log(extractPositiveNumbers(numbers));
</caller>
<testcase>
<i>
const numbers = [1, -2, 3, -4, 5, -6];
</i>
</testcase>
<testcase>
<i>
const numbers = [-11, -12, -13, -14];
</i>
</testcase>
<testcase>
<i>
const numbers = [2, -3, 0, 5, -7, 8];
</i>
</testcase>
<testcase>
<i>
const numbers = [7, 8, 9, 10];
</i>
</testcase>
</testcases>
</codeblock>
