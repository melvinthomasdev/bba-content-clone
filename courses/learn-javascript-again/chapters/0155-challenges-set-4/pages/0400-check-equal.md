The function **isEqualTo100** should return **true** if one of the
numbers is equal to **100** or
if their sum is equal to 100.
Otherwise, it returns **false**.

```js
Input: num1 = 10, num2 = 50

Output: false
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const isEqualTo100 = (num1, num2) => {
  // write your code here
}
</code>

<solution>
const isEqualTo100 = (num1, num2) => {
  return num1 === 100 || num2 === 100 || num1 + num2 === 100;
}
</solution>

<testcases>
<caller>
console.log(isEqualTo100(num1, num2));
</caller>
<testcase>
<i>
const num1 = 100;
const num2 = 0;
</i>
</testcase>
<testcase>
<i>
const num1 = 50;
const num2 = 50;
</i>
</testcase>
<testcase>
<i>
const num1 = 40;
const num2 = 50;
</i>
</testcase>
<testcase>
<i>
const num1 = 80;
const num2 = 20;
</i>
</testcase>
</testcases>
</codeblock>
