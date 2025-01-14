The function `add`
should return the sum of
the given two numbers.
If one or
both of the inputs are **not** valid numbers,
return the string `Invalid Input`.

```js
Input: x = "a", y = 10

Output: `Invalid Input`
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const add = ({ x, y }) => // write your code here
</code>

<solution>
const add = ({ x, y }) => (isNaN(x) || isNaN(y)) ? "Invalid Input" : Number(x) + Number(y)
</solution>

<testcases>
<caller>
console.log(add({ x, y }));
</caller>
<testcase>
<i>
const x = 10;
const y = 20;
</i>
</testcase>
<testcase>
<i>
const x = "100";
const y = 20;
</i>
</testcase>
<testcase>
<i>
const x = "100 + x";
const y = 20;
</i>
</testcase>
<testcase>
<i>
const x = "x";
const y = 20;
</i>
</testcase>
</testcases>
</codeblock>
