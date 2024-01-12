The function **findSecondLargest** should accept an array
of numbers as input and determine the
**second largest** value in the array.
If the array has less than two elements,
it should return **null**.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function findSecondLargest(arr) {
  // write your code here
}
</code>

<solution>
function findSecondLargest(arr) {
  if (arr.length < 2) {
    return null;
  }

  let largest = arr[0];
  let secondLargest = arr[1];

  arr.forEach(number => {
    if (number > largest) {
      secondLargest = largest;
      largest = number;
    } else if (number > secondLargest && number < largest) {
      secondLargest = number;
    }
  });

  return secondLargest;
};
</solution>

<testcases>
<caller>
console.log(findSecondLargest(arr));
</caller>
<testcase>
<i>
const arr = [1, -2, 3, -4, 5, -6];
</i>
</testcase>
<testcase>
<i>
const arr = [100];
</i>
</testcase>
<testcase>
<i>
const arr = [-11, -12, -13, -14];
</i>
</testcase>
<testcase>
<i>
const arr = [2, -3, 0, 5, -7, 8];
</i>
</testcase>
<testcase>
<i>
const arr = [7, 8, 9, 10];
</i>
</testcase>
</testcases>
</codeblock>
