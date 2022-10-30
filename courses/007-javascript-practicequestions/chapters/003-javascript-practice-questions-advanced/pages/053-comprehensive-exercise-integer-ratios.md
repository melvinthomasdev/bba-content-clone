Given a list of integers, calculate the ratios of its elements that are positive, negative, and zero.

1. Print decimal value with 4 digits.
2. Return stringified object.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const integerRatios = (arr) => {
  //your code here
};
</code>

<solution>
const integerRatios = (arr) => {
  let c1 = 0,
    c2 = 0,
    c3 = 0;
  arr.forEach((e) => {
    if (e > 0) c1 = c1 + 1;
    if (e < 0) c2 = c2 + 1;
    if (e == 0) c3 = c3 + 1;
  });
  c1 = (c1 / arr.length).toFixed(4);
  c2 = (c2 / arr.length).toFixed(4);
  c3 = (c3 / arr.length).toFixed(4);
  return JSON.stringify({ positive: c1, negative: c2, zero: c3 });
};
</solution>

<testcases>
<caller>
console.log(integerRatios(arr));
</caller>
<testcase>
<i>
const arr = [-4, 3, -9, 0, 4, 1];
</i>
</testcase>
<testcase>
<i>
const arr = [1,2,3,-1,-2,-3,0,0];
</i>
</testcase>
</testcases>
</Editor>