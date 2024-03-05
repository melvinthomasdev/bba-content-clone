Given a list of integers, calculate the ratios of its elements that are positive, negative, and zero.

1. Print decimal value with 4 digits.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const integerRatios = arr => {
  //your code here
};
</code>

<solution>
const integerRatios = arr => {
  let positives = 0,
    negatives = 0,
    zeros = 0;
  arr.forEach(e => {
    if (e > 0) positives++;
    if (e < 0) negatives++;
    if (e === 0) zeros++;
  });
  const positivesRatio = (positives / arr.length).toFixed(4);
  const negativesRatio = (negatives / arr.length).toFixed(4);
  const zerosRatio = (zeros / arr.length).toFixed(4);
  return ({
    positive: positivesRatio,
    negative: negativesRatio,
    zero: zerosRatio,
  });
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
<testcase>
<i>
const arr = [-2, 4, -6, 2, 1, -5, 0, 0];
</i>
</testcase>
<testcase>
<i>
const arr = [4, -5, 6, -4, 0, 8, 0, -3];
</i>
</testcase>
</testcases>
</codeblock>
