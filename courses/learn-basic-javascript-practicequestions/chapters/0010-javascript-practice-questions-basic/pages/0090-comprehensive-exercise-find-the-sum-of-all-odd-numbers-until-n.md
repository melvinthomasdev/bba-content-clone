Find the sum of all odd numbers from `1` to `n`.

1. Input will be the limit n.
2. Return the sum of all the odd numbers from `1` to `n`.
3. Do **NOT** use `do..while` or any other looping constructs. Use higher-order functions like `map`, `filter`, etc.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const sumOfOddNumbers = n => {
  // write your code here
  // Refer: https://stackoverflow.com/a/20066663
}
</code>

<solution>
// Refer: https://stackoverflow.com/a/20066663
const sumOfOddNumbers = n => {
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