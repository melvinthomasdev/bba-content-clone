The function `rangeSum` should return the sum of all the numbers between and including the range given in an array.

1. Return stringified object.

For example:
```js
Input:
const arr = [2,10];

Output:
"54"
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const rangeSum = arr => {
  // your code here
}
</code>

<solution>
// Refer: https://stackoverflow.com/a/20066663

const rangeSum = arr => {
  const sortedArray = [...arr].sort((a, b) => a - b);
  const start = sortedArray[0];
  const end = sortedArray[1];
  const iterations = end - start + 1;
  return Array.apply(null, { length: iterations })
    .map(Number.call, Number)
    .map(num => num + start)
    .reduce((sum, currentValue) => sum + currentValue, 0);
};
</solution>

<testcases>
<caller>
console.log(rangeSum(arr));
</caller>
<testcase>
<i>
const arr = [10,2];
</i>
</testcase>
<testcase>
<i>
const arr = [2,10];
</i>
</testcase>
<testcase>
<i>
const arr = [1,5];
</i>
</testcase>
<testcase>
<i>
const arr = [5,1];
</i>
</testcase>
</testcases>
</codeblock>
