Complete the JavaScript function to merge two sorted arrays into a single sorted array.

For example:

```text
Input: arr1 = [1, 5, 3], arr2 = [4, 2, 6];

Output: [1, 2, 3, 4, 5, 6]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const mergeSortedArrays = (arr1, arr2) => {
  // Write your code here
}
</code>

<solution>
const mergeSortedArrays = (arr1, arr2) =>
  [...arr1, ...arr2].sort((a, b) => a - b);

</solution>

<testcases>
<caller>
console.log(mergeSortedArrays(arr1, arr2));
</caller>
<testcase>
<i>
const arr1 = [1, 3, 5, 7];
const arr2 = [2, 4, 6, 8];
</i>
</testcase>
<testcase>
<i>
const arr1 = [1, 0, 5, 7];
const arr2 = [0, 0];
</i>
</testcase>
</testcases>
</codeblock>
