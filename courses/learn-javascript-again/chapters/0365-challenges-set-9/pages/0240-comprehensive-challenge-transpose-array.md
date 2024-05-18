Complete the JavaScript function to transpose a two dimensional array.

For example:

```text
Input: arr = [
    [10, 20, 30, 40],
    [50, 60, 70, 80],
    [90, 100, 110, 120]
  ];

Output: [
    [10, 50, 90],
    [20, 60, 100],
    [30, 70, 110],
    [40, 80, 120]
  ]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const transposeArray = arr => {
  // Write your code here
}
</code>

<solution>
const transposeArray = arr =>
arr.reduce((prev, next) =>
 next.map((item, i) =>
 (prev[i] || []).concat(next[i])
), []);

</solution>

<testcases>
<caller>
console.log(transposeArray(arr));
</caller>
<testcase>
<i>
const arr = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
];
</i>
</testcase>
<testcase>
<i>
const arr = [
    [11, 22, 33],
    [44, 55, 66],
    [77, 88, 99]
];
</i>
</testcase>
</testcases>
</codeblock>
