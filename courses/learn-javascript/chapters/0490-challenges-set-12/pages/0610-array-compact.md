The function `compactArray` should clear the array from all unnecessary elements, like `false`, `undefined`, empty strings, `0`, and `null`.

For example:
```js
Input:
const arr = [1, null, "", 1, false, 1];

Output:
[1,1,1]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const compactArray = arr => {
  // your code here
};
</code>

<solution>
const compactArray = arr => arr.filter(el => el);
</solution>

<testcases>
<caller>
console.log(compactArray(arr));
</caller>
<testcase>
<i>
const arr = [0, 1, false, 2, undefined, "", 3, null];
</i>
</testcase>
<testcase>
<i>
const arr = [1, 5, 7, undefined, null, 9, false];
</i>
</testcase>
<testcase>
<i>
const arr = [1, null, "", 1, false, 1];
</i>
</testcase>
<testcase>
<i>
const arr = [null, undefined, "", false];
</i>
</testcase>
</testcases>
</codeblock>
