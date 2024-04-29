Convert the given 2D array of numbers to an array of sums by replacing each nested array with its sum.

1. Input will be a 2D array that has another array at each index.
2. The inner array will contain numbers only.
3. Calculate the sum of numbers in each nested array.
4. Return an array that has the sum of elements of the nested array at the same index.

For example:
```js
Input:
const list = [[19, 12], [34, 545, 65, 654], [43, 98, 90]];

Output:
[31, 1298, 231]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const sum = list =>
  // write your code here
</code>

<solution>
const sum = list =>
  list.map(numbers => numbers.reduce((sum, number) => sum + number, 0));
</solution>

<testcases>
<caller>
console.log(sum(list));
</caller>
<testcase>
<i>
const list = [[3, 4], [10, 20], [12, 13], [14, 17], [19, 20]];
</i>
</testcase>
<testcase>
<i>
const list = [[9, 2, 12], [12, 233, 98, 87], [65, 43, 12, 13], [87, 114, 179, 786], [234, 34, 19, 20]];
</i>
</testcase>
<testcase>
<i>
const list = [[19, 12], [34, 545, 65, 654], [43, 98, 90]];
</i>
</testcase>
<testcase>
<i>
const list = [[19, 12], [34, 545, 65, 654], [43, 98, 90], []];
</i>
</testcase>
</testcases>
</codeblock>
