Declare a function to
return the sum of all the numbers
in the array.
If the array is empty, return `0`.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const sum = list => // write your code here
</code>

<solution>
const sum = list => list.reduce((sum, num) => sum + num, 0)
</solution>

<testcases>
<caller>
console.log(sum(list));
</caller>
<testcase>
<i>
const list = [4, 5, -9, 19, 110];
</i>
</testcase>
<testcase>
<i>
const list = [2, 15, 9, 18];
</i>
</testcase>
<testcase>
<i>
const list = [12, -15, 19, 58];
</i>
</testcase>
<testcase>
<i>
const list = [];
</i>
</testcase>
</testcases>
</codeblock>
