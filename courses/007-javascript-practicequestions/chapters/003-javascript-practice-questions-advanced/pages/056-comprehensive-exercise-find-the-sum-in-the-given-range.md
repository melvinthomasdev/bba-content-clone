The function `rangeSum` should return the sum of all the numbers between and including the range given in an array.

1. Return stringified object.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const rangeSum = (arr) => {
  // your code here
}
</code>

<solution>
const rangeSum = (arr) => {
  arr.sort((x, y) => x - y);
  let elem1 = arr[0];
  const elem2 = arr[1];
  let sum = 0;
  for (elem1; elem1 <= elem2; ++elem1) sum += elem1;
  return sum;
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
</Editor>