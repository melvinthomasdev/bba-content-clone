The function `orderBySum` should convert the array of arrays that contain only numeric values by the ascending order of the sum of the elements within each subarray.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const orderBySum = arr => {
  // your code here
};
</code>

<solution>
const findSum = arr => arr.reduce((sum, value) => sum + value);

const orderBySum = arr => [...arr].sort((a,b) => findSum(a) - findSum(b));
</solution>

<testcases>
<caller>
console.log(orderBySum(arr));
</caller>
<testcase>
<i>
const arr = [[11,13], [4,12], [2,1]];
</i>
</testcase>
<testcase>
<i>
const arr = [[1,7], [11,10], [2,1]];
</i>
</testcase>
<testcase>
<i>
const arr = [[14,5], [5,10], [8,9]];
</i>
</testcase>
<testcase>
<i>
const arr = [[20, 15], [15,12], [18, 29]];
</i>
</testcase>
</testcases>
</codeblock>