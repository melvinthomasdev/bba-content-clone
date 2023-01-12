The function `add` should return the sum of two given numbers, containing exactly 2 decimal points.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const add = ({ a, b }) => {
  // your code here
}
</code>

<solution>
const add = ({ a, b }) => {
  const result = Number(a) + Number(b);
  return result.toFixed(2);
}
</solution>

<testcases>
<caller>
console.log(add({ a, b }));
</caller>
<testcase>
<i>
const a = 0.205;
const b = 0.312;
</i>
</testcase>
<testcase>
<i>
const a = '1';
const b = '2';
</i>
</testcase>
<testcase>
<i>
const a = '0.7';
const b = 0.3;
</i>
</testcase>
</testcases>
</codeblock>