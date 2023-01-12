The function `isEmpty` should return `true` if an object is empty else return `false`.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const isEmpty = obj => {
  // your code here
};
</code>

<solution>
const isEmpty = obj => {
  if (obj == null) return true;
  
  return Object.keys(obj).length === 0 && obj.constructor === Object;
};
</solution>

<testcases>
<caller>
console.log(isEmpty(obj));
</caller>
<testcase>
<i>
const obj = {};
</i>
</testcase>
<testcase>
<i>
const obj = null;
</i>
</testcase>
<testcase>
<i>
const obj = undefined;
</i>
</testcase>
<testcase>
<i>
const obj = {1:'hello'}
</i>
</testcase>
<testcase>
<i>
const obj = new Number();
</i>
</testcase>
<testcase>
<i>
const obj = new Date();
</i>
</testcase>
</testcases>
</codeblock>