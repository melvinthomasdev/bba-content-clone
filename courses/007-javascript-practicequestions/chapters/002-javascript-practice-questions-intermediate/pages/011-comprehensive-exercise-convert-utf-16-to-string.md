The function `convertToString` should return characters created from the given sequence of UTF-16 code units.

1. There could be any number of inputs with minimum of 1.
2. Concatinate and return the final string.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function convertToString() {
  // your code here
}
</code>

<solution>
function convertToString(...codes) {
  return String.fromCharCode(...codes)
}
</solution>

<testcases>
<caller>
console.log(convertToString(...codes));
</caller>
<testcase>
<i>
const codes = [73, 20, 76, 111, 118, 101, 20, 74, 83];
</i>
</testcase>
<testcase>
<i>
const codes = [66, 105, 103, 20, 66, 105, 110, 97, 114, 121];
</i>
</testcase>
</testcases>
</Editor>