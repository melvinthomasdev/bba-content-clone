Check whether all numbers in the given array are a multiple of the given number.

1. Check whether all the numbers in the given array are a multiple of the given number.
2. The array will be a plain array with numbers.
3. Return `true` if all the numbers in the array are a multiple of the given number.

For example:
```js
Input:
list = [9, 27, 3, 18, 72, 102];
divisor = 3;

Output:
true
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const areElementsDivisible = ({ list, divisor }) => // write your code here
</code>

<solution>
const areElementsDivisible = ({ list, divisor }) => list.every(num => num % divisor === 0);
</solution>

<testcases>
<caller>
console.log(areElementsDivisible({ list, divisor }));
</caller>
<testcase>
<i>
const list = [2, 4, 3, 6];
const divisor = 2;
</i>
</testcase>
<testcase>
<i>
const list = [9, 27, 3, 18, 72, 102];
const divisor = 3;
</i>
</testcase>
<testcase>
<i>
const list = [437, 95, 152, 228, 342];
const divisor = 19;
</i>
</testcase>
<testcase>
<i>
const list = [147, 224, 287, 725, 973];
const divisor = 17;
</i>
</testcase>
</testcases>
</codeblock>
