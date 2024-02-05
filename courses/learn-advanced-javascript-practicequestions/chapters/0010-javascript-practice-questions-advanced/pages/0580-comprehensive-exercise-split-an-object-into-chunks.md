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
<testcase>
<i>
const obj = {
  Sam: 12,
  Eve: 52,
  Lao: 56,
  Linh: 70,
  Chinua: 20,
  Renu: 18,
};
</i>
</testcase>
<testcase>
<i>
const obj = {
  Sam: 33,
  Eve: 45,
  Lao: 56,
  Linh: 69,
  Chinua: 88,
  Renu: 100,
};
</i>
</testcase>
</testcases>
</codeblock>
