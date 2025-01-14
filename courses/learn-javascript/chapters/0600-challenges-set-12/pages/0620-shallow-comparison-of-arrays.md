The function `compareArray` should do a shallow comparison of two arrays `arr1`, `arr2` and return `true` if they are identical.

For example:
```js
Input:
const arr1 = [1, 2, 3, 4];
const arr2 = [1, 2, 3, 4];

Output:
true
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const compareArray = ({ arr1, arr2 })  => {
  // your code here
};
</code>

<solution>
const compareArray = ({ arr1, arr2 }) => {
  if (arr1.length === 0 || arr2.length === 0) return false;

  if (arr1.length !== arr2.length) return false;

  return arr1.every((el, idx) => arr2[idx] === el);
};
</solution>

<testcases>
<caller>
console.log(compareArray({ arr1, arr2 }));
</caller>
<testcase>
<i>
const arr1 = [1, 2, 3, 4];
const arr2 = [1, 2, 3, 4];
</i>
</testcase>
<testcase>
<i>
const arr1 = ["Miami", "Pune", "Kochi"];
const arr2 = ["Kochi", "Miami", "Pune"];
</i>
</testcase>
<testcase>
<i>
const arr1 = [1, 2, 3];
const arr2 = [1, 2, 3, 4, 5];
</i>
</testcase>
<testcase>
<i>
const arr1 = [];
const arr2 = [1, 2, 3, 4, 5];
</i>
</testcase>
</testcases>
</codeblock>
