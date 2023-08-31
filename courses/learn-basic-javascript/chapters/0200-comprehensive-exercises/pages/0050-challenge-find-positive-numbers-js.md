Update the function `getPositiveNumbers`
to accept an array of numbers as an
argument
and
display to the console,
a new array containing only
the positive numbers, including zero.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function getPositiveNumbers(numbers) {
  // Write your code here
}
</code>
<solution>
function getPositiveNumbers(numbers) {
  const positiveNumbers = numbers.filter(number => number >= 0);
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
