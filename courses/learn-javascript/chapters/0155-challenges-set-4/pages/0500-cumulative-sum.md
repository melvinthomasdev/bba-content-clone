Complete the JavaScript function to return an array containing the cumulative sum of the values in a given input array.

For example:

```text
Input: arr = [ 10, 20, 40 ]

Output: [ 10, 30, 70 ]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const cumulativeSum = arr => {
  // write your code here
}
</code>

<solution>
  const cumulativeSum = arr => arr.map((sum => value => sum += value)(0));
</solution>

<testcases>
<caller>
console.log(cumulativeSum(arr));
</caller>
<testcase>
<i>
const arr = [5, 10, 3, 2];
</i>
</testcase>
<testcase>
<i>
const arr = [1, 0, 1, 2];
</i>
</testcase>
</testcases>
</codeblock>
