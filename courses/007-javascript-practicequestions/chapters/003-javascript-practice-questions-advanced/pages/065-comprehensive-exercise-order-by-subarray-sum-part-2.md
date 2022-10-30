The function `orderBySum` should convert the array of arrays which contain only numeric values by the `descending order` of the sum of the elements within each subarray.

- Return stringified object.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const orderBySum = (arr) => {
  // your code here
};
</code>

<solution>
const findSum = (item) => item.reduce((acc, s) => acc + s);
const orderBySum = (arr) => JSON.stringify(arr.sort((a,b) => findSum(b) - findSum(a)));
</solution>

<testcases>
<caller>
console.log(orderBySum(arr));
</caller>
<testcase>
<i>
const arr = [[1,3], [4,2], [2,1]];
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
</testcases>
</Editor>