The function `sumExtremes`
should return the sum
of the **first** and the **last** elements
of the given array.
If the array is empty,
return `0`.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const sumExtremes = arr => // write your code here
</code>

<solution>
const sumExtremes = arr => arr.length > 0 ? arr[0] + arr[arr.length - 1] : 0
</solution>

<testcases>
<caller>
console.log(sumExtremes(arr));
</caller>
<testcase>
<i>
const arr = [1, 2, 3, 4, 5];
</i>
</testcase>
<testcase>
<i>
const arr = [10];
</i>
</testcase>
<testcase>
<i>
const arr = [];
</i>
</testcase>
<testcase>
<i>
const arr = [1, 2, 3, 4, -4, -3, -2, -1];
</i>
</testcase>
</testcases>
</codeblock>