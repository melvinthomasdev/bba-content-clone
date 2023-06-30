You are given an array of numbers.

Complete the function `getPositiveNumbers`
so that it takes in an array as an argument
and returns a new array containing only
the positive numbers.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function getPositiveNumbers(numbers) {
  // Write your code here
}
</code>
<solution>
function getPositiveNumbers(numbers) {
  const positiveNumbers = numbers.filter(number => number > 0);
  console.log(positiveNumbers);
}
</solution>
<testcases>
<caller>
getPositiveNumbers(testNumbers);
</caller>
<testcase>
<i>
const testNumbers = [-3, -2, 4, 6, -1, 0, 8];
</i>
</testcase>
<testcase>
<i>
const testNumbers = [7, 8, -1, 0, 2, -6, 5];
</i>
</testcase>
<testcase>
<i>
const testNumbers = [-9, -22, 0, -4, -5, 0];
</i>
</testcase>
</testcases>
</codeblock>
