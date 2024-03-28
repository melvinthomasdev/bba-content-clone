The function `getDaysCount` should return the number of days in a given month.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getDaysCount = ({ month, year }) => // your code here
</code>

<solution>
const getDaysCount = ({ month, year }) => new Date(year, month, 0).getDate()
</solution>

<testcases>
<caller>
console.log(getDaysCount({ month, year }));
</caller>
<testcase>
<i>
const month = 2;
const year = 2000;
</i>
</testcase>
<testcase>
<i>
const month = 2;
const year = 1977;
</i>
</testcase>
<testcase>
<i>
const month = 7;
const year = 2011;
</i>
</testcase>
<testcase>
<i>
const month = 10;
const year = 2020;
</i>
</testcase>
</testcases>
</codeblock>