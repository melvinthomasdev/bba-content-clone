The function `checkExamResult` returns
**Pass** if the marks obtained is more than or equal to **45**,
otherwise it returns **Fail**.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function checkExamResult(marks) {
  // write your code here
}
</code>

<solution>
function checkExamResult(marks) {
  return marks >= 45 ? "Pass" : "Fail";
}
</solution>

<testcases>
<caller>
console.log(checkExamResult(marks));
</caller>
<testcase>
<i>
const marks = 90;
</i>
</testcase>
<testcase>
<i>
const marks = 5;
</i>
</testcase>
<testcase>
<i>
const marks = 45;
</i>
</testcase>
<testcase>
<i>
const marks = 85;
</i>
</testcase>
</testcases>
</codeblock>
