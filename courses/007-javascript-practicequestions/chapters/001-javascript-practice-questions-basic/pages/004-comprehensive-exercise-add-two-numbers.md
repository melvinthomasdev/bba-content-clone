Declare a function `add`
to return the sum of
the given two numbers.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const add = function(x, y) {
  // write your code here
}
</code>

<solution>
const add = function(x, y) {
  return Number(x) + Number(y);
}
</solution>

<testcases>
<caller>
console.log(add(x, y));
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
const x = "100";
const y = "20";
</i>
</testcase>
<testcase>
<i>
const x = 100;
const y = "20";
</i>
</testcase>
</testcases>
</Editor>