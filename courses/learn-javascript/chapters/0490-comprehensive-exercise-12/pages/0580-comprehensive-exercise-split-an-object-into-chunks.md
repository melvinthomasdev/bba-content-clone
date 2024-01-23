The function `keysAndValues` should return the keys and values as separate arrays.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const keysAndValues = obj => {
  // your code here
};
</code>

<solution>
const keysAndValues = obj => [Object.keys(obj), Object.values(obj)];
</solution>

<testcases>
<caller>
console.log(keysAndValues(obj));
</caller>
<testcase>
<i>
const obj = {
  apple: 100,
  banana: 60,
  orange: 120,
  kiwi: 250,
};
</i>
</testcase>
<testcase>
<i>
const obj = {
  Bruce: 32,
  Tony: 42,
  Natasha: 52,
  Steve: 62,
  Thor: 72,
  Clint: 82,
};
</i>
</testcase>
</testcases>
</codeblock>