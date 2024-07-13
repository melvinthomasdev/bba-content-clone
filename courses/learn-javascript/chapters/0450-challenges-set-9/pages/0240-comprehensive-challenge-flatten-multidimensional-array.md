Complete the JavaScript function to flatten a multi-dimensional array into a single-dimensional array.

For example:

```text
Input: arr = [1,[0,[3,[8]]]]

Output: [1,0,3,8]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const arrayFlatten = arr => {
  // Write your code here
}
</code>

<solution>
const arrayFlatten = arr => {
  return arr.reduce((acc, val) => Array.isArray(val) ? acc.concat(arrayFlatten(val)) : acc.concat(val), []);
}
</solution>

<testcases>
<caller>
console.log(arrayFlatten(arr));
</caller>
<testcase>
<i>
const arr = [2,[3,[2,[8]]],[3,3,[9]]];
</i>
</testcase>
<testcase>
<i>
const arr = [1,[2],[3,5]]
</i>
</testcase>
</testcases>
</codeblock>
