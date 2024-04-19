The function `foldingPaper` should return the thickness (in meters) of a piece of paper after folding it n number of times.

1. The paper starts off with a thickness of 0.0005m.
2. After each fold, the thickness changes by 2^n.

For example:
```js
Input:
const n = 2;

Output:
'0.002m'
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const foldingPaper = n => {
  // your code here
};
</code>

<solution>
const foldingPaper = n => {
  const initialThickness = 0.0005;
  return `${initialThickness * Math.pow(2, n)}m`;
};
</solution>

<testcases>
<caller>
console.log(foldingPaper(n));
</caller>
<testcase>
<i>
const n = 1;
</i>
</testcase>
<testcase>
<i>
const n = 4;
</i>
</testcase>
<testcase>
<i>
const n = 8;
</i>
</testcase>
<testcase>
<i>
const n = 21;
</i>
</testcase>
</testcases>
</codeblock>
