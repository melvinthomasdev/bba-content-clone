The function `splitByOddAndEven` should separate a single array into sub-arrays: one containing odd numbers, the other containing even numbers.

1. If array contains only even or odd, return the array. Eg. [1,3,5] -> [1,3,5]
2. Return stringified object.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const splitByOddAndEven = function(arr) {
  // your code here
};
</code>

<solution>
const splitByOddAndEven = function(arr) {
  const odd = arr.filter((number) => number % 2 === 1);
  const even = arr.filter((number) => number % 2 === 0);
  if (odd.length > 0 && even.length > 0) return JSON.stringify([even, odd]);
  if (even.length === 0) return JSON.stringify(odd);
  else return JSON.stringify(even);
};
</solution>

<testcases>
<caller>
console.log(splitByOddAndEven(arr));
</caller>
<testcase>
<i>
const arr = [2, 3, 7, 6, 2, 4, 9];
</i>
</testcase>
<testcase>
<i>
const arr = [12, 14, 17];
</i>
</testcase>
<testcase>
<i>
const arr = [10, 12, 6, 18];
</i>
</testcase>
<testcase>
<i>
const arr = [1, 5, 3, 2];
</i>
</testcase>
<testcase>
<i>
const arr = [1, 3];
</i>
</testcase>
</testcases>
</Editor>