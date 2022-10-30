The function `compactArray` should clear array from all unnecessary elements, like false, undefined, empty strings, zero, null.

1. Return stringified object.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const compactArray = (arr) => {
  // your code here
};
</code>

<solution>
const compactArray = (arr) => JSON.stringify(arr.filter((el) => el));
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
</Editor>