Complete the JavaScript function to count the number of arrays inside a given array.

For example:

```text
Input: arr = [1,[2],[4]]
Output: 2
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const countArrays = arr => {
  // write your code here
}
</code>

<solution>
  const countArrays = arr => arr.filter(item => Array.isArray(item)).length;
</solution>

<testcases>
<caller>
console.log(countArrays(arr))
</caller>
<testcase>
<i>
const arr = [2, 8, [6], 3, 3, 5, 3, 4, [5, 4]];
</i>
</testcase>
<testcase>
<i>
const arr = [[], [], [6], []];
</i>
</testcase>
<testcase>
<i>
const arr = [1, 2, 3, 5];
</i>
</testcase>
</testcases>
</codeblock>
