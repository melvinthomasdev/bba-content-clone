The function `convertBase` should convert a given number to a specific given base.

1. Expected bases for the inputs will be either binary or octal or decimal or hexadecimal.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function convertBase(value, currentBase, newBase) {
  // your code here
}
</code>

<solution>
function convertBase(value, currentBase, newBase) {
  return parseInt(value + "", currentBase).toString(newBase);
}
</solution>

<testcases>
<caller>
console.log(convertBase(value, currentBase, newBase));
</caller>
<testcase>
<i>
const value = '7B';
  const currentBase = 16
  const newBase = 10
</i>
</testcase>
<testcase>
<i>
const value = '9012';
  const currentBase = 10
  const newBase = 2
</i>
</testcase>
<testcase>
<i>
const value = '154D';
  const currentBase = 16
  const newBase = 8
</i>
</testcase>
</testcases>
</Editor>