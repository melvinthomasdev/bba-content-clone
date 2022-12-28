The function `accumulatingArray` should return an array of the accumulating sum.

1. Example: [1, 2, 3, 4] ➞ [1, 3, 6, 10]

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const accumulatingArray = arr => {
  // your code here
};
</code>

<solution>
const accumulatingArray = arr => {
  let prefixSum = 0;
  return JSON.stringify(arr.map((value) => (prefixSum += value)));
};
</solution>

<testcases>
<caller>
console.log(accumulatingArray(arr));
</caller>
<testcase>
<i>
const arr = [1, 0, 1, 0, 1];
</i>
</testcase>
<testcase>
<i>
const arr = [1, 5, 7];
</i>
</testcase>
<testcase>
<i>
const arr = [1, 2, 3, 4];
</i>
</testcase>
<testcase>
<i>
const arr = [];
</i>
</testcase>
</testcases>
</codeblock>