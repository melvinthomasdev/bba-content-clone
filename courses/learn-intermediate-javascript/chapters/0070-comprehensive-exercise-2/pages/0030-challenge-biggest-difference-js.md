Write a function `findBiggestDifference` that takes an array of integers as input and returns the largest difference between any two adjacent elements.

Use the given array to test your code:
`[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code here
</code>
<solution>
const array = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];

function findBiggestDifference(inputArray) {
  let biggestDifference = -Infinity;
  for (let i = 0; i < inputArray.length - 1; i++) {
    let difference = Math.abs(inputArray[i] - inputArray[i+1]);
    if (difference > biggestDifference) {
      biggestDifference = difference;
    }
  }
  return biggestDifference;
};

findBiggestDifference(array);
</solution>
<testcases>
<caller>
console.log(findBiggestDifference(testArray));
</caller>
<testcase>
<i>
const testArray = [9, 6, 4];
</i>
</testcase>
<testcase>
<i>
const testArray = [46, 52, 19, 72, 21];
</i>
</testcase>
<testcase>
<i>
const testArray = [42, 30, 85, 63, 74, 19];
</i>
</testcase>
<testcase>
<i>
const testArray = [55, 30, 91, 40, 76, 63];
</i>
</testcase>
</testcases>
</codeblock>
