Find the sum of all odd numbers from `1` to `n`.

- Input will be the limit `n`.
-  Return the sum of all the odd numbers from `1` to `n`.
-  `n` should **NOT** be included in the sum.
-  Do **NOT** use `do..while` or any other looping constructs.
Use higher-order functions like `map`, `filter`, etc.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const sumOfOddNumbers = n => {
  // Refer: https://stackoverflow.com/a/20066663
  // write your code here
}
</code>

<solution>
const sumOfOddNumbers = n => {
  // Refer: https://stackoverflow.com/a/20066663
  // write your code here
  const oddNumbersTillLimit = Array.apply(null, { length: n })
    .map(Number.call, num => Number(num))
    .filter(num => num % 2);
  return oddNumbersTillLimit.reduce((partialSum, num) => partialSum + num, 0);
}
</solution>

<testcases>
<caller>
console.log(sumOfOddNumbers(n));
</caller>
<testcase>
<i>
const n = 100;
</i>
</testcase>
<testcase>
<i>
const n = 34;
</i>
</testcase>
<testcase>
<i>
const n = 25;
</i>
</testcase>
<testcase>
<i>
const n = 159;
</i>
</testcase>
<testcase>
<i>
const n = 200;
</i>
</testcase>
<testcase>
<i>
const n = 10;
</i>
</testcase>
</testcases>
</codeblock>