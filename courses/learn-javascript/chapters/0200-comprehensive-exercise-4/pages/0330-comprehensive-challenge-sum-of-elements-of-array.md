The function **calculateSum** should calculate
the sum of all elements in an array of numbers
and return the result. If the array is empty,
it returns 0.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function calculateSum(numbers) {
  // write your code here
}
</code>

<solution>
function calculateSum(numbers) {
  let sum = 0;

  numbers.forEach(function (number) {
    sum += number;
  });

  return sum;
}
</solution>

<testcases>
<caller>
console.log(calculateSum(numbersArray));
</caller>
<testcase>
<i>
const numbersArray = [1, 2, 3, 4, 5];
</i>
</testcase>
<testcase>
<i>
const numbersArray = [];
</i>
</testcase>
<testcase>
<i>
const numbersArray = [2.5, 1.8, 3.7, 4.2, 5.1];
</i>
</testcase>
<testcase>
<i>
const numbersArray = [1000000, 2000000, 3000000, 4000000, 5000000];
</i>
</testcase>
</testcases>
</codeblock>
