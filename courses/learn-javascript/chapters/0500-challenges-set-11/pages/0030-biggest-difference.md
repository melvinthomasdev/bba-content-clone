Write a function `findBiggestDifference` that takes an array of integers as input and returns the largest difference between any two adjacent elements.

For example:
```js
Input: [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]

Output: 7
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code here
</code>
<solution>
const findBiggestDifference = (inputArray) => {
  const biggestDifference = inputArray.slice(1).reduce((maxDifference, currentElement) => {
    const difference = Math.abs(currentElement - inputArray[inputArray.indexOf(currentElement) - 1]);
    return difference > maxDifference ? difference : maxDifference;
  }, -Infinity);

  return biggestDifference;
};
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
