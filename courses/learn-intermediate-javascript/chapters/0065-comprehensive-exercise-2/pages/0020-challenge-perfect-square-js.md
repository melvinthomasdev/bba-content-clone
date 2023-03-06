Write a function `findPerfectSquare` that takes the given number as input and returns true if the number is a perfect square, and false otherwise.

Note: A perfect square is a number that can be expressed as the product of an integer with itself (e.g. 4 = 2 * 2, 9 = 3 * 3, 16 = 4 * 4, etc.).

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const givenNumber = 81;
// Write code here
</code>
<solution>
const givenNumber = 81;
function findPerfectSquare(n) {
  let isPerfectSquare = Math.sqrt(n) % 1 === 0 ? "true" : "false";
  return isPerfectSquare;
}
findPerfectSquare(givenNumber);
</solution>
<testcases>
<caller>
console.log(findPerfectSquare(testNumber));
</caller>
<testcase>
<i>
const testNumber = 16;
</i>
</testcase>
<testcase>
<i>
const testNumber = 82;
</i>
</testcase>
<testcase>
<i>
const testNumber = 91;
</i>
</testcase>
<testcase>
<i>
const testNumber = 25;
</i>
</testcase>
</testcases>
</codeblock>
