Given an array, flatten the array.

For example:
```js
Input:
const arr = [1, [2]];

Output:
[1, 2]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const flattenArray = arr => {
  // your code here
};
</code>

<solution>
const flattenArray = arr => [].concat(...arr);
</solution>

<testcases>
<caller>
console.log(flattenArray(arr));
</caller>
<testcase>
<i>
const arr = [
  ["$6"],
  ["$12"],
  ["$25"],
  ["$25"],
  ["$18"],
  ["$22"],
  ["$10"]
];
</i>
</testcase>
<testcase>
<i>
const arr  = [
  [5, 1],
  [6],
  [2],
  [8]
];
</i>
</testcase>
<testcase>
<i>
const arr  = [1, [2], [3, [[4]]]];
</i>
</testcase>
<testcase>
<i>
const arr  = [1, [2]];
</i>
</testcase>
</testcases>
</codeblock>
